import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/food_kind.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';

part 'consumption_state.freezed.dart';

enum ConsumptionStatus { loading, ready, saving, saved, failure }

@freezed
abstract class ConsumptionState with _$ConsumptionState {
  const factory({
    @Default(ConsumptionStatus.loading) ConsumptionStatus status,
    @Default(FoodKind.ingredient) FoodKind kind,
    @Default(<Ingredient>[]) List<Ingredient> ingredients,
    @Default(<Recipe>[]) List<Recipe> recipes,
    @Default(<int, int>{}) Map<int, int> grams,
    @Default(<int, int>{}) Map<int, int> recipeGrams,
    @Default(<int>[]) List<int> consumedIds,
    @Default(<int>[]) List<int> consumedRecipeIds,
    @Default('') String query,
  }) = _ConsumptionState;

  const new _();

  int gramsOf(int ingredientId) => grams[ingredientId] ?? 0;

  int recipeGramsOf(int recipeId) => recipeGrams[recipeId] ?? 0;

  bool get isFiltering => query.isNotEmpty;

  List<Ingredient> get visibleIngredients => [
    for (final ingredient in ingredients)
      if (_matches(ingredient.name)) ingredient,
  ];

  List<Recipe> get visibleRecipes => [
    for (final recipe in recipes)
      if (_matches(recipe.name)) recipe,
  ];

  /// Snapshot taken by refreshConsumed, so rows stay put while being edited.
  List<Ingredient> get consumedIngredients => [
    for (final ingredient in ingredients)
      if (consumedIds.contains(ingredient.id)) ingredient,
  ];

  List<Recipe> get consumedRecipes => [
    for (final recipe in recipes)
      if (consumedRecipeIds.contains(recipe.id)) recipe,
  ];

  bool _matches(String name) =>
      name.toLowerCase().contains(query.toLowerCase());
}
