import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import 'package:mesmer_app/core/database/isar_service.dart';
import 'package:mesmer_app/core/network/connectivity_service.dart';
import 'package:mesmer_app/features/enterprise/repositories/merl_repository.dart';
import 'package:mesmer_app/shared/models/progress_indicator_record.dart';

final progressProvider = AsyncNotifierProviderFamily<ProgressNotifier,
    List<ProgressIndicatorRecord>, String>(
  ProgressNotifier.new,
);

class ProgressNotifier
    extends FamilyAsyncNotifier<List<ProgressIndicatorRecord>, String> {
  @override
  Future<List<ProgressIndicatorRecord>> build(String enterpriseId) async {
    return IsarService.progressRecords
        .filter()
        .enterpriseIdEqualTo(enterpriseId)
        .sortByRecordedAt()
        .findAll();
  }

  Future<void> addRecord({
    required String enterpriseId,
    double? bookkeepingScore,
    double? salesVolume,
    LoanRepaymentStatus loanStatus = LoanRepaymentStatus.nLoan,
  }) async {
    final record = ProgressIndicatorRecord()
      ..uuid = const Uuid().v4()
      ..enterpriseId = enterpriseId
      ..recordedBy = 'current-coach-id'
      ..recordedAt = DateTime.now()
      ..bookkeepingScore = bookkeepingScore
      ..salesVolume = salesVolume
      ..loanRepaymentStatus = loanStatus
      ..isSynced = false;

    await IsarService.write((isar) async {
      await isar.progressIndicatorRecords.put(record);
    });

    state = AsyncData(
      await IsarService.progressRecords
          .filter()
          .enterpriseIdEqualTo(enterpriseId)
          .sortByRecordedAt()
          .findAll(),
    );

    if (await ConnectivityService.isConnected()) {
      final repo = ref.read(merlRepositoryProvider);
      await repo.pushProgressRecord(record);
      await IsarService.write((isar) async {
        record.isSynced = true;
        record.syncedAt = DateTime.now();
        await isar.progressIndicatorRecords.put(record);
      });
    }
  }
}
