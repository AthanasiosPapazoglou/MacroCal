import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';

part 'recipe_details_state.freezed.dart';

enum RecipeDetailsStatus { loading, ready, notFound, deleted, failure }

@freezed
abstract class RecipeDetailsState with _$RecipeDetailsState {
  const factory({
    @Default(RecipeDetailsStatus.loading) RecipeDetailsStatus status,
    Recipe? recipe,
  }) = _RecipeDetailsState;
}
