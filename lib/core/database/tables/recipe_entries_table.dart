import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/tables/recipes_table.dart';

@DataClassName('RecipeEntryRow')
class RecipeEntriesTable extends Table {
  @override
  String get tableName => 'recipe_entries';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get recipeId => integer().unique().references(
    RecipesTable,
    #id,
    onDelete: KeyAction.cascade,
  )();
  IntColumn get grams => integer()();
}
