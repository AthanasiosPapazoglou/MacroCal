import 'package:drift/drift.dart';

@DataClassName('ProfileRow')
class ProfileTable extends Table {
  @override
  String get tableName => 'profile';

  IntColumn get id => integer().autoIncrement()();
  RealColumn get dailyKcal => real()();
  RealColumn get proteinG => real()();
  RealColumn get fiberG => real()();
  RealColumn get sugarLimitPct => real()();
  RealColumn get saturatedLimitPct => real()();
  RealColumn get saltLimitMg => real()();
  RealColumn get weightKg => real()();
  RealColumn get heightCm => real()();
}
