import 'package:isar/isar.dart';

part 'diagnosis_assessment.g.dart';

@collection
class DiagnosisAssessment {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  late String enterpriseId;
  late String coachId;
  late DateTime assessedAt;

  // Scores per category (0.0 – 100.0)
  double financeScore = 0.0;
  double marketingScore = 0.0;
  double hrScore = 0.0;
  double operationsScore = 0.0;
  double governanceScore = 0.0;

  // Serialized JSON of all checklist item answers
  // Format: {"finance": {"has_bookkeeping": true, "tracks_expenses": false, ...}, ...}
  late String checklistJson;

  // Ordered list of priority challenge category names
  List<String> priorityChallenges = [];

  // Optional coach notes on this assessment
  String? notes;

  bool isSynced = false;
  DateTime? syncedAt;
}

// Checklist categories
enum DiagnosisCategory { finance, marketing, hr, operations, governance }

// Individual checklist question model (not stored in Isar, used in UI logic)
class ChecklistItem {
  const ChecklistItem({
    required this.id,
    required this.category,
    required this.question,
    this.weight = 1.0,
  });

  final String id;
  final DiagnosisCategory category;
  final String question;
  final double weight;

  // Answer: true = yes, false = no, null = not answered
}
