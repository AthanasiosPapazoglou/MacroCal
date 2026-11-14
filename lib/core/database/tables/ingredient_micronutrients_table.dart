import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/tables/ingredients_table.dart';

/// Micronutrient amounts per 100 g; a missing row is an unknown amount.
@DataClassName('IngredientMicronutrientRow')
class IngredientMicronutrientsTable extends Table {
  @override
  String get tableName => 'ingredient_micronutrients';

  IntColumn get ingredientId => integer().references(
    IngredientsTable,
    #id,
    onDelete: KeyAction.cascade,
  )();
  TextColumn get nutrient => text()();
  RealColumn get amount => real()();

  @override
  Set<Column<Object>> get primaryKey => {ingredientId, nutrient};
}
