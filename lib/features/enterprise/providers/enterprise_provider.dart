import 'dart:math';
import 'package:isar/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/features/enterprise/repositories/merl_repository.dart';
import 'package:mesmer_app/features/auth/providers/auth_provider.dart';
import 'package:mesmer_app/core/network/connectivity_service.dart';

String _generateInviteCode() {
  const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final rnd = Random();
  return String.fromCharCodes(Iterable.generate(
      6, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
}

final enterpriseListProvider =
    AsyncNotifierProvider<EnterpriseListNotifier, List<Enterprise>>(
  EnterpriseListNotifier.new,
);

class EnterpriseListNotifier extends AsyncNotifier<List<Enterprise>> {
  @override
  Future<List<Enterprise>> build() async {
    final user = ref.watch(currentUserProvider);
    if (user == null) return [];
    
    return IsarService.enterprises
        .filter()
        .coachIdEqualTo(user.id)
        .findAll();
  }

  Future<void> addEnterprise(Enterprise enterprise) async {
    enterprise.uuid = const Uuid().v4();
    enterprise.inviteCode = _generateInviteCode();
    enterprise.enrolledAt = DateTime.now();
    enterprise.isSynced = false;

    await IsarService.write((isar) async {
      await isar.enterprises.put(enterprise);
    });

    ref.invalidateSelf();

    // Attempt cloud sync if online
    if (await ConnectivityService.isConnected()) {
      try {
        final repo = ref.read(merlRepositoryProvider);
        await repo.pushEnterprise(enterprise);

        await IsarService.write((isar) async {
          enterprise.isSynced = true;
          enterprise.syncedAt = DateTime.now();
          await isar.enterprises.put(enterprise);
        });

        ref.invalidateSelf();
      } catch (e) {
        // Silently fail cloud sync if table doesn't exist, leave isSynced = false
        // ignore: avoid_print
        print('Cloud sync failed: $e');
      }
    }
  }

  Future<void> updateEnterprise(Enterprise enterprise) async {
    enterprise.updatedAt = DateTime.now();
    enterprise.isSynced = false;

    await IsarService.write((isar) async {
      await isar.enterprises.put(enterprise);
    });

    ref.invalidateSelf();

    if (await ConnectivityService.isConnected()) {
      try {
        final repo = ref.read(merlRepositoryProvider);
        await repo.pushEnterprise(enterprise);
        await IsarService.write((isar) async {
          enterprise.isSynced = true;
          enterprise.syncedAt = DateTime.now();
          await isar.enterprises.put(enterprise);
        });
        ref.invalidateSelf();
      } catch (e) {
        // Silently fail cloud sync if table doesn't exist, leave isSynced = false
        // ignore: avoid_print
        print('Cloud sync failed: $e');
      }
    }
  }

  Future<void> syncAllPending() async {
    final pending = await IsarService.enterprises
        .filter()
        .isSyncedEqualTo(false)
        .findAll();

    if (pending.isEmpty) return;
    final repo = ref.read(merlRepositoryProvider);

    for (final e in pending) {
      try {
        await repo.pushEnterprise(e);
        await IsarService.write((isar) async {
          e.isSynced = true;
          e.syncedAt = DateTime.now();
          await isar.enterprises.put(e);
        });
      } catch (_) {
        // Continue trying other records
      }
    }
    ref.invalidateSelf();
  }
}

final selectedEnterpriseProvider =
    StateProvider<Enterprise?>((ref) => null);
