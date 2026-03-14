import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/features/auth/providers/auth_provider.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:isar/isar.dart';
import 'package:mesmer_app/shared/models/app_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final linkedEnterpriseProvider = FutureProvider.autoDispose<Enterprise?>((ref) async {
  final userResponse = ref.watch(currentUserProvider);
  if (userResponse == null) return null;

  // 1. Check Supabase metadata first (source of truth for linking)
  final metadata = userResponse.userMetadata;
  final linkedId = metadata?['linked_enterprise_id'] as String?;

  if (linkedId != null && linkedId.isNotEmpty) {
    return IsarService.enterprises
        .filter()
        .uuidEqualTo(linkedId)
        .findFirst();
  }

  // 2. Auto-Link by Email: If no metadata link, check for enterprise with matching ownerEmail
  final userEmail = userResponse.email;
  if (userEmail != null) {
    final autoLinkedEnterprise = await IsarService.enterprises
        .filter()
        .ownerEmailEqualTo(userEmail, caseSensitive: false)
        .findFirst();

    if (autoLinkedEnterprise != null) {
      // Proactively persist the link to metadata and local Isar
      // We do this in the background to avoid blocking the first UI render
      _persistAutoLink(ref, userResponse.id, autoLinkedEnterprise);
      return autoLinkedEnterprise;
    }
  }

  // 3. Fallback: Check local Isar AppUser just in case (e.g. offline linking previously)
  final appUser = await IsarService.users
      .filter()
      .supabaseIdEqualTo(userResponse.id)
      .findFirst();
  
  if (appUser?.linkedEnterpriseId != null) {
    return IsarService.enterprises
        .filter()
        .uuidEqualTo(appUser!.linkedEnterpriseId!)
        .findFirst();
  }

  return null;
});

/// Helper to persist an automatically discovered link
Future<void> _persistAutoLink(Ref ref, String userId, Enterprise enterprise) async {
  try {
    // Update local Isar
    final appUser = await IsarService.users
        .filter()
        .supabaseIdEqualTo(userId)
        .findFirst();
    if (appUser != null) {
      await IsarService.write((isar) async {
        appUser.linkedEnterpriseId = enterprise.uuid;
        await isar.appUsers.put(appUser);
        
        // Ensure enterprise also points to owner for messaging
        enterprise.ownerId = userId;
        await isar.enterprises.put(enterprise);
      });
    }

    // Update Supabase metadata
    await Supabase.instance.client.auth.updateUser(
      UserAttributes(
        data: {'linked_enterprise_id': enterprise.uuid},
      ),
    );
    
    // Invalidate auth so metadata changes are picked up by the rest of the app
    ref.invalidate(authStateProvider);
  } catch (e) {
    // Silently fail, it will try again next time provider runs if needed
    // ignore: avoid_print
    print('Auto-link persistence failed: $e');
  }
}
