import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/food_kind.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/supplement_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_state.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';

class FoodBankCubit extends Cubit<FoodBankState> {
  new(
    this._ingredientRepository,
    this._recipeRepository,
    this._supplementRepository,
    this._settingsRepository,
  ) : super(const FoodBankState());

  final IngredientRepository _ingredientRepository;
  final RecipeRepository _recipeRepository;
  final SupplementRepository _supplementRepository;
  final SettingsRepository _settingsRepository;
  StreamSubscription<List<Ingredient>>? _ingredients;
  StreamSubscription<List<Recipe>>? _recipes;
  StreamSubscription<List<Supplement>>? _supplements;
  StreamSubscription<bool>? _microcalEnabled;

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
    _supplements ??= _supplementRepository.watchSupplements().listen(
      (supplements) => emit(state.copyWith(supplements: supplements)),
      onError: _fail,
    );
    _microcalEnabled ??= _settingsRepository.watchMicrocalEnabled().listen(
      (enabled) => emit(
        state.copyWith(
          showSupplements: enabled,
          kind: !enabled && state.kind == FoodKind.supplement
              ? FoodKind.ingredient
              : state.kind,
        ),
      ),
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
    await _supplements?.cancel();
    await _microcalEnabled?.cancel();
    await super.close();
  }
}
