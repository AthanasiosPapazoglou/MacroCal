import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_form_state.dart';

class RecipeFormCubit extends Cubit<RecipeFormState> {
  new(this._recipeRepository, this._ingredientRepository)
    : super(const RecipeFormState());

  final RecipeRepository _recipeRepository;
  final IngredientRepository _ingredientRepository;

  Future<void> load() async {
    try {
      final ingredients = await _ingredientRepository.watchIngredients().first;
      emit(
        state.copyWith(
          status: RecipeFormStatus.ready,
          ingredients: ingredients,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: RecipeFormStatus.failure));
    }
  }

  void addIngredient(Ingredient ingredient) {
    if (state.items.any((item) => item.ingredient.id == ingredient.id)) return;
    _editItems([
      ...state.items,
      RecipeIngredient(ingredient: ingredient, grams: 0),
    ]);
  }

  void updateGrams(int ingredientId, int grams) => _editItems([
    for (final item in state.items)
      if (item.ingredient.id == ingredientId)
        item.copyWith(grams: grams)
      else
        item,
  ]);

  void removeIngredient(int ingredientId) => _editItems([
    for (final item in state.items)
      if (item.ingredient.id != ingredientId) item,
  ]);

  void updateFinalWeight(int grams) => emit(
    state.copyWith(
      status: RecipeFormStatus.ready,
      finalWeightGrams: grams > 0 ? grams : null,
    ),
  );

  Future<void> save(String name) async {
    if (!state.items.any((item) => item.grams > 0)) {
      emit(state.copyWith(status: RecipeFormStatus.missingIngredients));
      return;
    }
    if (name.trim().isEmpty) {
      emit(state.copyWith(status: RecipeFormStatus.invalid));
      return;
    }
    emit(state.copyWith(status: RecipeFormStatus.saving));
    try {
      await _recipeRepository.addRecipe(
        name: name.trim(),
        ingredients: state.items,
        finalWeightGrams: state.finalWeightGrams,
      );
      emit(state.copyWith(status: RecipeFormStatus.saved));
    } on Exception {
      emit(state.copyWith(status: RecipeFormStatus.failure));
    }
  }

  void _editItems(List<RecipeIngredient> items) =>
      emit(state.copyWith(status: RecipeFormStatus.ready, items: items));
}
