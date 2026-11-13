import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';

part 'recipe.freezed.dart';

@freezed
abstract class Recipe with _$Recipe {
  const factory({
    required int id,
    required String name,
    @Default(<RecipeIngredient>[]) List<RecipeIngredient> ingredients,
    int? finalWeightGrams,
  }) = _Recipe;

  const new _();

  int get ingredientsWeightGrams =>
      ingredients.fold(0, (total, item) => total + item.grams);

  /// The final weight when set, otherwise the ingredients' weight.
  int get weightGrams => finalWeightGrams ?? ingredientsWeightGrams;

  Nutrients get totalNutrients => ingredients.fold(
    const Nutrients(),
    (total, item) => total + item.nutrients,
  );

  /// Nutrients in 100 g of the finished recipe; zero when it weighs nothing.
  Nutrients get per100g => weightGrams > 0
      ? totalNutrients.scaled(100 / weightGrams)
      : const Nutrients();
}

@freezed
abstract class RecipeIngredient with _$RecipeIngredient {
  const factory({required Ingredient ingredient, required int grams}) =
      _RecipeIngredient;

  const new _();

  Nutrients get nutrients => ingredient.per100g.scaled(grams / 100);
}
