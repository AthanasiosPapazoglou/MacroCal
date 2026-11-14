import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/tables/supplements_table.dart';

/// Micronutrient amounts per unit of a supplement.
@DataClassName('SupplementMicronutrientRow')
class SupplementMicronutrientsTable extends Table {
  @override
  String get tableName => 'supplement_micronutrients';

  IntColumn get supplementId => integer().references(
    SupplementsTable,
    #id,
    onDelete: KeyAction.cascade,
  )();
  TextColumn get nutrient => text()();
  RealColumn get amount => real()();

  @override
  Set<Column<Object>> get primaryKey => {supplementId, nutrient};
}
