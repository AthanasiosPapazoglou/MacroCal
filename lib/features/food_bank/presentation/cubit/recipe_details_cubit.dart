import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_details_state.dart';

class RecipeDetailsCubit extends Cubit<RecipeDetailsState> {
  new(this._repository, this.recipeId) : super(const RecipeDetailsState());

  final RecipeRepository _repository;
  final int recipeId;
  StreamSubscription<Recipe?>? _subscription;

  void watch() {
    _subscription ??= _repository.watchRecipe(recipeId).listen(
      (recipe) {
        if (state.status == RecipeDetailsStatus.deleted) return;
        emit(
          RecipeDetailsState(
            status: recipe == null
                ? RecipeDetailsStatus.notFound
                : RecipeDetailsStatus.ready,
            recipe: recipe,
          ),
        );
      },
      onError: (Object _) =>
          emit(state.copyWith(status: RecipeDetailsStatus.failure)),
    );
  }

  Future<void> delete() async {
    try {
      await _repository.deleteRecipe(recipeId);
      emit(state.copyWith(status: RecipeDetailsStatus.deleted));
    } on Exception {
      emit(state.copyWith(status: RecipeDetailsStatus.failure));
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }
}
