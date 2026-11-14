import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/food_kind.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';

part 'food_bank_state.freezed.dart';

enum FoodBankStatus { loading, ready, failure }

@freezed
abstract class FoodBankState with _$FoodBankState {
  const factory({
    @Default(FoodBankStatus.loading) FoodBankStatus status,
    @Default(FoodKind.ingredient) FoodKind kind,
    @Default(<Ingredient>[]) List<Ingredient> ingredients,
    @Default(<Recipe>[]) List<Recipe> recipes,
    @Default(<Supplement>[]) List<Supplement> supplements,
    @Default(false) bool showSupplements,
    @Default('') String query,
  }) = _FoodBankState;

  const new _();

  bool get isFiltering => query.isNotEmpty;

  List<Ingredient> get visibleIngredients => [
    for (final ingredient in ingredients)
      if (_matches(ingredient.name)) ingredient,
  ];

  List<Recipe> get visibleRecipes => [
    for (final recipe in recipes)
      if (_matches(recipe.name)) recipe,
  ];

  List<Supplement> get visibleSupplements => [
    for (final supplement in supplements)
      if (_matches(supplement.name)) supplement,
  ];

  bool _matches(String name) =>
      name.toLowerCase().contains(query.toLowerCase());
}
