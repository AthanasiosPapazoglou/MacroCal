import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';

part 'ingredient_details_state.freezed.dart';

enum IngredientDetailsStatus { loading, ready, notFound, deleted, failure }

@freezed
abstract class IngredientDetailsState with _$IngredientDetailsState {
  const factory({
    @Default(IngredientDetailsStatus.loading) IngredientDetailsStatus status,
    Ingredient? ingredient,
  }) = _IngredientDetailsState;
}
