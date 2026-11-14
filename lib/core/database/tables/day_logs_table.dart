import 'package:drift/drift.dart';

@DataClassName('DayLogRow')
class DayLogsTable extends Table {
  @override
  String get tableName => 'day_logs';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get day => text().unique()();
  RealColumn get dailyKcal => real()();
  RealColumn get proteinGoalG => real()();
  RealColumn get fiberGoalG => real()();
  RealColumn get sugarLimitPct => real()();
  RealColumn get saturatedLimitPct => real()();
  RealColumn get saltLimitMg => real()();
  RealColumn get burnedKcal => real()();
  RealColumn get adjustedKcal => real()();
  RealColumn get sugarLimitG => real()();
  RealColumn get saturatedLimitG => real()();
  RealColumn get kcal => real()();
  RealColumn get proteinG => real()();
  RealColumn get carbsG => real()();
  RealColumn get sugarsG => real()();
  RealColumn get fatG => real()();
  RealColumn get saturatedG => real()();
  RealColumn get fiberG => real()();
  RealColumn get saltMg => real()();
  TextColumn get sex => text().nullable()();
  IntColumn get age => integer().nullable()();
}
