import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/food_kind.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_state.dart';

class FoodBankCubit extends Cubit<FoodBankState> {
  new(this._ingredientRepository, this._recipeRepository)
    : super(const FoodBankState());

  final IngredientRepository _ingredientRepository;
  final RecipeRepository _recipeRepository;
  StreamSubscription<List<Ingredient>>? _ingredients;
  StreamSubscription<List<Recipe>>? _recipes;

  void watch() {
    _ingredients ??= _ingredientRepository.watchIngredients().listen(
      (ingredients) => emit(
        state.copyWith(status: FoodBankStatus.ready, ingredients: ingredients),
      ),
      onError: _fail,
    );
    _recipes ??= _recipeRepository.watchRecipes().listen(
      (recipes) => emit(state.copyWith(recipes: recipes)),
      onError: _fail,
    );
  }

  void selectKind(FoodKind kind) => emit(state.copyWith(kind: kind));

  void search(String query) => emit(state.copyWith(query: query));

  void _fail(Object _) => emit(state.copyWith(status: FoodBankStatus.failure));

  @override
  Future<void> close() async {
    await _ingredients?.cancel();
    await _recipes?.cancel();
    await super.close();
  }
}
