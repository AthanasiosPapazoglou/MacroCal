import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_details_state.dart';

class IngredientDetailsCubit extends Cubit<IngredientDetailsState> {
  new(this._ingredientRepository, this._recipeRepository, this.ingredientId)
    : super(const IngredientDetailsState());

  final IngredientRepository _ingredientRepository;
  final RecipeRepository _recipeRepository;
  final int ingredientId;
  StreamSubscription<Ingredient?>? _ingredient;
  StreamSubscription<List<String>>? _recipeNames;

  void watch() {
    _ingredient ??= _ingredientRepository
        .watchIngredient(ingredientId)
        .listen(
          (ingredient) => _emitUnlessDeleted(
            state.copyWith(
              status: ingredient == null
                  ? IngredientDetailsStatus.notFound
                  : IngredientDetailsStatus.ready,
              ingredient: ingredient,
            ),
          ),
          onError: _fail,
        );
    _recipeNames ??= _recipeRepository
        .watchRecipeNamesUsing(ingredientId)
        .listen(
          (names) => _emitUnlessDeleted(state.copyWith(recipeNames: names)),
          onError: _fail,
        );
  }

  Future<void> delete() async {
    try {
      await _ingredientRepository.deleteIngredient(ingredientId);
      emit(state.copyWith(status: IngredientDetailsStatus.deleted));
    } on Exception {
      emit(state.copyWith(status: IngredientDetailsStatus.failure));
    }
  }

  void _emitUnlessDeleted(IngredientDetailsState next) {
    if (state.status != IngredientDetailsStatus.deleted) emit(next);
  }

  void _fail(Object _) =>
      emit(state.copyWith(status: IngredientDetailsStatus.failure));

  @override
  Future<void> close() async {
    await _ingredient?.cancel();
    await _recipeNames?.cancel();
    await super.close();
  }
}
