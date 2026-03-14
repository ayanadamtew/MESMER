import 'package:isar/isar.dart';

part 'training_schedule.g.dart';

enum TrainingType {
  workshop,
  seminar,
  fieldVisit,
  groupTraining,
  oneOnOne,
  online,
  other,
}

@collection
class TrainingSchedule {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  late String enterpriseId;
  late String coachId;

  late String title;
  String? description;
  String? location;

  @Enumerated(EnumType.name)
  TrainingType trainingType = TrainingType.workshop;

  late DateTime scheduledAt;
  int durationMinutes = 60;

  bool isCompleted = false;
  DateTime? completedAt;

  // Reminder settings
  bool reminderSent = false;
  int reminderMinutesBefore = 60; // Default: 1 hour before

  late DateTime createdAt;
  DateTime? updatedAt;

  bool isSynced = false;
  DateTime? syncedAt;
}
