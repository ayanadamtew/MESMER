// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis_assessment.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDiagnosisAssessmentCollection on Isar {
  IsarCollection<DiagnosisAssessment> get diagnosisAssessments =>
      this.collection();
}

const DiagnosisAssessmentSchema = CollectionSchema(
  name: r'DiagnosisAssessment',
  id: 6597817965703343238,
  properties: {
    r'assessedAt': PropertySchema(
      id: 0,
      name: r'assessedAt',
      type: IsarType.dateTime,
    ),
    r'checklistJson': PropertySchema(
      id: 1,
      name: r'checklistJson',
      type: IsarType.string,
    ),
    r'coachId': PropertySchema(
      id: 2,
      name: r'coachId',
      type: IsarType.string,
    ),
    r'enterpriseId': PropertySchema(
      id: 3,
      name: r'enterpriseId',
      type: IsarType.string,
    ),
    r'financeScore': PropertySchema(
      id: 4,
      name: r'financeScore',
      type: IsarType.double,
    ),
    r'governanceScore': PropertySchema(
      id: 5,
      name: r'governanceScore',
      type: IsarType.double,
    ),
    r'hrScore': PropertySchema(
      id: 6,
      name: r'hrScore',
      type: IsarType.double,
    ),
    r'isSynced': PropertySchema(
      id: 7,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'marketingScore': PropertySchema(
      id: 8,
      name: r'marketingScore',
      type: IsarType.double,
    ),
    r'notes': PropertySchema(
      id: 9,
      name: r'notes',
      type: IsarType.string,
    ),
    r'operationsScore': PropertySchema(
      id: 10,
      name: r'operationsScore',
      type: IsarType.double,
    ),
    r'priorityChallenges': PropertySchema(
      id: 11,
      name: r'priorityChallenges',
      type: IsarType.stringList,
    ),
    r'syncedAt': PropertySchema(
      id: 12,
      name: r'syncedAt',
      type: IsarType.dateTime,
    ),
    r'uuid': PropertySchema(
      id: 13,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _diagnosisAssessmentEstimateSize,
  serialize: _diagnosisAssessmentSerialize,
  deserialize: _diagnosisAssessmentDeserialize,
  deserializeProp: _diagnosisAssessmentDeserializeProp,
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
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _diagnosisAssessmentGetId,
  getLinks: _diagnosisAssessmentGetLinks,
  attach: _diagnosisAssessmentAttach,
  version: '3.1.0+1',
);

int _diagnosisAssessmentEstimateSize(
  DiagnosisAssessment object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.checklistJson.length * 3;
  bytesCount += 3 + object.coachId.length * 3;
  bytesCount += 3 + object.enterpriseId.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.priorityChallenges.length * 3;
  {
    for (var i = 0; i < object.priorityChallenges.length; i++) {
      final value = object.priorityChallenges[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _diagnosisAssessmentSerialize(
  DiagnosisAssessment object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.assessedAt);
  writer.writeString(offsets[1], object.checklistJson);
  writer.writeString(offsets[2], object.coachId);
  writer.writeString(offsets[3], object.enterpriseId);
  writer.writeDouble(offsets[4], object.financeScore);
  writer.writeDouble(offsets[5], object.governanceScore);
  writer.writeDouble(offsets[6], object.hrScore);
  writer.writeBool(offsets[7], object.isSynced);
  writer.writeDouble(offsets[8], object.marketingScore);
  writer.writeString(offsets[9], object.notes);
  writer.writeDouble(offsets[10], object.operationsScore);
  writer.writeStringList(offsets[11], object.priorityChallenges);
  writer.writeDateTime(offsets[12], object.syncedAt);
  writer.writeString(offsets[13], object.uuid);
}

DiagnosisAssessment _diagnosisAssessmentDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DiagnosisAssessment();
  object.assessedAt = reader.readDateTime(offsets[0]);
  object.checklistJson = reader.readString(offsets[1]);
  object.coachId = reader.readString(offsets[2]);
  object.enterpriseId = reader.readString(offsets[3]);
  object.financeScore = reader.readDouble(offsets[4]);
  object.governanceScore = reader.readDouble(offsets[5]);
  object.hrScore = reader.readDouble(offsets[6]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[7]);
  object.marketingScore = reader.readDouble(offsets[8]);
  object.notes = reader.readStringOrNull(offsets[9]);
  object.operationsScore = reader.readDouble(offsets[10]);
  object.priorityChallenges = reader.readStringList(offsets[11]) ?? [];
  object.syncedAt = reader.readDateTimeOrNull(offsets[12]);
  object.uuid = reader.readString(offsets[13]);
  return object;
}

P _diagnosisAssessmentDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readStringList(offset) ?? []) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _diagnosisAssessmentGetId(DiagnosisAssessment object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _diagnosisAssessmentGetLinks(
    DiagnosisAssessment object) {
  return [];
}

void _diagnosisAssessmentAttach(
    IsarCollection<dynamic> col, Id id, DiagnosisAssessment object) {
  object.id = id;
}

extension DiagnosisAssessmentByIndex on IsarCollection<DiagnosisAssessment> {
  Future<DiagnosisAssessment?> getByUuid(String uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  DiagnosisAssessment? getByUuidSync(String uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<DiagnosisAssessment?>> getAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<DiagnosisAssessment?> getAllByUuidSync(List<String> uuidValues) {
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

  Future<Id> putByUuid(DiagnosisAssessment object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(DiagnosisAssessment object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<DiagnosisAssessment> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<DiagnosisAssessment> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension DiagnosisAssessmentQueryWhereSort
    on QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QWhere> {
  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DiagnosisAssessmentQueryWhere
    on QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QWhereClause> {
  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterWhereClause>
      uuidEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterWhereClause>
      uuidNotEqualTo(String uuid) {
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
}

extension DiagnosisAssessmentQueryFilter on QueryBuilder<DiagnosisAssessment,
    DiagnosisAssessment, QFilterCondition> {
  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      assessedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assessedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      assessedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assessedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      assessedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assessedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      assessedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assessedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      checklistJsonEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checklistJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      checklistJsonGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'checklistJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      checklistJsonLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'checklistJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      checklistJsonBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'checklistJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      checklistJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'checklistJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      checklistJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'checklistJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      checklistJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'checklistJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      checklistJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'checklistJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      checklistJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'checklistJson',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      checklistJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'checklistJson',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      coachIdEqualTo(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      coachIdLessThan(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      coachIdBetween(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      coachIdStartsWith(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      coachIdEndsWith(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      coachIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'coachId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      coachIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'coachId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      coachIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'coachId',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      coachIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'coachId',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      enterpriseIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enterpriseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      enterpriseIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'enterpriseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      enterpriseIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'enterpriseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      enterpriseIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'enterpriseId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      enterpriseIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'enterpriseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      enterpriseIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'enterpriseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      enterpriseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'enterpriseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      enterpriseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'enterpriseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      enterpriseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enterpriseId',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      enterpriseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'enterpriseId',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      financeScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'financeScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      financeScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'financeScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      financeScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'financeScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      financeScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'financeScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      governanceScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'governanceScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      governanceScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'governanceScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      governanceScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'governanceScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      governanceScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'governanceScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      hrScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hrScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      hrScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hrScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      hrScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hrScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      hrScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hrScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      marketingScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'marketingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      marketingScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'marketingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      marketingScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'marketingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      marketingScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'marketingScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      notesEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      notesGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      notesLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      notesBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      notesStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      notesEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      operationsScoreEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'operationsScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      operationsScoreGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'operationsScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      operationsScoreLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'operationsScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      operationsScoreBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'operationsScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priorityChallenges',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'priorityChallenges',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'priorityChallenges',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'priorityChallenges',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'priorityChallenges',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'priorityChallenges',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'priorityChallenges',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'priorityChallenges',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'priorityChallenges',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'priorityChallenges',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'priorityChallenges',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'priorityChallenges',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'priorityChallenges',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'priorityChallenges',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'priorityChallenges',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      priorityChallengesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'priorityChallenges',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      syncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      syncedAtLessThan(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      syncedAtBetween(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      uuidEqualTo(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      uuidGreaterThan(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      uuidLessThan(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      uuidBetween(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      uuidStartsWith(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      uuidEndsWith(
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

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension DiagnosisAssessmentQueryObject on QueryBuilder<DiagnosisAssessment,
    DiagnosisAssessment, QFilterCondition> {}

extension DiagnosisAssessmentQueryLinks on QueryBuilder<DiagnosisAssessment,
    DiagnosisAssessment, QFilterCondition> {}

extension DiagnosisAssessmentQuerySortBy
    on QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QSortBy> {
  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByAssessedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessedAt', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByAssessedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessedAt', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByChecklistJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checklistJson', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByChecklistJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checklistJson', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByCoachId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coachId', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByCoachIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coachId', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByEnterpriseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enterpriseId', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByEnterpriseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enterpriseId', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByFinanceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'financeScore', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByFinanceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'financeScore', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByGovernanceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'governanceScore', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByGovernanceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'governanceScore', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByHrScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hrScore', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByHrScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hrScore', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByMarketingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marketingScore', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByMarketingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marketingScore', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByOperationsScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationsScore', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByOperationsScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationsScore', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension DiagnosisAssessmentQuerySortThenBy
    on QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QSortThenBy> {
  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByAssessedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessedAt', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByAssessedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assessedAt', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByChecklistJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checklistJson', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByChecklistJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'checklistJson', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByCoachId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coachId', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByCoachIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'coachId', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByEnterpriseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enterpriseId', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByEnterpriseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enterpriseId', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByFinanceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'financeScore', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByFinanceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'financeScore', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByGovernanceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'governanceScore', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByGovernanceScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'governanceScore', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByHrScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hrScore', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByHrScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hrScore', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByMarketingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marketingScore', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByMarketingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'marketingScore', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByOperationsScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationsScore', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByOperationsScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'operationsScore', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension DiagnosisAssessmentQueryWhereDistinct
    on QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct> {
  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctByAssessedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assessedAt');
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctByChecklistJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'checklistJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctByCoachId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'coachId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctByEnterpriseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enterpriseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctByFinanceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'financeScore');
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctByGovernanceScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'governanceScore');
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctByHrScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hrScore');
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctByMarketingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'marketingScore');
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctByOperationsScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'operationsScore');
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctByPriorityChallenges() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'priorityChallenges');
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QDistinct>
      distinctByUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension DiagnosisAssessmentQueryProperty
    on QueryBuilder<DiagnosisAssessment, DiagnosisAssessment, QQueryProperty> {
  QueryBuilder<DiagnosisAssessment, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DiagnosisAssessment, DateTime, QQueryOperations>
      assessedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assessedAt');
    });
  }

  QueryBuilder<DiagnosisAssessment, String, QQueryOperations>
      checklistJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'checklistJson');
    });
  }

  QueryBuilder<DiagnosisAssessment, String, QQueryOperations>
      coachIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'coachId');
    });
  }

  QueryBuilder<DiagnosisAssessment, String, QQueryOperations>
      enterpriseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enterpriseId');
    });
  }

  QueryBuilder<DiagnosisAssessment, double, QQueryOperations>
      financeScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'financeScore');
    });
  }

  QueryBuilder<DiagnosisAssessment, double, QQueryOperations>
      governanceScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'governanceScore');
    });
  }

  QueryBuilder<DiagnosisAssessment, double, QQueryOperations>
      hrScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hrScore');
    });
  }

  QueryBuilder<DiagnosisAssessment, bool, QQueryOperations> isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<DiagnosisAssessment, double, QQueryOperations>
      marketingScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'marketingScore');
    });
  }

  QueryBuilder<DiagnosisAssessment, String?, QQueryOperations> notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<DiagnosisAssessment, double, QQueryOperations>
      operationsScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'operationsScore');
    });
  }

  QueryBuilder<DiagnosisAssessment, List<String>, QQueryOperations>
      priorityChallengesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'priorityChallenges');
    });
  }

  QueryBuilder<DiagnosisAssessment, DateTime?, QQueryOperations>
      syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<DiagnosisAssessment, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
