import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/tables/supplements_table.dart';

@DataClassName('SupplementEntryRow')
class SupplementEntriesTable extends Table {
  @override
  String get tableName => 'supplement_entries';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get supplementId => integer().unique().references(
    SupplementsTable,
    #id,
    onDelete: KeyAction.cascade,
  )();
  RealColumn get units => real()();
}
