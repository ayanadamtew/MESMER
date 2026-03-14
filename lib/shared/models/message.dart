import 'package:isar/isar.dart';

part 'message.g.dart';

@collection
class Message {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? uuid;

  @Index()
  late String senderId; // AppUser ID of the sender

  late String receiverId; // AppUser ID of the receiver

  @Index()
  late String enterpriseId; // Links this chat to a specific business context

  late String text;

  @Index()
  late DateTime sentAt;

  // Supabase sync metadata
  DateTime? lastSyncedAt;
  bool isDeleted = false;
}
