// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class NotificationTableData extends DataClass
    implements Insertable<NotificationTableData> {
  final int id;
  final DateTime dateAndTime;
  const NotificationTableData({required this.id, required this.dateAndTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date_and_time'] = Variable<DateTime>(dateAndTime);
    return map;
  }

  NotificationTableCompanion toCompanion(bool nullToAbsent) {
    return NotificationTableCompanion(
      id: Value(id),
      dateAndTime: Value(dateAndTime),
    );
  }

  factory NotificationTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationTableData(
      id: serializer.fromJson<int>(json['id']),
      dateAndTime: serializer.fromJson<DateTime>(json['dateAndTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dateAndTime': serializer.toJson<DateTime>(dateAndTime),
    };
  }

  NotificationTableData copyWith({int? id, DateTime? dateAndTime}) =>
      NotificationTableData(
        id: id ?? this.id,
        dateAndTime: dateAndTime ?? this.dateAndTime,
      );
  @override
  String toString() {
    return (StringBuffer('NotificationTableData(')
          ..write('id: $id, ')
          ..write('dateAndTime: $dateAndTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dateAndTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationTableData &&
          other.id == this.id &&
          other.dateAndTime == this.dateAndTime);
}

class NotificationTableCompanion
    extends UpdateCompanion<NotificationTableData> {
  final Value<int> id;
  final Value<DateTime> dateAndTime;
  const NotificationTableCompanion({
    this.id = const Value.absent(),
    this.dateAndTime = const Value.absent(),
  });
  NotificationTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime dateAndTime,
  }) : dateAndTime = Value(dateAndTime);
  static Insertable<NotificationTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? dateAndTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateAndTime != null) 'date_and_time': dateAndTime,
    });
  }

  NotificationTableCompanion copyWith(
      {Value<int>? id, Value<DateTime>? dateAndTime}) {
    return NotificationTableCompanion(
      id: id ?? this.id,
      dateAndTime: dateAndTime ?? this.dateAndTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dateAndTime.present) {
      map['date_and_time'] = Variable<DateTime>(dateAndTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationTableCompanion(')
          ..write('id: $id, ')
          ..write('dateAndTime: $dateAndTime')
          ..write(')'))
        .toString();
  }
}

class $NotificationTableTable extends NotificationTable
    with TableInfo<$NotificationTableTable, NotificationTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dateAndTimeMeta =
      const VerificationMeta('dateAndTime');
  @override
  late final GeneratedColumn<DateTime> dateAndTime = GeneratedColumn<DateTime>(
      'date_and_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, dateAndTime];
  @override
  String get aliasedName => _alias ?? 'notification_table';
  @override
  String get actualTableName => 'notification_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<NotificationTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date_and_time')) {
      context.handle(
          _dateAndTimeMeta,
          dateAndTime.isAcceptableOrUnknown(
              data['date_and_time']!, _dateAndTimeMeta));
    } else if (isInserting) {
      context.missing(_dateAndTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationTableData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dateAndTime: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_and_time'])!,
    );
  }

  @override
  $NotificationTableTable createAlias(String alias) {
    return $NotificationTableTable(attachedDatabase, alias);
  }
}

class TimeTableData extends DataClass implements Insertable<TimeTableData> {
  final int id;
  final DateTime dateAndTime;
  final String dateString;
  final int count;
  const TimeTableData(
      {required this.id,
      required this.dateAndTime,
      required this.dateString,
      required this.count});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['date_and_time'] = Variable<DateTime>(dateAndTime);
    map['date_string'] = Variable<String>(dateString);
    map['count'] = Variable<int>(count);
    return map;
  }

  TimeTableCompanion toCompanion(bool nullToAbsent) {
    return TimeTableCompanion(
      id: Value(id),
      dateAndTime: Value(dateAndTime),
      dateString: Value(dateString),
      count: Value(count),
    );
  }

  factory TimeTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimeTableData(
      id: serializer.fromJson<int>(json['id']),
      dateAndTime: serializer.fromJson<DateTime>(json['dateAndTime']),
      dateString: serializer.fromJson<String>(json['dateString']),
      count: serializer.fromJson<int>(json['count']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dateAndTime': serializer.toJson<DateTime>(dateAndTime),
      'dateString': serializer.toJson<String>(dateString),
      'count': serializer.toJson<int>(count),
    };
  }

  TimeTableData copyWith(
          {int? id, DateTime? dateAndTime, String? dateString, int? count}) =>
      TimeTableData(
        id: id ?? this.id,
        dateAndTime: dateAndTime ?? this.dateAndTime,
        dateString: dateString ?? this.dateString,
        count: count ?? this.count,
      );
  @override
  String toString() {
    return (StringBuffer('TimeTableData(')
          ..write('id: $id, ')
          ..write('dateAndTime: $dateAndTime, ')
          ..write('dateString: $dateString, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dateAndTime, dateString, count);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimeTableData &&
          other.id == this.id &&
          other.dateAndTime == this.dateAndTime &&
          other.dateString == this.dateString &&
          other.count == this.count);
}

class TimeTableCompanion extends UpdateCompanion<TimeTableData> {
  final Value<int> id;
  final Value<DateTime> dateAndTime;
  final Value<String> dateString;
  final Value<int> count;
  const TimeTableCompanion({
    this.id = const Value.absent(),
    this.dateAndTime = const Value.absent(),
    this.dateString = const Value.absent(),
    this.count = const Value.absent(),
  });
  TimeTableCompanion.insert({
    this.id = const Value.absent(),
    required DateTime dateAndTime,
    required String dateString,
    required int count,
  })  : dateAndTime = Value(dateAndTime),
        dateString = Value(dateString),
        count = Value(count);
  static Insertable<TimeTableData> custom({
    Expression<int>? id,
    Expression<DateTime>? dateAndTime,
    Expression<String>? dateString,
    Expression<int>? count,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dateAndTime != null) 'date_and_time': dateAndTime,
      if (dateString != null) 'date_string': dateString,
      if (count != null) 'count': count,
    });
  }

  TimeTableCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? dateAndTime,
      Value<String>? dateString,
      Value<int>? count}) {
    return TimeTableCompanion(
      id: id ?? this.id,
      dateAndTime: dateAndTime ?? this.dateAndTime,
      dateString: dateString ?? this.dateString,
      count: count ?? this.count,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dateAndTime.present) {
      map['date_and_time'] = Variable<DateTime>(dateAndTime.value);
    }
    if (dateString.present) {
      map['date_string'] = Variable<String>(dateString.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimeTableCompanion(')
          ..write('id: $id, ')
          ..write('dateAndTime: $dateAndTime, ')
          ..write('dateString: $dateString, ')
          ..write('count: $count')
          ..write(')'))
        .toString();
  }
}

class $TimeTableTable extends TimeTable
    with TableInfo<$TimeTableTable, TimeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimeTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _dateAndTimeMeta =
      const VerificationMeta('dateAndTime');
  @override
  late final GeneratedColumn<DateTime> dateAndTime = GeneratedColumn<DateTime>(
      'date_and_time', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  final VerificationMeta _dateStringMeta = const VerificationMeta('dateString');
  @override
  late final GeneratedColumn<String> dateString = GeneratedColumn<String>(
      'date_string', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  final VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
      'count', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, dateAndTime, dateString, count];
  @override
  String get aliasedName => _alias ?? 'time_table';
  @override
  String get actualTableName => 'time_table';
  @override
  VerificationContext validateIntegrity(Insertable<TimeTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('date_and_time')) {
      context.handle(
          _dateAndTimeMeta,
          dateAndTime.isAcceptableOrUnknown(
              data['date_and_time']!, _dateAndTimeMeta));
    } else if (isInserting) {
      context.missing(_dateAndTimeMeta);
    }
    if (data.containsKey('date_string')) {
      context.handle(
          _dateStringMeta,
          dateString.isAcceptableOrUnknown(
              data['date_string']!, _dateStringMeta));
    } else if (isInserting) {
      context.missing(_dateStringMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
          _countMeta, count.isAcceptableOrUnknown(data['count']!, _countMeta));
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  TimeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimeTableData(
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      dateAndTime: attachedDatabase.options.types.read(
          DriftSqlType.dateTime, data['${effectivePrefix}date_and_time'])!,
      dateString: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}date_string'])!,
      count: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}count'])!,
    );
  }

  @override
  $TimeTableTable createAlias(String alias) {
    return $TimeTableTable(attachedDatabase, alias);
  }
}

abstract class _$EyeDoDataBase extends GeneratedDatabase {
  _$EyeDoDataBase(QueryExecutor e) : super(e);
  late final $NotificationTableTable notificationTable =
      $NotificationTableTable(this);
  late final $TimeTableTable timeTable = $TimeTableTable(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [notificationTable, timeTable];
}
