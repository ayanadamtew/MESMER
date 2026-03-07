import 'package:isar/isar.dart';

part 'progress_indicator_record.g.dart';

enum LoanRepaymentStatus { onTrack, delayed, defaulted, nLoan }

@collection
class ProgressIndicatorRecord {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  late String enterpriseId;
  late String recordedBy;
  late DateTime recordedAt;

  // Bookkeeping score (0.0 – 100.0) based on assessment
  double? bookkeepingScore;

  // Loan repayment status
  @Enumerated(EnumType.name)
  LoanRepaymentStatus loanRepaymentStatus = LoanRepaymentStatus.nLoan;

  // Sales data
  double? salesVolume;
  double? salesGrowthPercent;

  // Additional indicators
  double? revenueAmount;
  int? numberOfCustomers;
  int? employeeCount;

  String? notes;

  bool isSynced = false;
  DateTime? syncedAt;
}
