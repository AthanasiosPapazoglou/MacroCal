import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/tables/ingredients_table.dart';
import 'package:macro_cal_public/core/database/tables/recipes_table.dart';

@DataClassName('RecipeIngredientRow')
class RecipeIngredientsTable extends Table {
  @override
  String get tableName => 'recipe_ingredients';

  IntColumn get id => integer().autoIncrement()();
  IntColumn get recipeId =>
      integer().references(RecipesTable, #id, onDelete: KeyAction.cascade)();
  IntColumn get ingredientId => integer().references(
    IngredientsTable,
    #id,
    onDelete: KeyAction.cascade,
  )();
  IntColumn get grams => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {recipeId, ingredientId},
  ];
}
