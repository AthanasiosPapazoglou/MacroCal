import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';

part 'recipe_form_state.freezed.dart';

enum RecipeFormStatus {
  loading,
  ready,
  invalid,
  missingIngredients,
  saving,
  saved,
  failure,
}

@freezed
abstract class RecipeFormState with _$RecipeFormState {
  const factory({
    @Default(RecipeFormStatus.loading) RecipeFormStatus status,
    @Default(<Ingredient>[]) List<Ingredient> ingredients,
    @Default(<RecipeIngredient>[]) List<RecipeIngredient> items,
    int? finalWeightGrams,
  }) = _RecipeFormState;

  const new _();

  /// The recipe as entered so far, for its live totals.
  Recipe get draft => Recipe(
    id: 0,
    name: '',
    ingredients: items,
    finalWeightGrams: finalWeightGrams,
  );

  /// The ingredients not in the recipe yet.
  List<Ingredient> get addable => [
    for (final ingredient in ingredients)
      if (!items.any((item) => item.ingredient.id == ingredient.id)) ingredient,
  ];
}
