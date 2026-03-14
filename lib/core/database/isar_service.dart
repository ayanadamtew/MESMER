import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:mesmer_app/shared/models/app_user.dart';
import 'package:mesmer_app/shared/models/enterprise.dart';
import 'package:mesmer_app/shared/models/diagnosis_assessment.dart';
import 'package:mesmer_app/shared/models/coaching_session.dart';
import 'package:mesmer_app/shared/models/progress_indicator_record.dart';
import 'package:mesmer_app/shared/models/training_schedule.dart';
import 'package:mesmer_app/shared/models/message.dart';

class IsarService {
  IsarService._();

  static late final Isar _isar;
  static Isar get instance => _isar;

  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [
        AppUserSchema,
        EnterpriseSchema,
        DiagnosisAssessmentSchema,
        CoachingSessionSchema,
        ProgressIndicatorRecordSchema,
        TrainingScheduleSchema,
        MessageSchema,
      ],
      directory: dir.path,
      name: 'mesmer_db',
    );
  }

  // Convenience getters for each collection
  static IsarCollection<AppUser> get users => _isar.appUsers;
  static IsarCollection<Enterprise> get enterprises => _isar.enterprises;
  static IsarCollection<DiagnosisAssessment> get assessments =>
      _isar.diagnosisAssessments;
  static IsarCollection<CoachingSession> get sessions =>
      _isar.coachingSessions;
  static IsarCollection<ProgressIndicatorRecord> get progressRecords =>
      _isar.progressIndicatorRecords;
  static IsarCollection<TrainingSchedule> get trainings =>
      _isar.trainingSchedules;
  static IsarCollection<Message> get messages => _isar.messages;

  // Generic write helper
  static Future<void> write(Future<void> Function(Isar) actions) async {
    await _isar.writeTxn(() => actions(_isar));
  }
}
