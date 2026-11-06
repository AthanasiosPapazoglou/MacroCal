import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/consumption_state.dart';

class ConsumptionCubit extends Cubit<ConsumptionState> {
  new(this._ingredientRepository, this._foodLogRepository)
    : super(const ConsumptionState());

  final IngredientRepository _ingredientRepository;
  final FoodLogRepository _foodLogRepository;

  Future<void> load() async {
    try {
      final ingredients = await _ingredientRepository.watchIngredients().first;
      final entries = await _foodLogRepository.watchEntries().first;
      final grams = {
        for (final entry in entries) entry.ingredient.id: entry.grams,
      };
      emit(
        ConsumptionState(
          status: ConsumptionStatus.ready,
          ingredients: ingredients,
          grams: grams,
          consumedIds: _consumedIds(ingredients, grams),
        ),
      );
    } on Exception {
      emit(state.copyWith(status: ConsumptionStatus.failure));
    }
  }

  void updateGrams(int ingredientId, int grams) =>
      emit(state.copyWith(grams: {...state.grams, ingredientId: grams}));

  void search(String query) => emit(state.copyWith(query: query));

  void refreshConsumed() => emit(
    state.copyWith(consumedIds: _consumedIds(state.ingredients, state.grams)),
  );

  Future<void> save() async {
    emit(state.copyWith(status: ConsumptionStatus.saving));
    try {
      await _foodLogRepository.replaceGrams(state.grams);
      emit(
        state.copyWith(
          status: ConsumptionStatus.saved,
          consumedIds: _consumedIds(state.ingredients, state.grams),
        ),
      );
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
          consumedIds: const [],
        ),
      );
    } on Exception {
      emit(state.copyWith(status: ConsumptionStatus.failure));
    }
  }

  static List<int> _consumedIds(
    List<Ingredient> ingredients,
    Map<int, int> grams,
  ) => [
    for (final ingredient in ingredients)
      if ((grams[ingredient.id] ?? 0) > 0) ingredient.id,
  ];
}
