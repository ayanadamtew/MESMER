// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enterprise.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetEnterpriseCollection on Isar {
  IsarCollection<Enterprise> get enterprises => this.collection();
}

const EnterpriseSchema = CollectionSchema(
  name: r'Enterprise',
  id: 160715648260485538,
  properties: {
    r'annualRevenue': PropertySchema(
      id: 0,
      name: r'annualRevenue',
      type: IsarType.double,
    ),
    r'baselineBookkeepingScore': PropertySchema(
      id: 1,
      name: r'baselineBookkeepingScore',
      type: IsarType.double,
    ),
    r'baselineLoanStatus': PropertySchema(
      id: 2,
      name: r'baselineLoanStatus',
      type: IsarType.string,
    ),
    r'baselineSalesVolume': PropertySchema(
      id: 3,
      name: r'baselineSalesVolume',
      type: IsarType.double,
    ),
    r'baselineStatus': PropertySchema(
      id: 4,
      name: r'baselineStatus',
      type: IsarType.string,
      enumMap: _EnterprisebaselineStatusEnumValueMap,
    ),
    r'businessName': PropertySchema(
      id: 5,
      name: r'businessName',
      type: IsarType.string,
    ),
    r'city': PropertySchema(
      id: 6,
      name: r'city',
      type: IsarType.string,
    ),
    r'coachId': PropertySchema(
      id: 7,
      name: r'coachId',
      type: IsarType.string,
    ),
    r'country': PropertySchema(
      id: 8,
      name: r'country',
      type: IsarType.string,
    ),
    r'district': PropertySchema(
      id: 9,
      name: r'district',
      type: IsarType.string,
    ),
    r'employeeCount': PropertySchema(
      id: 10,
      name: r'employeeCount',
      type: IsarType.long,
    ),
    r'enrolledAt': PropertySchema(
      id: 11,
      name: r'enrolledAt',
      type: IsarType.dateTime,
    ),
    r'inviteCode': PropertySchema(
      id: 12,
      name: r'inviteCode',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 13,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'latitude': PropertySchema(
      id: 14,
      name: r'latitude',
      type: IsarType.double,
    ),
    r'longitude': PropertySchema(
      id: 15,
      name: r'longitude',
      type: IsarType.double,
    ),
    r'merlId': PropertySchema(
      id: 16,
      name: r'merlId',
      type: IsarType.string,
    ),
    r'ownerAge': PropertySchema(
      id: 17,
      name: r'ownerAge',
      type: IsarType.long,
    ),
    r'ownerEmail': PropertySchema(
      id: 18,
      name: r'ownerEmail',
      type: IsarType.string,
    ),
    r'ownerGender': PropertySchema(
      id: 19,
      name: r'ownerGender',
      type: IsarType.string,
    ),
    r'ownerId': PropertySchema(
      id: 20,
      name: r'ownerId',
      type: IsarType.string,
    ),
    r'ownerName': PropertySchema(
      id: 21,
      name: r'ownerName',
      type: IsarType.string,
    ),
    r'ownerPhone': PropertySchema(
      id: 22,
      name: r'ownerPhone',
      type: IsarType.string,
    ),
    r'region': PropertySchema(
      id: 23,
      name: r'region',
      type: IsarType.string,
    ),
    r'sector': PropertySchema(
      id: 24,
      name: r'sector',
      type: IsarType.string,
      enumMap: _EnterprisesectorEnumValueMap,
    ),
    r'streetAddress': PropertySchema(
      id: 25,
      name: r'streetAddress',
      type: IsarType.string,
    ),
    r'subsector': PropertySchema(
      id: 26,
      name: r'subsector',
      type: IsarType.string,
    ),
    r'syncedAt': PropertySchema(
      id: 27,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
    r'updatedAt': PropertySchema(
      id: 28,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 29,
      name: r'uuid',
      type: IsarType.string,
    ),
    r'yearFounded': PropertySchema(
      id: 30,
      name: r'yearFounded',
      type: IsarType.long,
    )
  },
  estimateSize: _enterpriseEstimateSize,
  serialize: _enterpriseSerialize,
  deserialize: _enterpriseDeserialize,
  deserializeProp: _enterpriseDeserializeProp,
  idName: r'id',
  indexes: {
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'ownerEmail': IndexSchema(
      id: -82102301092295674,
      name: r'ownerEmail',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'ownerEmail',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'inviteCode': IndexSchema(
      id: 1149539950050509013,
      name: r'inviteCode',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'inviteCode',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'ownerId': IndexSchema(
      id: -7594796109721319539,
      name: r'ownerId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'ownerId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'coachId': IndexSchema(
      id: -2707681522534404969,
      name: r'coachId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'coachId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _enterpriseGetId,
  getLinks: _enterpriseGetLinks,
  attach: _enterpriseAttach,
  version: '3.1.0+1',
);

int _enterpriseEstimateSize(
  Enterprise object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.baselineLoanStatus;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.baselineStatus.name.length * 3;
  bytesCount += 3 + object.businessName.length * 3;
  {
    final value = object.city;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.coachId.length * 3;
  {
    final value = object.country;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.district;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.inviteCode;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.merlId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ownerEmail;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ownerGender;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ownerId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.ownerName.length * 3;
  {
    final value = object.ownerPhone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.region;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.sector.name.length * 3;
  {
    final value = object.streetAddress;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.subsector;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _enterpriseSerialize(
  Enterprise object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.annualRevenue);
  writer.writeDouble(offsets[1], object.baselineBookkeepingScore);
  writer.writeString(offsets[2], object.baselineLoanStatus);
  writer.writeDouble(offsets[3], object.baselineSalesVolume);
  writer.writeString(offsets[4], object.baselineStatus.name);
  writer.writeString(offsets[5], object.businessName);
  writer.writeString(offsets[6], object.city);
  writer.writeString(offsets[7], object.coachId);
  writer.writeString(offsets[8], object.country);
  writer.writeString(offsets[9], object.district);
  writer.writeLong(offsets[10], object.employeeCount);
  writer.writeDateTime(offsets[11], object.enrolledAt);
  writer.writeString(offsets[12], object.inviteCode);
  writer.writeBool(offsets[13], object.isSynced);
  writer.writeDouble(offsets[14], object.latitude);
  writer.writeDouble(offsets[15], object.longitude);
  writer.writeString(offsets[16], object.merlId);
  writer.writeLong(offsets[17], object.ownerAge);
  writer.writeString(offsets[18], object.ownerEmail);
  writer.writeString(offsets[19], object.ownerGender);
  writer.writeString(offsets[20], object.ownerId);
  writer.writeString(offsets[21], object.ownerName);
  writer.writeString(offsets[22], object.ownerPhone);
  writer.writeString(offsets[23], object.region);
  writer.writeString(offsets[24], object.sector.name);
  writer.writeString(offsets[25], object.streetAddress);
  writer.writeString(offsets[26], object.subsector);
  writer.writeDateTime(offsets[27], object.syncedAt);
  writer.writeDateTime(offsets[28], object.updatedAt);
  writer.writeString(offsets[29], object.uuid);
  writer.writeLong(offsets[30], object.yearFounded);
}

Enterprise _enterpriseDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Enterprise();
  object.annualRevenue = reader.readDoubleOrNull(offsets[0]);
  object.baselineBookkeepingScore = reader.readDoubleOrNull(offsets[1]);
  object.baselineLoanStatus = reader.readStringOrNull(offsets[2]);
  object.baselineSalesVolume = reader.readDoubleOrNull(offsets[3]);
  object.baselineStatus = _EnterprisebaselineStatusValueEnumMap[
          reader.readStringOrNull(offsets[4])] ??
      BaselineStatus.assessed;
  object.businessName = reader.readString(offsets[5]);
  object.city = reader.readStringOrNull(offsets[6]);
  object.coachId = reader.readString(offsets[7]);
  object.country = reader.readStringOrNull(offsets[8]);
  object.district = reader.readStringOrNull(offsets[9]);
  object.employeeCount = reader.readLongOrNull(offsets[10]);
  object.enrolledAt = reader.readDateTime(offsets[11]);
  object.id = id;
  object.inviteCode = reader.readStringOrNull(offsets[12]);
  object.isSynced = reader.readBool(offsets[13]);
  object.latitude = reader.readDoubleOrNull(offsets[14]);
  object.longitude = reader.readDoubleOrNull(offsets[15]);
  object.merlId = reader.readStringOrNull(offsets[16]);
  object.ownerAge = reader.readLongOrNull(offsets[17]);
  object.ownerEmail = reader.readStringOrNull(offsets[18]);
  object.ownerGender = reader.readStringOrNull(offsets[19]);
  object.ownerId = reader.readStringOrNull(offsets[20]);
  object.ownerName = reader.readString(offsets[21]);
  object.ownerPhone = reader.readStringOrNull(offsets[22]);
  object.region = reader.readStringOrNull(offsets[23]);
  object.sector =
      _EnterprisesectorValueEnumMap[reader.readStringOrNull(offsets[24])] ??
          BusinessSector.agriculture;
  object.streetAddress = reader.readStringOrNull(offsets[25]);
  object.subsector = reader.readStringOrNull(offsets[26]);
  object.syncedAt = reader.readDateTimeOrNull(offsets[27]);
  object.updatedAt = reader.readDateTimeOrNull(offsets[28]);
  object.uuid = reader.readString(offsets[29]);
  object.yearFounded = reader.readLongOrNull(offsets[30]);
  return object;
}

P _enterpriseDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readDoubleOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readDoubleOrNull(offset)) as P;
    case 4:
      return (_EnterprisebaselineStatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          BaselineStatus.assessed) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readLongOrNull(offset)) as P;
    case 11:
      return (reader.readDateTime(offset)) as P;
    case 12:
      return (reader.readStringOrNull(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readDoubleOrNull(offset)) as P;
    case 15:
      return (reader.readDoubleOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readLongOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    case 23:
      return (reader.readStringOrNull(offset)) as P;
    case 24:
      return (_EnterprisesectorValueEnumMap[reader.readStringOrNull(offset)] ??
          BusinessSector.agriculture) as P;
    case 25:
      return (reader.readStringOrNull(offset)) as P;
    case 26:
      return (reader.readStringOrNull(offset)) as P;
    case 27:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 28:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 29:
      return (reader.readString(offset)) as P;
    case 30:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _EnterprisebaselineStatusEnumValueMap = {
  r'assessed': r'assessed',
  r'pending': r'pending',
  r'notStarted': r'notStarted',
};
const _EnterprisebaselineStatusValueEnumMap = {
  r'assessed': BaselineStatus.assessed,
  r'pending': BaselineStatus.pending,
  r'notStarted': BaselineStatus.notStarted,
};
const _EnterprisesectorEnumValueMap = {
  r'agriculture': r'agriculture',
  r'manufacturing': r'manufacturing',
  r'trade': r'trade',
  r'services': r'services',
  r'technology': r'technology',
  r'construction': r'construction',
  r'healthcare': r'healthcare',
  r'education': r'education',
  r'other': r'other',
};
const _EnterprisesectorValueEnumMap = {
  r'agriculture': BusinessSector.agriculture,
  r'manufacturing': BusinessSector.manufacturing,
  r'trade': BusinessSector.trade,
  r'services': BusinessSector.services,
  r'technology': BusinessSector.technology,
  r'construction': BusinessSector.construction,
  r'healthcare': BusinessSector.healthcare,
  r'education': BusinessSector.education,
  r'other': BusinessSector.other,
};

Id _enterpriseGetId(Enterprise object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _enterpriseGetLinks(Enterprise object) {
  return [];
}

void _enterpriseAttach(IsarCollection<dynamic> col, Id id, Enterprise object) {
  object.id = id;
}

extension EnterpriseByIndex on IsarCollection<Enterprise> {
  Future<Enterprise?> getByUuid(String uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  Enterprise? getByUuidSync(String uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<Enterprise?>> getAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<Enterprise?> getAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uuid', values);
  }

  Future<int> deleteAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uuid', values);
  }

  int deleteAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uuid', values);
  }

  Future<Id> putByUuid(Enterprise object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(Enterprise object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<Enterprise> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<Enterprise> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension EnterpriseQueryWhereSort
    on QueryBuilder<Enterprise, Enterprise, QWhere> {
  QueryBuilder<Enterprise, Enterprise, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension EnterpriseQueryWhere
    on QueryBuilder<Enterprise, Enterprise, QWhereClause> {
  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> uuidEqualTo(
      String uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> uuidNotEqualTo(
      String uuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> ownerEmailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ownerEmail',
        value: [null],
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause>
      ownerEmailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ownerEmail',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> ownerEmailEqualTo(
      String? ownerEmail) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ownerEmail',
        value: [ownerEmail],
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> ownerEmailNotEqualTo(
      String? ownerEmail) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerEmail',
              lower: [],
              upper: [ownerEmail],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerEmail',
              lower: [ownerEmail],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerEmail',
              lower: [ownerEmail],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerEmail',
              lower: [],
              upper: [ownerEmail],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> inviteCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'inviteCode',
        value: [null],
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause>
      inviteCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'inviteCode',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> inviteCodeEqualTo(
      String? inviteCode) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'inviteCode',
        value: [inviteCode],
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> inviteCodeNotEqualTo(
      String? inviteCode) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'inviteCode',
              lower: [],
              upper: [inviteCode],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'inviteCode',
              lower: [inviteCode],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'inviteCode',
              lower: [inviteCode],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'inviteCode',
              lower: [],
              upper: [inviteCode],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> ownerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ownerId',
        value: [null],
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> ownerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'ownerId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> ownerIdEqualTo(
      String? ownerId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'ownerId',
        value: [ownerId],
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> ownerIdNotEqualTo(
      String? ownerId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerId',
              lower: [],
              upper: [ownerId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerId',
              lower: [ownerId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerId',
              lower: [ownerId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'ownerId',
              lower: [],
              upper: [ownerId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> coachIdEqualTo(
      String coachId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'coachId',
        value: [coachId],
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterWhereClause> coachIdNotEqualTo(
      String coachId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'coachId',
              lower: [],
              upper: [coachId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'coachId',
              lower: [coachId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'coachId',
              lower: [coachId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'coachId',
              lower: [],
              upper: [coachId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension EnterpriseQueryFilter
    on QueryBuilder<Enterprise, Enterprise, QFilterCondition> {
  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      annualRevenueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'annualRevenue',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      annualRevenueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'annualRevenue',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      annualRevenueEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'annualRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      annualRevenueGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'annualRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      annualRevenueLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'annualRevenue',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      annualRevenueBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'annualRevenue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineBookkeepingScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baselineBookkeepingScore',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineBookkeepingScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baselineBookkeepingScore',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineBookkeepingScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baselineBookkeepingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineBookkeepingScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baselineBookkeepingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineBookkeepingScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baselineBookkeepingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineBookkeepingScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baselineBookkeepingScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineLoanStatusIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baselineLoanStatus',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineLoanStatusIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baselineLoanStatus',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineLoanStatusEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baselineLoanStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineLoanStatusGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baselineLoanStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineLoanStatusLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baselineLoanStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineLoanStatusBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baselineLoanStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineLoanStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'baselineLoanStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineLoanStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'baselineLoanStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineLoanStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'baselineLoanStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineLoanStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'baselineLoanStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineLoanStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baselineLoanStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineLoanStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'baselineLoanStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineSalesVolumeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'baselineSalesVolume',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineSalesVolumeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'baselineSalesVolume',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineSalesVolumeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baselineSalesVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineSalesVolumeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baselineSalesVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineSalesVolumeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baselineSalesVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineSalesVolumeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baselineSalesVolume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineStatusEqualTo(
    BaselineStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baselineStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineStatusGreaterThan(
    BaselineStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'baselineStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineStatusLessThan(
    BaselineStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'baselineStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineStatusBetween(
    BaselineStatus lower,
    BaselineStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'baselineStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'baselineStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'baselineStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'baselineStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'baselineStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'baselineStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      baselineStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'baselineStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      businessNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      businessNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'businessName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      businessNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'businessName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      businessNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'businessName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      businessNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'businessName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      businessNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'businessName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      businessNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'businessName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      businessNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'businessName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      businessNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'businessName',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      businessNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'businessName',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> cityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> cityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> cityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> cityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> cityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> cityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'city',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> cityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> cityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> cityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> cityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'city',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> cityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> cityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> coachIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coachId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      coachIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'coachId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> coachIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'coachId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> coachIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'coachId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> coachIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'coachId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> coachIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'coachId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> coachIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coachId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> coachIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coachId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> coachIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coachId',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      coachIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coachId',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> countryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      countryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'country',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> countryEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      countryGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> countryLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> countryBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'country',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> countryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> countryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> countryContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'country',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> countryMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'country',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> countryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      countryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'country',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> districtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'district',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      districtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'district',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> districtEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      districtGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> districtLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> districtBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'district',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      districtStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> districtEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> districtContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'district',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> districtMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'district',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      districtIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      districtIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'district',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      employeeCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'employeeCount',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      employeeCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'employeeCount',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      employeeCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      employeeCountGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'employeeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      employeeCountLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'employeeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      employeeCountBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'employeeCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> enrolledAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enrolledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      enrolledAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'enrolledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      enrolledAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'enrolledAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> enrolledAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'enrolledAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      inviteCodeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'inviteCode',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      inviteCodeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'inviteCode',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> inviteCodeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inviteCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      inviteCodeGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'inviteCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      inviteCodeLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'inviteCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> inviteCodeBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'inviteCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      inviteCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'inviteCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      inviteCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'inviteCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      inviteCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'inviteCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> inviteCodeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'inviteCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      inviteCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'inviteCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      inviteCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'inviteCode',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> isSyncedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> latitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      latitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'latitude',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> latitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      latitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> latitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'latitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> latitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'latitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      longitudeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      longitudeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'longitude',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> longitudeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      longitudeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> longitudeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longitude',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> longitudeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longitude',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> merlIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'merlId',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      merlIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'merlId',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> merlIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'merlId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> merlIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'merlId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> merlIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'merlId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> merlIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'merlId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> merlIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'merlId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> merlIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'merlId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> merlIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'merlId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> merlIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'merlId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> merlIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'merlId',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      merlIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'merlId',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerAgeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ownerAge',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerAgeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ownerAge',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerAgeEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerAge',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerAgeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownerAge',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerAgeLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownerAge',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerAgeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownerAge',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerEmailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ownerEmail',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerEmailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ownerEmail',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerEmailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerEmailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerEmailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerEmailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownerEmail',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerEmailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ownerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerEmailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ownerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerEmailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ownerEmail',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerEmailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ownerEmail',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerEmailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerEmailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ownerEmail',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerGenderIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ownerGender',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerGenderIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ownerGender',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerGenderEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerGenderGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownerGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerGenderLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownerGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerGenderBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownerGender',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerGenderStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ownerGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerGenderEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ownerGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerGenderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ownerGender',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerGenderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ownerGender',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerGenderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerGender',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerGenderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ownerGender',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ownerId',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ownerId',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ownerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ownerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ownerId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ownerId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerId',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ownerId',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ownerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ownerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ownerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ownerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerName',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ownerName',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerPhoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ownerPhone',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerPhoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ownerPhone',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerPhoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerPhoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ownerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerPhoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ownerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerPhoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ownerPhone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerPhoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ownerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerPhoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ownerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerPhoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ownerPhone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> ownerPhoneMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ownerPhone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerPhoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ownerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      ownerPhoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ownerPhone',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> regionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'region',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      regionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'region',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> regionEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> regionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> regionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> regionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'region',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> regionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> regionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> regionContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'region',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> regionMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'region',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> regionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'region',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      regionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'region',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> sectorEqualTo(
    BusinessSector value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> sectorGreaterThan(
    BusinessSector value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> sectorLessThan(
    BusinessSector value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> sectorBetween(
    BusinessSector lower,
    BusinessSector upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sector',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> sectorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> sectorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> sectorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'sector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> sectorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'sector',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> sectorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      sectorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'sector',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      streetAddressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'streetAddress',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      streetAddressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'streetAddress',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      streetAddressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streetAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      streetAddressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streetAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      streetAddressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streetAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      streetAddressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streetAddress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      streetAddressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'streetAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      streetAddressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'streetAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      streetAddressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'streetAddress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      streetAddressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'streetAddress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      streetAddressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streetAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      streetAddressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'streetAddress',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      subsectorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'subsector',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      subsectorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'subsector',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> subsectorEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subsector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      subsectorGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subsector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> subsectorLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subsector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> subsectorBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subsector',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      subsectorStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subsector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> subsectorEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subsector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> subsectorContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subsector',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> subsectorMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subsector',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      subsectorIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subsector',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      subsectorIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subsector',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> syncedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      syncedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> syncedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> syncedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'syncedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'updatedAt',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> updatedAtEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      updatedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'updatedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'updatedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> uuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> uuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> uuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> uuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> uuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      yearFoundedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'yearFounded',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      yearFoundedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'yearFounded',
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      yearFoundedEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'yearFounded',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      yearFoundedGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'yearFounded',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      yearFoundedLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'yearFounded',
        value: value,
      ));
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterFilterCondition>
      yearFoundedBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'yearFounded',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension EnterpriseQueryObject
    on QueryBuilder<Enterprise, Enterprise, QFilterCondition> {}

extension EnterpriseQueryLinks
    on QueryBuilder<Enterprise, Enterprise, QFilterCondition> {}

extension EnterpriseQuerySortBy
    on QueryBuilder<Enterprise, Enterprise, QSortBy> {
  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByAnnualRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualRevenue', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByAnnualRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualRevenue', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      sortByBaselineBookkeepingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineBookkeepingScore', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      sortByBaselineBookkeepingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineBookkeepingScore', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      sortByBaselineLoanStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineLoanStatus', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      sortByBaselineLoanStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineLoanStatus', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      sortByBaselineSalesVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineSalesVolume', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      sortByBaselineSalesVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineSalesVolume', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByBaselineStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineStatus', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      sortByBaselineStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineStatus', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByBusinessName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessName', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByBusinessNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessName', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByCoachId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coachId', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByCoachIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coachId', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByEmployeeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCount', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByEmployeeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCount', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByEnrolledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledAt', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByEnrolledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledAt', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByInviteCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inviteCode', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByInviteCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inviteCode', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByMerlId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merlId', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByMerlIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merlId', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByOwnerAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerAge', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByOwnerAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerAge', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByOwnerEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerEmail', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByOwnerEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerEmail', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByOwnerGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerGender', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByOwnerGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerGender', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByOwnerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerId', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByOwnerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerId', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByOwnerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerName', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByOwnerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerName', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByOwnerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerPhone', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByOwnerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerPhone', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByRegion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByRegionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByStreetAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streetAddress', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByStreetAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streetAddress', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortBySubsector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subsector', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortBySubsectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subsector', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByYearFounded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearFounded', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> sortByYearFoundedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearFounded', Sort.desc);
    });
  }
}

extension EnterpriseQuerySortThenBy
    on QueryBuilder<Enterprise, Enterprise, QSortThenBy> {
  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByAnnualRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualRevenue', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByAnnualRevenueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'annualRevenue', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      thenByBaselineBookkeepingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineBookkeepingScore', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      thenByBaselineBookkeepingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineBookkeepingScore', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      thenByBaselineLoanStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineLoanStatus', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      thenByBaselineLoanStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineLoanStatus', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      thenByBaselineSalesVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineSalesVolume', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      thenByBaselineSalesVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineSalesVolume', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByBaselineStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineStatus', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy>
      thenByBaselineStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'baselineStatus', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByBusinessName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessName', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByBusinessNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'businessName', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByCity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByCityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'city', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByCoachId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coachId', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByCoachIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coachId', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByCountry() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByCountryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'country', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByDistrict() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByDistrictDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'district', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByEmployeeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCount', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByEmployeeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCount', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByEnrolledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledAt', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByEnrolledAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enrolledAt', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByInviteCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inviteCode', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByInviteCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inviteCode', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByLatitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'latitude', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByLongitudeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longitude', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByMerlId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merlId', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByMerlIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'merlId', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByOwnerAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerAge', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByOwnerAgeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerAge', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByOwnerEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerEmail', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByOwnerEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerEmail', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByOwnerGender() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerGender', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByOwnerGenderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerGender', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByOwnerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerId', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByOwnerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerId', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByOwnerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerName', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByOwnerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerName', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByOwnerPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerPhone', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByOwnerPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownerPhone', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByRegion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByRegionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'region', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenBySector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenBySectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sector', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByStreetAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streetAddress', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByStreetAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streetAddress', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenBySubsector() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subsector', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenBySubsectorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subsector', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByYearFounded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearFounded', Sort.asc);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QAfterSortBy> thenByYearFoundedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'yearFounded', Sort.desc);
    });
  }
}

extension EnterpriseQueryWhereDistinct
    on QueryBuilder<Enterprise, Enterprise, QDistinct> {
  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByAnnualRevenue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'annualRevenue');
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct>
      distinctByBaselineBookkeepingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baselineBookkeepingScore');
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByBaselineLoanStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baselineLoanStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct>
      distinctByBaselineSalesVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baselineSalesVolume');
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByBaselineStatus(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'baselineStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByBusinessName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'businessName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByCity(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'city', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByCoachId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coachId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByCountry(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'country', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByDistrict(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'district', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByEmployeeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeCount');
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByEnrolledAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enrolledAt');
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByInviteCode(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inviteCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByLatitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'latitude');
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByLongitude() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longitude');
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByMerlId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'merlId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByOwnerAge() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerAge');
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByOwnerEmail(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerEmail', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByOwnerGender(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerGender', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByOwnerId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByOwnerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByOwnerPhone(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownerPhone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByRegion(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'region', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctBySector(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sector', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByStreetAddress(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streetAddress',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctBySubsector(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subsector', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Enterprise, Enterprise, QDistinct> distinctByYearFounded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'yearFounded');
    });
  }
}

extension EnterpriseQueryProperty
    on QueryBuilder<Enterprise, Enterprise, QQueryProperty> {
  QueryBuilder<Enterprise, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Enterprise, double?, QQueryOperations> annualRevenueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'annualRevenue');
    });
  }

  QueryBuilder<Enterprise, double?, QQueryOperations>
      baselineBookkeepingScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baselineBookkeepingScore');
    });
  }

  QueryBuilder<Enterprise, String?, QQueryOperations>
      baselineLoanStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baselineLoanStatus');
    });
  }

  QueryBuilder<Enterprise, double?, QQueryOperations>
      baselineSalesVolumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baselineSalesVolume');
    });
  }

  QueryBuilder<Enterprise, BaselineStatus, QQueryOperations>
      baselineStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'baselineStatus');
    });
  }

  QueryBuilder<Enterprise, String, QQueryOperations> businessNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'businessName');
    });
  }

  QueryBuilder<Enterprise, String?, QQueryOperations> cityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'city');
    });
  }

  QueryBuilder<Enterprise, String, QQueryOperations> coachIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coachId');
    });
  }

  QueryBuilder<Enterprise, String?, QQueryOperations> countryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'country');
    });
  }

  QueryBuilder<Enterprise, String?, QQueryOperations> districtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'district');
    });
  }

  QueryBuilder<Enterprise, int?, QQueryOperations> employeeCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeCount');
    });
  }

  QueryBuilder<Enterprise, DateTime, QQueryOperations> enrolledAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enrolledAt');
    });
  }

  QueryBuilder<Enterprise, String?, QQueryOperations> inviteCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inviteCode');
    });
  }

  QueryBuilder<Enterprise, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<Enterprise, double?, QQueryOperations> latitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'latitude');
    });
  }

  QueryBuilder<Enterprise, double?, QQueryOperations> longitudeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longitude');
    });
  }

  QueryBuilder<Enterprise, String?, QQueryOperations> merlIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'merlId');
    });
  }

  QueryBuilder<Enterprise, int?, QQueryOperations> ownerAgeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerAge');
    });
  }

  QueryBuilder<Enterprise, String?, QQueryOperations> ownerEmailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerEmail');
    });
  }

  QueryBuilder<Enterprise, String?, QQueryOperations> ownerGenderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerGender');
    });
  }

  QueryBuilder<Enterprise, String?, QQueryOperations> ownerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerId');
    });
  }

  QueryBuilder<Enterprise, String, QQueryOperations> ownerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerName');
    });
  }

  QueryBuilder<Enterprise, String?, QQueryOperations> ownerPhoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownerPhone');
    });
  }

  QueryBuilder<Enterprise, String?, QQueryOperations> regionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'region');
    });
  }

  QueryBuilder<Enterprise, BusinessSector, QQueryOperations> sectorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sector');
    });
  }

  QueryBuilder<Enterprise, String?, QQueryOperations> streetAddressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streetAddress');
    });
  }

  QueryBuilder<Enterprise, String?, QQueryOperations> subsectorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subsector');
    });
  }

  QueryBuilder<Enterprise, DateTime?, QQueryOperations> syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<Enterprise, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<Enterprise, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }

  QueryBuilder<Enterprise, int?, QQueryOperations> yearFoundedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'yearFounded');
    });
  }
}
