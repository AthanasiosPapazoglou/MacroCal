import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/tables/ingredients_table.dart';

@DataClassName('FoodEntryRow')
class FoodEntriesTable extends Table {
  @override
  String get tableName => 'food_entries';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get ingredientId => integer().unique().references(
    IngredientsTable,
    #id,
    onDelete: KeyAction.cascade,
  )();
  IntColumn get grams => integer()();
}
