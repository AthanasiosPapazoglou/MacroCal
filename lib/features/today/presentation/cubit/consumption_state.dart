import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';

part 'consumption_state.freezed.dart';

enum ConsumptionStatus { loading, ready, saving, saved, failure }

@freezed
abstract class ConsumptionState with _$ConsumptionState {
  const factory({
    @Default(ConsumptionStatus.loading) ConsumptionStatus status,
    @Default(<Ingredient>[]) List<Ingredient> ingredients,
    @Default(<int, int>{}) Map<int, int> grams,
    @Default(<int>[]) List<int> consumedIds,
    @Default('') String query,
  }) = _ConsumptionState;

  const new _();

  int gramsOf(int ingredientId) => grams[ingredientId] ?? 0;

  bool get isFiltering => query.isNotEmpty;

  List<Ingredient> get visibleIngredients => isFiltering
      ? [
          for (final ingredient in ingredients)
            if (ingredient.name.toLowerCase().contains(query.toLowerCase()))
              ingredient,
        ]
      : ingredients;

  /// Snapshot taken by refreshConsumed, so rows stay put while being edited.
  List<Ingredient> get consumedIngredients => [
    for (final ingredient in ingredients)
      if (consumedIds.contains(ingredient.id)) ingredient,
  ];
}
