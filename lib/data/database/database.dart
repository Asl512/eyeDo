import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:eye_do/ui/res/utils.dart';
import 'package:path_provider/path_provider.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart' as drift;

part 'database.g.dart';

class NotificationTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get dateAndTime => dateTime()();
}

class TimeTable extends Table {
  IntColumn get id => integer().autoIncrement()();

  DateTimeColumn get dateAndTime => dateTime()();

  TextColumn get dateString => text()();

  IntColumn get count => integer()();
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'eyeDoDataBase'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [NotificationTable, TimeTable])
class EyeDoDataBase extends _$EyeDoDataBase {
  EyeDoDataBase() : super(_openConnection());

  Future<int> createNotification({required DateTime dateTime}) async {
    final companion = NotificationTableCompanion(dateAndTime: drift.Value(dateTime));
    final id = await into(notificationTable).insert(companion);
    return id;
  }

  Future<void> _intoTime() async {
    final companion = TimeTableCompanion(
      dateAndTime: drift.Value(DateTime.now()),
      dateString: drift.Value(convertDate(date: DateTime.now())),
      count: const drift.Value(1),
    );
    await into(timeTable).insert(companion);
  }

  Future<void> addTime() async {
    final result = await (select(timeTable)
          ..where((t) => t.dateString.isIn([convertDate(date: DateTime.now())])))
        .getSingleOrNull();
    if (result == null) {
      await _intoTime();
    } else {
      final count = result.count + 1;
      await (update(timeTable)
            ..where((tbl) => tbl.dateString.isIn([convertDate(date: DateTime.now())])))
          .write(TimeTableCompanion(count: drift.Value(count)));
    }
  }

  Future<Map<String, int>> getTime() async {
    Map<String, int> map = {};
    final result = await (select(timeTable).get());
    if (result.isEmpty) return map;
    for (var e in result) {
      map.addAll({e.dateString: e.count});
    }
    return map;
  }

  @override
  int get schemaVersion => 1;
}
