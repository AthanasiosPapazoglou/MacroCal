import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';

part 'food_entry.freezed.dart';

/// Grams of an ingredient or a recipe eaten today.
sealed class FoodEntry {
  int get grams;

  Nutrients get per100g;
}

@freezed
abstract class IngredientEntry with _$IngredientEntry implements FoodEntry {
  const factory({required Ingredient ingredient, required int grams}) =
      _IngredientEntry;

  const new _();

  @override
  Nutrients get per100g => ingredient.per100g;
}

@freezed
abstract class RecipeEntry with _$RecipeEntry implements FoodEntry {
  const factory({required Recipe recipe, required int grams}) = _RecipeEntry;

  const new _();

  @override
  Nutrients get per100g => recipe.per100g;
}
