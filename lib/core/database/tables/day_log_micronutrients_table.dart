import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/tables/day_logs_table.dart';

@DataClassName('DayLogMicronutrientRow')
class DayLogMicronutrientsTable extends Table {
  @override
  String get tableName => 'day_log_micronutrients';

  IntColumn get dayLogId =>
      integer().references(DayLogsTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get nutrient => text()();
  RealColumn get foodAmount => real().nullable()();
  RealColumn get supplementAmount => real().nullable()();
  RealColumn get coverage => real()();

  @override
  Set<Column<Object>> get primaryKey => {dayLogId, nutrient};
}
