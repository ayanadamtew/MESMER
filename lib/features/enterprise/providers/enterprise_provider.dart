import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/features/enterprise/repositories/merl_repository.dart';
import 'package:mesmer_app/core/network/connectivity_service.dart';

final enterpriseListProvider =
    AsyncNotifierProvider<EnterpriseListNotifier, List<Enterprise>>(
  EnterpriseListNotifier.new,
);

class EnterpriseListNotifier extends AsyncNotifier<List<Enterprise>> {
  @override
  Future<List<Enterprise>> build() async {
    return IsarService.enterprises.where().findAll();
  }

  Future<void> addEnterprise(Enterprise enterprise) async {
    enterprise.uuid = const Uuid().v4();
    enterprise.enrolledAt = DateTime.now();
    enterprise.isSynced = false;

    await IsarService.write((isar) async {
      await isar.enterprises.put(enterprise);
    });

    state = AsyncData(await IsarService.enterprises.where().findAll());

    // Attempt cloud sync if online
    if (await ConnectivityService.isConnected()) {
      final repo = ref.read(merlRepositoryProvider);
      await repo.pushEnterprise(enterprise);

      await IsarService.write((isar) async {
        enterprise.isSynced = true;
        enterprise.syncedAt = DateTime.now();
        await isar.enterprises.put(enterprise);
      });

      state = AsyncData(await IsarService.enterprises.where().findAll());
    }
  }

  Future<void> updateEnterprise(Enterprise enterprise) async {
    enterprise.updatedAt = DateTime.now();
    enterprise.isSynced = false;

    await IsarService.write((isar) async {
      await isar.enterprises.put(enterprise);
    });

    state = AsyncData(await IsarService.enterprises.where().findAll());

    if (await ConnectivityService.isConnected()) {
      final repo = ref.read(merlRepositoryProvider);
      await repo.pushEnterprise(enterprise);
      await IsarService.write((isar) async {
        enterprise.isSynced = true;
        enterprise.syncedAt = DateTime.now();
        await isar.enterprises.put(enterprise);
      });
      state = AsyncData(await IsarService.enterprises.where().findAll());
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
    state = AsyncData(await IsarService.enterprises.where().findAll());
  }
}

final selectedEnterpriseProvider =
    StateProvider<Enterprise?>((ref) => null);
