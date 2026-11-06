import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/tables/activities_table.dart';

@DataClassName('ActivityEntryRow')
class ActivityEntriesTable extends Table {
  @override
  String get tableName => 'activity_entries';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get activityId => integer().unique().references(
    ActivitiesTable,
    #id,
    onDelete: KeyAction.cascade,
  )();
  IntColumn get amount => integer()();
}
