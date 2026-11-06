import 'package:drift/drift.dart';

@DataClassName('ActivityRow')
class ActivitiesTable extends Table {
  @override
  String get tableName => 'activities';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get presetKey => text().nullable()();
  TextColumn get name => text()();
  IntColumn get kcalPerUnit => integer()();
  TextColumn get unitLabel => text()();
  BoolColumn get isDurationBased =>
      boolean().withDefault(const Constant(false))();
}
