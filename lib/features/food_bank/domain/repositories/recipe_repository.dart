import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';

/// Keeps ingredients in the given order and leaves out those without grams.
abstract interface class RecipeRepository {
  Stream<List<Recipe>> watchRecipes();

  Stream<Recipe?> watchRecipe(int id);

  Future<int> addRecipe({
    required String name,
    required List<RecipeIngredient> ingredients,
    int? finalWeightGrams,
  });

  Future<void> updateRecipe(Recipe recipe);

  Future<void> deleteRecipe(int id);

  Stream<List<String>> watchRecipeNamesUsing(int ingredientId);
}
