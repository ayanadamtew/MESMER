import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:mesmer_app/core/config/router_config.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/shared/models/app_user.dart';
import 'package:mesmer_app/features/auth/providers/auth_provider.dart';
import 'package:mesmer_app/shared/theme/app_theme.dart';
import 'package:mesmer_app/core/utils/toast_service.dart';

class EnterpriseLinkingScreen extends ConsumerStatefulWidget {
  const EnterpriseLinkingScreen({super.key});

  @override
  ConsumerState<EnterpriseLinkingScreen> createState() => _EnterpriseLinkingScreenState();
}

class _EnterpriseLinkingScreenState extends ConsumerState<EnterpriseLinkingScreen> {
  final _codeCtrl = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _codeCtrl.dispose();
    super.dispose();
  }

  Future<void> _linkAccount() async {
    final code = _codeCtrl.text.trim().toUpperCase();
    if (code.isEmpty) {
      ToastService.showError(context, 'Please enter an invite code.');
      return;
    }

    setState(() => _isLoading = true);

    try {
      // 1. Find the enterprise by inviteCode in Isar
      final enterprise = await IsarService.enterprises
          .filter()
          .inviteCodeEqualTo(code)
          .findFirst();

      if (enterprise == null) {
        ToastService.showError(context, 'Invalid invite code. Ask your coach to verify the code.');
        setState(() => _isLoading = false);
        return;
      }

      // 2. Update the AppUser in Isar
      final userResponse = ref.read(currentUserProvider);
      if (userResponse == null) throw Exception('User not logged in');
      
      final appUser = await IsarService.users
          .filter()
          .supabaseIdEqualTo(userResponse.id)
          .findFirst();

      if (appUser != null) {
        await IsarService.write((isar) async {
          appUser.linkedEnterpriseId = enterprise.uuid;
          await isar.appUsers.put(appUser);
          
          // Also link the owner ID to the enterprise for messaging
          enterprise.ownerId = userResponse.id;
          await isar.enterprises.put(enterprise);
        });
      }

      // 3. Update Supabase user metadata
      await Supabase.instance.client.auth.updateUser(
        UserAttributes(
          data: {'linked_enterprise_id': enterprise.uuid},
        ),
      );

      // Force router state refresh by invalidating auth
      ref.invalidate(authStateProvider);

      if (!mounted) return;
      ToastService.showSuccess(context, 'Successfully linked to ${enterprise.businessName}!');
      context.go(AppRoutes.enterpriseHome);
    } catch (e) {
      if (!mounted) return;
      ToastService.showError(context, 'Failed to link account: $e');
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Link Business'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            onPressed: () => ref.read(authNotifierProvider.notifier).signOut(),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.link_rounded,
                size: 80,
                color: AppColors.primary,
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                'Link Your Business',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textPrimaryDark,
                    ),
              ),
              const SizedBox(height: AppSpacing.sm),
              const Text(
                'Enter the 6-character invite code provided by your business coach to connect your account.',
                textAlign: TextAlign.center,
                style: TextStyle(color: AppColors.textSecondaryLight),
              ),
              const SizedBox(height: AppSpacing.xxl),
              TextField(
                controller: _codeCtrl,
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.characters,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8,
                ),
                decoration: InputDecoration(
                  hintText: 'XXXXXX',
                  hintStyle: TextStyle(
                    color: AppColors.textSecondaryLight.withValues(alpha: 0.5),
                  ),
                  filled: true,
                  fillColor: AppColors.cardDark,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(AppRadius.lg),
                    borderSide: const BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _linkAccount,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                        )
                      : const Text('Link Account', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
