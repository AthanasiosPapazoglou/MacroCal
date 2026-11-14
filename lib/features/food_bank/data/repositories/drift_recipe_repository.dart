import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/data/mappers/ingredient_row_mapper.dart';
import 'package:macro_cal_public/features/food_bank/data/mappers/micronutrient_rows.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';

class DriftRecipeRepository implements RecipeRepository {
  new(this._database);

  final AppDatabase _database;

  @override
  Stream<List<Recipe>> watchRecipes() => _watch();

  @override
  Stream<Recipe?> watchRecipe(int id) =>
      _watch(id: id).map((recipes) => recipes.firstOrNull);

  @override
  Future<int> addRecipe({
    required String name,
    required List<RecipeIngredient> ingredients,
    int? finalWeightGrams,
  }) => _database.transaction(() async {
    final id = await _database
        .into(_database.recipesTable)
        .insert(
          RecipesTableCompanion.insert(
            name: name,
            finalWeightG: Value(finalWeightGrams),
          ),
        );
    await _insertIngredients(id, ingredients);
    return id;
  });

  @override
  Future<void> updateRecipe(Recipe recipe) => _database.transaction(() async {
    await _database
        .update(_database.recipesTable)
        .replace(
          RecipeRow(
            id: recipe.id,
            name: recipe.name,
            finalWeightG: recipe.finalWeightGrams,
          ),
        );
    await (_database.delete(
      _database.recipeIngredientsTable,
    )..where((item) => item.recipeId.equals(recipe.id))).go();
    await _insertIngredients(recipe.id, recipe.ingredients);
  });

  @override
  Future<void> deleteRecipe(int id) => (_database.delete(
    _database.recipesTable,
  )..where((recipe) => recipe.id.equals(id))).go();

  @override
  Stream<List<String>> watchRecipeNamesUsing(int ingredientId) {
    final recipes = _database.recipesTable;
    final items = _database.recipeIngredientsTable;
    final query =
        _database.select(recipes).join([
            innerJoin(items, items.recipeId.equalsExp(recipes.id)),
          ])
          ..where(items.ingredientId.equals(ingredientId))
          ..orderBy([OrderingTerm.asc(recipes.id)]);
    return query.map((row) => row.readTable(recipes).name).watch();
  }

  Stream<List<Recipe>> _watch({int? id}) {
    final recipes = _database.recipesTable;
    final items = _database.recipeIngredientsTable;
    final ingredients = _database.ingredientsTable;
    final micros = _database.ingredientMicronutrientsTable;
    final query = _database.select(recipes).join([
      leftOuterJoin(items, items.recipeId.equalsExp(recipes.id)),
      leftOuterJoin(ingredients, ingredients.id.equalsExp(items.ingredientId)),
      leftOuterJoin(micros, micros.ingredientId.equalsExp(ingredients.id)),
    ])..orderBy([OrderingTerm.asc(recipes.id), OrderingTerm.asc(items.id)]);
    if (id != null) query.where(recipes.id.equals(id));

    return query.watch().map((rows) {
      final itemsByRecipe = <RecipeRow, Map<RecipeIngredientRow, _Item>>{};
      for (final row in rows) {
        final recipeItems = itemsByRecipe.putIfAbsent(
          row.readTable(recipes),
          () => {},
        );
        final item = row.readTableOrNull(items);
        if (item == null) continue;
        final (_, amounts) = recipeItems.putIfAbsent(
          item,
          () => (row.readTable(ingredients), {}),
        );
        if (row.readTableOrNull(micros) case final micro?) {
          amounts.addStored(micro.nutrient, micro.amount);
        }
      }
      return [
        for (final MapEntry(key: recipe, value: recipeItems)
            in itemsByRecipe.entries)
          Recipe(
            id: recipe.id,
            name: recipe.name,
            finalWeightGrams: recipe.finalWeightG,
            ingredients: [
              for (final MapEntry(key: item, value: (ingredient, amounts))
                  in recipeItems.entries)
                RecipeIngredient(
                  ingredient: ingredient.toIngredient(
                    Micronutrients(amounts: amounts),
                  ),
                  grams: item.grams,
                ),
            ],
          ),
      ];
    });
  }

  Future<void> _insertIngredients(
    int recipeId,
    List<RecipeIngredient> ingredients,
  ) => _database.batch(
    (batch) => batch.insertAll(_database.recipeIngredientsTable, [
      for (final item in ingredients)
        if (item.grams > 0)
          RecipeIngredientsTableCompanion.insert(
            recipeId: recipeId,
            ingredientId: item.ingredient.id,
            grams: item.grams,
          ),
    ]),
  );
}

typedef _Item = (IngredientRow, Map<Micronutrient, double>);
