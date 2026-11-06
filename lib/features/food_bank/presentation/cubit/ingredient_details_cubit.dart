import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_details_state.dart';

class IngredientDetailsCubit extends Cubit<IngredientDetailsState> {
  new(this._repository, this.ingredientId)
    : super(const IngredientDetailsState());

  final IngredientRepository _repository;
  final int ingredientId;
  StreamSubscription<Ingredient?>? _subscription;

  void watch() {
    _subscription ??= _repository.watchIngredient(ingredientId).listen(
      (ingredient) {
        if (state.status == IngredientDetailsStatus.deleted) return;
        emit(
          IngredientDetailsState(
            status: ingredient == null
                ? IngredientDetailsStatus.notFound
                : IngredientDetailsStatus.ready,
            ingredient: ingredient,
          ),
        );
      },
      onError: (Object _) =>
          emit(state.copyWith(status: IngredientDetailsStatus.failure)),
    );
  }

  Future<void> delete() async {
    try {
      await _repository.deleteIngredient(ingredientId);
      emit(state.copyWith(status: IngredientDetailsStatus.deleted));
    } on Exception {
      emit(state.copyWith(status: IngredientDetailsStatus.failure));
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }
}
