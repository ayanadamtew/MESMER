import 'package:isar/isar.dart';

part 'enterprise.g.dart';

enum BusinessSector {
  agriculture,
  manufacturing,
  trade,
  services,
  technology,
  construction,
  healthcare,
  education,
  other,
}

enum BaselineStatus { assessed, pending, notStarted }

@collection
class Enterprise {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  // Basic Info
  late String businessName;
  late String ownerName;
  String? ownerPhone;
  String? ownerEmail;
  String? ownerGender;
  int? ownerAge;

  // Business Info
  @Enumerated(EnumType.name)
  late BusinessSector sector;

  String? subsector;
  int? employeeCount;
  int? yearFounded;
  double? annualRevenue;

  // Location
  String? streetAddress;
  String? city;
  String? district;
  String? region;
  String? country;
  double? latitude;
  double? longitude;

  // Baseline
  @Enumerated(EnumType.name)
  BaselineStatus baselineStatus = BaselineStatus.notStarted;

  double? baselineBookkeepingScore;
  String? baselineLoanStatus;
  double? baselineSalesVolume;

  // MERL Integration
  String? merlId;
  bool isSynced = false;
  DateTime? syncedAt;

  // Metadata
  late String coachId;
  late DateTime enrolledAt;
  DateTime? updatedAt;
}
