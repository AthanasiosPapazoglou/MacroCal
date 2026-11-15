import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
import 'package:macro_cal_public/features/today/domain/entities/supplement_entry.dart';

class MicroIntakeCalculator {
  const new();

  /// Recipes count as their ingredients: amounts follow the finished weight,
  /// coverage splits the eaten grams by the ingredients' share of the recipe.
  MicroIntake intake({
    required Iterable<FoodEntry> foodEntries,
    Iterable<SupplementEntry> supplementEntries = const [],
  }) {
    var food = const Micronutrients();
    var eatenGrams = 0.0;
    final knownGrams = <Micronutrient, double>{};
    for (final (:ingredient, :amountGrams, :coverageGrams) in [
      for (final entry in foodEntries) ..._portions(entry),
    ]) {
      final micros = ingredient.per100g.micros;
      food += micros.scaled(amountGrams / 100);
      eatenGrams += coverageGrams;
      for (final nutrient in micros.amounts.keys) {
        knownGrams[nutrient] = (knownGrams[nutrient] ?? 0) + coverageGrams;
      }
    }
    return MicroIntake(
      food: food,
      supplements: supplementEntries.fold(
        const Micronutrients(),
        (total, entry) => total + entry.micros,
      ),
      coverage: eatenGrams > 0
          ? knownGrams.map((key, grams) => MapEntry(key, grams / eatenGrams))
          : const {},
    );
  }

  /// The daily average over [days]; a nutrient missing on a day counts as 0
  /// there and stays unknown only when it is missing on every day.
  MicroIntake average(List<MicroIntake> days) {
    if (days.isEmpty) return const MicroIntake();
    final factor = 1 / days.length;
    final coverage = <Micronutrient, double>{};
    for (final day in days) {
      for (final MapEntry(:key, :value) in day.coverage.entries) {
        coverage[key] = (coverage[key] ?? 0) + value * factor;
      }
    }
    return MicroIntake(
      food: days
          .fold(const Micronutrients(), (total, day) => total + day.food)
          .scaled(factor),
      supplements: days
          .fold(const Micronutrients(), (total, day) => total + day.supplements)
          .scaled(factor),
      coverage: coverage,
    );
  }

  /// Today's entries with a value for [nutrient], largest amount first.
  List<MicroContributor> contributors(
    Micronutrient nutrient, {
    required Iterable<FoodEntry> foodEntries,
    Iterable<SupplementEntry> supplementEntries = const [],
  }) => [
    for (final entry in foodEntries)
      if (intake(foodEntries: [entry]).food[nutrient] case final amount?)
        (name: entry.name, amount: amount, isSupplement: false),
    for (final entry in supplementEntries)
      if (entry.micros[nutrient] case final amount?)
        (name: entry.supplement.name, amount: amount, isSupplement: true),
  ]..sort((a, b) => b.amount.compareTo(a.amount));

  List<_Portion> _portions(FoodEntry entry) => switch (entry) {
    IngredientEntry(:final ingredient, :final grams) => [
      (
        ingredient: ingredient,
        amountGrams: grams.toDouble(),
        coverageGrams: grams.toDouble(),
      ),
    ],
    RecipeEntry(:final recipe, :final grams)
        when recipe.weightGrams > 0 && recipe.ingredientsWeightGrams > 0 =>
      [
        for (final item in recipe.ingredients)
          (
            ingredient: item.ingredient,
            amountGrams: item.grams * grams / recipe.weightGrams,
            coverageGrams: item.grams * grams / recipe.ingredientsWeightGrams,
          ),
      ],
    RecipeEntry() => const [],
  };
}

typedef MicroContributor = ({String name, double amount, bool isSupplement});

typedef _Portion = ({
  Ingredient ingredient,
  double amountGrams,
  double coverageGrams,
});
