import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/food_kind.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/supplement_repository.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/consumption_state.dart';

class ConsumptionCubit extends Cubit<ConsumptionState> {
  new(
    this._ingredientRepository,
    this._recipeRepository,
    this._foodLogRepository,
    this._supplementRepository,
    this._settingsRepository,
  ) : super(const ConsumptionState());

  final IngredientRepository _ingredientRepository;
  final RecipeRepository _recipeRepository;
  final FoodLogRepository _foodLogRepository;
  final SupplementRepository _supplementRepository;
  final SettingsRepository _settingsRepository;

  Future<void> load() async {
    try {
      final ingredients = await _ingredientRepository.watchIngredients().first;
      final recipes = await _recipeRepository.watchRecipes().first;
      final entries = await _foodLogRepository.watchEntries().first;
      final supplements = await _supplementRepository.watchSupplements().first;
      final supplementEntries = await _foodLogRepository
          .watchSupplementEntries()
          .first;
      final showSupplements = await _settingsRepository
          .watchMicrocalEnabled()
          .first;
      emit(
        _withConsumed(
          ConsumptionState(
            status: ConsumptionStatus.ready,
            ingredients: ingredients,
            recipes: recipes,
            supplements: supplements,
            showSupplements: showSupplements,
            grams: {
              for (final entry in entries)
                if (entry case IngredientEntry(:final ingredient, :final grams))
                  ingredient.id: grams,
            },
            recipeGrams: {
              for (final entry in entries)
                if (entry case RecipeEntry(:final recipe, :final grams))
                  recipe.id: grams,
            },
            supplementUnits: {
              for (final entry in supplementEntries)
                entry.supplement.id: entry.units.round(),
            },
          ),
        ),
      );
    } on Exception {
      emit(state.copyWith(status: ConsumptionStatus.failure));
    }
  }

  void selectKind(FoodKind kind) => emit(state.copyWith(kind: kind));

  void updateGrams(int ingredientId, int grams) =>
      emit(state.copyWith(grams: {...state.grams, ingredientId: grams}));

  void updateRecipeGrams(int recipeId, int grams) => emit(
    state.copyWith(recipeGrams: {...state.recipeGrams, recipeId: grams}),
  );

  void updateSupplementUnits(int supplementId, int units) => emit(
    state.copyWith(
      supplementUnits: {...state.supplementUnits, supplementId: units},
    ),
  );

  void search(String query) => emit(state.copyWith(query: query));

  void refreshConsumed() => emit(_withConsumed(state));

  Future<void> save() async {
    emit(state.copyWith(status: ConsumptionStatus.saving));
    try {
      await _foodLogRepository.replaceGrams(
        state.grams,
        gramsByRecipeId: state.recipeGrams,
      );
      await _foodLogRepository.replaceSupplementUnits({
        for (final MapEntry(key: id, value: units)
            in state.supplementUnits.entries)
          id: units.toDouble(),
      });
      emit(_withConsumed(state.copyWith(status: ConsumptionStatus.saved)));
    } on Exception {
      emit(state.copyWith(status: ConsumptionStatus.failure));
    }
  }

  Future<void> reset() async {
    try {
      await _foodLogRepository.clear();
      emit(
        state.copyWith(
          status: ConsumptionStatus.ready,
          grams: const {},
          recipeGrams: const {},
          supplementUnits: const {},
          consumedIds: const [],
          consumedRecipeIds: const [],
          consumedSupplementIds: const [],
        ),
      );
    } on Exception {
      emit(state.copyWith(status: ConsumptionStatus.failure));
    }
  }

  static ConsumptionState _withConsumed(ConsumptionState state) =>
      state.copyWith(
        consumedIds: [
          for (final ingredient in state.ingredients)
            if (state.gramsOf(ingredient.id) > 0) ingredient.id,
        ],
        consumedRecipeIds: [
          for (final recipe in state.recipes)
            if (state.recipeGramsOf(recipe.id) > 0) recipe.id,
        ],
        consumedSupplementIds: [
          for (final supplement in state.supplements)
            if (state.unitsOf(supplement.id) > 0) supplement.id,
        ],
      );
}
