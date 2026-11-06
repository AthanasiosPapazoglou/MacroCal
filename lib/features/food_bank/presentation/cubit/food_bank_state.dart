import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';

part 'food_bank_state.freezed.dart';

enum FoodBankStatus { loading, ready, failure }

@freezed
abstract class FoodBankState with _$FoodBankState {
  const factory({
    @Default(FoodBankStatus.loading) FoodBankStatus status,
    @Default(<Ingredient>[]) List<Ingredient> ingredients,
    @Default('') String query,
  }) = _FoodBankState;

  const new _();

  bool get isFiltering => query.isNotEmpty;

  List<Ingredient> get visibleIngredients => isFiltering
      ? [
          for (final ingredient in ingredients)
            if (ingredient.name.toLowerCase().contains(query.toLowerCase()))
              ingredient,
        ]
      : ingredients;

  Ingredient? ingredientById(int id) =>
      ingredients.where((ingredient) => ingredient.id == id).firstOrNull;
}
