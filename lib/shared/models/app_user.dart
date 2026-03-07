import 'package:isar/isar.dart';

part 'app_user.g.dart';

enum UserRole { coach, supervisor, admin }

@collection
class AppUser {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String supabaseId;

  late String name;
  late String email;
  String? phone;

  @Enumerated(EnumType.name)
  late UserRole role;

  late DateTime createdAt;
  DateTime? lastSyncedAt;

  String? avatarUrl;
  bool isActive = true;
}
