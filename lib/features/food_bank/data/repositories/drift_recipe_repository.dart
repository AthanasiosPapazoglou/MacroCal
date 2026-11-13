import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/data/mappers/ingredient_row_mapper.dart';
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
  Future<List<String>> recipeNamesUsing(int ingredientId) {
    final recipes = _database.recipesTable;
    final items = _database.recipeIngredientsTable;
    final query =
        _database.select(recipes).join([
            innerJoin(items, items.recipeId.equalsExp(recipes.id)),
          ])
          ..where(items.ingredientId.equals(ingredientId))
          ..orderBy([OrderingTerm.asc(recipes.id)]);
    return query.map((row) => row.readTable(recipes).name).get();
  }

  Stream<List<Recipe>> _watch({int? id}) {
    final recipes = _database.recipesTable;
    final items = _database.recipeIngredientsTable;
    final ingredients = _database.ingredientsTable;
    final query = _database.select(recipes).join([
      leftOuterJoin(items, items.recipeId.equalsExp(recipes.id)),
      leftOuterJoin(ingredients, ingredients.id.equalsExp(items.ingredientId)),
    ])..orderBy([OrderingTerm.asc(recipes.id), OrderingTerm.asc(items.id)]);
    if (id != null) query.where(recipes.id.equals(id));

    return query.watch().map((rows) {
      final ingredientsByRecipe = <RecipeRow, List<RecipeIngredient>>{};
      for (final row in rows) {
        final recipeIngredients = ingredientsByRecipe.putIfAbsent(
          row.readTable(recipes),
          () => [],
        );
        final item = row.readTableOrNull(items);
        if (item != null) {
          recipeIngredients.add(
            RecipeIngredient(
              ingredient: row.readTable(ingredients).toIngredient(),
              grams: item.grams,
            ),
          );
        }
      }
      return [
        for (final MapEntry(key: recipe, value: recipeIngredients)
            in ingredientsByRecipe.entries)
          Recipe(
            id: recipe.id,
            name: recipe.name,
            finalWeightGrams: recipe.finalWeightG,
            ingredients: recipeIngredients,
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
