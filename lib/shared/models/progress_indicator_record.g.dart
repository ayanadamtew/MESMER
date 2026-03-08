// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_indicator_record.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetProgressIndicatorRecordCollection on Isar {
  IsarCollection<ProgressIndicatorRecord> get progressIndicatorRecords =>
      this.collection();
}

const ProgressIndicatorRecordSchema = CollectionSchema(
  name: r'ProgressIndicatorRecord',
  id: 7485486222899476974,
  properties: {
    r'bookkeepingScore': PropertySchema(
      id: 0,
      name: r'bookkeepingScore',
      type: IsarType.double,
    ),
    r'employeeCount': PropertySchema(
      id: 1,
      name: r'employeeCount',
      type: IsarType.long,
    ),
    r'enterpriseId': PropertySchema(
      id: 2,
      name: r'enterpriseId',
      type: IsarType.string,
    ),
    r'isSynced': PropertySchema(
      id: 3,
      name: r'isSynced',
      type: IsarType.bool,
    ),
    r'loanRepaymentStatus': PropertySchema(
      id: 4,
      name: r'loanRepaymentStatus',
      type: IsarType.string,
      enumMap: _ProgressIndicatorRecordloanRepaymentStatusEnumValueMap,
    ),
    r'notes': PropertySchema(
      id: 5,
      name: r'notes',
      type: IsarType.string,
    ),
    r'numberOfCustomers': PropertySchema(
      id: 6,
      name: r'numberOfCustomers',
      type: IsarType.long,
    ),
    r'recordedAt': PropertySchema(
      id: 7,
      name: r'recordedAt',
      type: IsarType.dateTime,
    ),
    r'recordedBy': PropertySchema(
      id: 8,
      name: r'recordedBy',
      type: IsarType.string,
    ),
    r'revenueAmount': PropertySchema(
      id: 9,
      name: r'revenueAmount',
      type: IsarType.double,
    ),
    r'salesGrowthPercent': PropertySchema(
      id: 10,
      name: r'salesGrowthPercent',
      type: IsarType.double,
    ),
    r'salesVolume': PropertySchema(
      id: 11,
      name: r'salesVolume',
      type: IsarType.double,
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
  estimateSize: _progressIndicatorRecordEstimateSize,
  serialize: _progressIndicatorRecordSerialize,
  deserialize: _progressIndicatorRecordDeserialize,
  deserializeProp: _progressIndicatorRecordDeserializeProp,
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
  getId: _progressIndicatorRecordGetId,
  getLinks: _progressIndicatorRecordGetLinks,
  attach: _progressIndicatorRecordAttach,
  version: '3.1.0+1',
);

int _progressIndicatorRecordEstimateSize(
  ProgressIndicatorRecord object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.enterpriseId.length * 3;
  bytesCount += 3 + object.loanRepaymentStatus.name.length * 3;
  {
    final value = object.notes;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.recordedBy.length * 3;
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _progressIndicatorRecordSerialize(
  ProgressIndicatorRecord object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.bookkeepingScore);
  writer.writeLong(offsets[1], object.employeeCount);
  writer.writeString(offsets[2], object.enterpriseId);
  writer.writeBool(offsets[3], object.isSynced);
  writer.writeString(offsets[4], object.loanRepaymentStatus.name);
  writer.writeString(offsets[5], object.notes);
  writer.writeLong(offsets[6], object.numberOfCustomers);
  writer.writeDateTime(offsets[7], object.recordedAt);
  writer.writeString(offsets[8], object.recordedBy);
  writer.writeDouble(offsets[9], object.revenueAmount);
  writer.writeDouble(offsets[10], object.salesGrowthPercent);
  writer.writeDouble(offsets[11], object.salesVolume);
  writer.writeDateTime(offsets[12], object.syncedAt);
  writer.writeString(offsets[13], object.uuid);
}

ProgressIndicatorRecord _progressIndicatorRecordDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ProgressIndicatorRecord();
  object.bookkeepingScore = reader.readDoubleOrNull(offsets[0]);
  object.employeeCount = reader.readLongOrNull(offsets[1]);
  object.enterpriseId = reader.readString(offsets[2]);
  object.id = id;
  object.isSynced = reader.readBool(offsets[3]);
  object.loanRepaymentStatus =
      _ProgressIndicatorRecordloanRepaymentStatusValueEnumMap[
              reader.readStringOrNull(offsets[4])] ??
          LoanRepaymentStatus.onTrack;
  object.notes = reader.readStringOrNull(offsets[5]);
  object.numberOfCustomers = reader.readLongOrNull(offsets[6]);
  object.recordedAt = reader.readDateTime(offsets[7]);
  object.recordedBy = reader.readString(offsets[8]);
  object.revenueAmount = reader.readDoubleOrNull(offsets[9]);
  object.salesGrowthPercent = reader.readDoubleOrNull(offsets[10]);
  object.salesVolume = reader.readDoubleOrNull(offsets[11]);
  object.syncedAt = reader.readDateTimeOrNull(offsets[12]);
  object.uuid = reader.readString(offsets[13]);
  return object;
}

P _progressIndicatorRecordDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readBool(offset)) as P;
    case 4:
      return (_ProgressIndicatorRecordloanRepaymentStatusValueEnumMap[
              reader.readStringOrNull(offset)] ??
          LoanRepaymentStatus.onTrack) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readDateTime(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readDoubleOrNull(offset)) as P;
    case 10:
      return (reader.readDoubleOrNull(offset)) as P;
    case 11:
      return (reader.readDoubleOrNull(offset)) as P;
    case 12:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 13:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _ProgressIndicatorRecordloanRepaymentStatusEnumValueMap = {
  r'onTrack': r'onTrack',
  r'delayed': r'delayed',
  r'defaulted': r'defaulted',
  r'nLoan': r'nLoan',
};
const _ProgressIndicatorRecordloanRepaymentStatusValueEnumMap = {
  r'onTrack': LoanRepaymentStatus.onTrack,
  r'delayed': LoanRepaymentStatus.delayed,
  r'defaulted': LoanRepaymentStatus.defaulted,
  r'nLoan': LoanRepaymentStatus.nLoan,
};

Id _progressIndicatorRecordGetId(ProgressIndicatorRecord object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _progressIndicatorRecordGetLinks(
    ProgressIndicatorRecord object) {
  return [];
}

void _progressIndicatorRecordAttach(
    IsarCollection<dynamic> col, Id id, ProgressIndicatorRecord object) {
  object.id = id;
}

extension ProgressIndicatorRecordByIndex
    on IsarCollection<ProgressIndicatorRecord> {
  Future<ProgressIndicatorRecord?> getByUuid(String uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  ProgressIndicatorRecord? getByUuidSync(String uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<ProgressIndicatorRecord?>> getAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<ProgressIndicatorRecord?> getAllByUuidSync(List<String> uuidValues) {
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

  Future<Id> putByUuid(ProgressIndicatorRecord object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(ProgressIndicatorRecord object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<ProgressIndicatorRecord> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<ProgressIndicatorRecord> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension ProgressIndicatorRecordQueryWhereSort
    on QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QWhere> {
  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ProgressIndicatorRecordQueryWhere on QueryBuilder<
    ProgressIndicatorRecord, ProgressIndicatorRecord, QWhereClause> {
  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterWhereClause> idBetween(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterWhereClause> uuidEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterWhereClause> uuidNotEqualTo(String uuid) {
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

extension ProgressIndicatorRecordQueryFilter on QueryBuilder<
    ProgressIndicatorRecord, ProgressIndicatorRecord, QFilterCondition> {
  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> bookkeepingScoreIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bookkeepingScore',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> bookkeepingScoreIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bookkeepingScore',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> bookkeepingScoreEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bookkeepingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> bookkeepingScoreGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bookkeepingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> bookkeepingScoreLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bookkeepingScore',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> bookkeepingScoreBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bookkeepingScore',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> employeeCountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'employeeCount',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> employeeCountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'employeeCount',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> employeeCountEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'employeeCount',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> employeeCountGreaterThan(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> employeeCountLessThan(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> employeeCountBetween(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> enterpriseIdEqualTo(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> enterpriseIdGreaterThan(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> enterpriseIdLessThan(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> enterpriseIdBetween(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> enterpriseIdStartsWith(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> enterpriseIdEndsWith(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
          QAfterFilterCondition>
      enterpriseIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'enterpriseId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
          QAfterFilterCondition>
      enterpriseIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'enterpriseId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> enterpriseIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'enterpriseId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> enterpriseIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'enterpriseId',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> isSyncedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isSynced',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> loanRepaymentStatusEqualTo(
    LoanRepaymentStatus value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loanRepaymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> loanRepaymentStatusGreaterThan(
    LoanRepaymentStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'loanRepaymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> loanRepaymentStatusLessThan(
    LoanRepaymentStatus value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'loanRepaymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> loanRepaymentStatusBetween(
    LoanRepaymentStatus lower,
    LoanRepaymentStatus upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'loanRepaymentStatus',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> loanRepaymentStatusStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'loanRepaymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> loanRepaymentStatusEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'loanRepaymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
          QAfterFilterCondition>
      loanRepaymentStatusContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'loanRepaymentStatus',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
          QAfterFilterCondition>
      loanRepaymentStatusMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'loanRepaymentStatus',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> loanRepaymentStatusIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'loanRepaymentStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> loanRepaymentStatusIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'loanRepaymentStatus',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> notesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> notesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'notes',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> notesEqualTo(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> notesGreaterThan(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> notesLessThan(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> notesBetween(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> notesStartsWith(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> notesEndsWith(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
          QAfterFilterCondition>
      notesContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'notes',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
          QAfterFilterCondition>
      notesMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'notes',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> notesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> notesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'notes',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> numberOfCustomersIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'numberOfCustomers',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> numberOfCustomersIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'numberOfCustomers',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> numberOfCustomersEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numberOfCustomers',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> numberOfCustomersGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numberOfCustomers',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> numberOfCustomersLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numberOfCustomers',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> numberOfCustomersBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numberOfCustomers',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> recordedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> recordedAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> recordedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recordedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> recordedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recordedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> recordedByEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> recordedByGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'recordedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> recordedByLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'recordedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> recordedByBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'recordedBy',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> recordedByStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'recordedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> recordedByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'recordedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
          QAfterFilterCondition>
      recordedByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'recordedBy',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
          QAfterFilterCondition>
      recordedByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'recordedBy',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> recordedByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'recordedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> recordedByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'recordedBy',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> revenueAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'revenueAmount',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> revenueAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'revenueAmount',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> revenueAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'revenueAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> revenueAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'revenueAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> revenueAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'revenueAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> revenueAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'revenueAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> salesGrowthPercentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'salesGrowthPercent',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> salesGrowthPercentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'salesGrowthPercent',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> salesGrowthPercentEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salesGrowthPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> salesGrowthPercentGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salesGrowthPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> salesGrowthPercentLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salesGrowthPercent',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> salesGrowthPercentBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salesGrowthPercent',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> salesVolumeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'salesVolume',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> salesVolumeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'salesVolume',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> salesVolumeEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salesVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> salesVolumeGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salesVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> salesVolumeLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salesVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> salesVolumeBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salesVolume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> syncedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> syncedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'syncedAt',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> syncedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'syncedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> syncedAtGreaterThan(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> syncedAtLessThan(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> syncedAtBetween(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> uuidEqualTo(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> uuidGreaterThan(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> uuidLessThan(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> uuidBetween(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> uuidStartsWith(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> uuidEndsWith(
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

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
          QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
          QAfterFilterCondition>
      uuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord,
      QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension ProgressIndicatorRecordQueryObject on QueryBuilder<
    ProgressIndicatorRecord, ProgressIndicatorRecord, QFilterCondition> {}

extension ProgressIndicatorRecordQueryLinks on QueryBuilder<
    ProgressIndicatorRecord, ProgressIndicatorRecord, QFilterCondition> {}

extension ProgressIndicatorRecordQuerySortBy
    on QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QSortBy> {
  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByBookkeepingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookkeepingScore', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByBookkeepingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookkeepingScore', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByEmployeeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCount', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByEmployeeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCount', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByEnterpriseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enterpriseId', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByEnterpriseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enterpriseId', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByLoanRepaymentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanRepaymentStatus', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByLoanRepaymentStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanRepaymentStatus', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByNumberOfCustomers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfCustomers', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByNumberOfCustomersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfCustomers', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByRecordedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedBy', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByRecordedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedBy', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByRevenueAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortBySalesGrowthPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesGrowthPercent', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortBySalesGrowthPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesGrowthPercent', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortBySalesVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesVolume', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortBySalesVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesVolume', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension ProgressIndicatorRecordQuerySortThenBy on QueryBuilder<
    ProgressIndicatorRecord, ProgressIndicatorRecord, QSortThenBy> {
  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByBookkeepingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookkeepingScore', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByBookkeepingScoreDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bookkeepingScore', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByEmployeeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCount', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByEmployeeCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'employeeCount', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByEnterpriseId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enterpriseId', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByEnterpriseIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'enterpriseId', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByIsSyncedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isSynced', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByLoanRepaymentStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanRepaymentStatus', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByLoanRepaymentStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'loanRepaymentStatus', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByNotes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByNotesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notes', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByNumberOfCustomers() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfCustomers', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByNumberOfCustomersDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberOfCustomers', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByRecordedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedAt', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByRecordedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedBy', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByRecordedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'recordedBy', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByRevenueAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'revenueAmount', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenBySalesGrowthPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesGrowthPercent', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenBySalesGrowthPercentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesGrowthPercent', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenBySalesVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesVolume', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenBySalesVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'salesVolume', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenBySyncedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'syncedAt', Sort.desc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QAfterSortBy>
      thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension ProgressIndicatorRecordQueryWhereDistinct on QueryBuilder<
    ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct> {
  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctByBookkeepingScore() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bookkeepingScore');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctByEmployeeCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'employeeCount');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctByEnterpriseId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'enterpriseId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctByIsSynced() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isSynced');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctByLoanRepaymentStatus({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'loanRepaymentStatus',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctByNotes({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notes', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctByNumberOfCustomers() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numberOfCustomers');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctByRecordedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordedAt');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctByRecordedBy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'recordedBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctByRevenueAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'revenueAmount');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctBySalesGrowthPercent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salesGrowthPercent');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctBySalesVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'salesVolume');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctBySyncedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'syncedAt');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, ProgressIndicatorRecord, QDistinct>
      distinctByUuid({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension ProgressIndicatorRecordQueryProperty on QueryBuilder<
    ProgressIndicatorRecord, ProgressIndicatorRecord, QQueryProperty> {
  QueryBuilder<ProgressIndicatorRecord, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, double?, QQueryOperations>
      bookkeepingScoreProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bookkeepingScore');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, int?, QQueryOperations>
      employeeCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'employeeCount');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, String, QQueryOperations>
      enterpriseIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'enterpriseId');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, bool, QQueryOperations>
      isSyncedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isSynced');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, LoanRepaymentStatus, QQueryOperations>
      loanRepaymentStatusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'loanRepaymentStatus');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, String?, QQueryOperations>
      notesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notes');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, int?, QQueryOperations>
      numberOfCustomersProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numberOfCustomers');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, DateTime, QQueryOperations>
      recordedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordedAt');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, String, QQueryOperations>
      recordedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'recordedBy');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, double?, QQueryOperations>
      revenueAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'revenueAmount');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, double?, QQueryOperations>
      salesGrowthPercentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salesGrowthPercent');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, double?, QQueryOperations>
      salesVolumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'salesVolume');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, DateTime?, QQueryOperations>
      syncedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'syncedAt');
    });
  }

  QueryBuilder<ProgressIndicatorRecord, String, QQueryOperations>
      uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}
