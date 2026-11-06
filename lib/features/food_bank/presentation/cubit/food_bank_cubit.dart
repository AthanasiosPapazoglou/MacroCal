import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_state.dart';

class FoodBankCubit extends Cubit<FoodBankState> {
  new(this._repository) : super(const FoodBankState());

  final IngredientRepository _repository;
  StreamSubscription<List<Ingredient>>? _subscription;

  void watch() {
    _subscription ??= _repository.watchIngredients().listen(
      (ingredients) => emit(
        state.copyWith(status: FoodBankStatus.ready, ingredients: ingredients),
      ),
      onError: (Object _) =>
          emit(state.copyWith(status: FoodBankStatus.failure)),
    );
  }

  void search(String query) => emit(state.copyWith(query: query));

  Future<void> delete(int ingredientId) async {
    try {
      await _repository.deleteIngredient(ingredientId);
    } on Exception {
      emit(state.copyWith(status: FoodBankStatus.failure));
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }
}
