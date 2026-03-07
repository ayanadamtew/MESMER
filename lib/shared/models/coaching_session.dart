import 'package:isar/isar.dart';

part 'coaching_session.g.dart';

enum SessionType { initial, followUp, final_, emergency }
enum SessionStatus { scheduled, active, completed, cancelled }

@collection
class CoachingSession {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  late String enterpriseId;
  late String coachId;

  @Enumerated(EnumType.name)
  SessionType sessionType = SessionType.initial;

  @Enumerated(EnumType.name)
  SessionStatus status = SessionStatus.scheduled;

  late DateTime scheduledAt;
  DateTime? conductedAt;
  int? durationMinutes;

  String? notes;
  String? recommendations;
  String? nextSteps;

  // URIs to uploaded media files in Supabase Storage
  List<String> mediaUris = [];

  // Local file paths pending upload
  List<String> pendingMediaPaths = [];

  bool isSynced = false;
  DateTime? syncedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
}
