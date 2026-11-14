import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity_entry.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
import 'package:macro_cal_public/features/today/domain/entities/goal_kind.dart';
import 'package:macro_cal_public/features/today/domain/entities/intake_status.dart';
import 'package:macro_cal_public/features/today/domain/services/nutrition_calculator.dart';

void main() {
  const calculator = NutritionCalculator();

  const milk = Ingredient(
    id: 1,
    name: 'Milk',
    per100g: Nutrients(
      kcal: 45,
      proteinG: 3.2,
      carbsG: 4.5,
      sugarsG: 4.5,
      fatG: 1.5,
      saturatedG: 1,
      saltMg: 50,
    ),
  );
  const chicken = Ingredient(
    id: 2,
    name: 'Chicken',
    per100g: Nutrients(
      kcal: 100,
      proteinG: 15,
      carbsG: 5.4,
      sugarsG: 1.2,
      fatG: 1,
      saturatedG: 0.4,
      saltMg: 2400,
    ),
  );
  const walking = Activity(
    id: 1,
    name: 'Walking',
    kcalPerUnit: 50,
    unitLabel: 'Kilometers',
  );

  group('consumed', () {
    test('sums nutrients by grams eaten', () {
      final total = calculator.consumed(const [
        IngredientEntry(ingredient: milk, grams: 200),
        IngredientEntry(ingredient: chicken, grams: 50),
      ]);

      expect(total.kcal, closeTo(140, 1e-9));
      expect(total.proteinG, closeTo(13.9, 1e-9));
      expect(total.saltMg, closeTo(1300, 1e-9));
    });

    test('counts a recipe by its nutrients per 100 g', () {
      const toast = Recipe(
        id: 1,
        name: 'Toast',
        finalWeightGrams: 100,
        ingredients: [RecipeIngredient(ingredient: milk, grams: 200)],
      );

      final total = calculator.consumed(const [
        RecipeEntry(recipe: toast, grams: 50),
        IngredientEntry(ingredient: milk, grams: 100),
      ]);

      expect(total.kcal, closeTo(90, 1e-9));
      expect(total.proteinG, closeTo(6.4, 1e-9));
    });

    test('is zero without entries', () {
      expect(calculator.consumed(const []), const Nutrients());
    });
  });

  group('summarize', () {
    test('adds calories burned by exercise to the daily goal', () {
      final summary = calculator.summarize(
        goals: const NutritionGoals(dailyKcal: 2000),
        foodEntries: const [],
        activityEntries: const [ActivityEntry(activity: walking, amount: 3)],
      );

      expect(summary.burnedKcal, 150);
      expect(summary.adjustedKcal, 2150);
    });

    test('turns sugar and saturated fat limits into whole grams', () {
      final summary = calculator.summarize(
        goals: const NutritionGoals(dailyKcal: 2000),
        foodEntries: const [IngredientEntry(ingredient: milk, grams: 100)],
        activityEntries: const [ActivityEntry(activity: walking, amount: 3)],
      );

      expect(summary.sugarLimitG, 53);
      expect(summary.saturatedLimitG, 19);
      expect(summary.consumed.kcal, closeTo(45, 1e-9));
    });
  });

  test('progress stays between 0 and 1 for any goal', () {
    expect(calculator.progress(goal: 100, consumed: 50), 0.5);
    expect(calculator.progress(goal: 100, consumed: 150), 1.0);
    expect(calculator.progress(goal: 100, consumed: -20), 0.0);
    expect(calculator.progress(goal: 0, consumed: 0), 0.0);
    expect(calculator.progress(goal: 0, consumed: 50), 1.0);
  });

  test('surpassedPercent is the whole percentage over the goal', () {
    expect(calculator.surpassedPercent(goal: 100, consumed: 150), 50);
    expect(calculator.surpassedPercent(goal: 100, consumed: 133.9), 33);
    expect(calculator.surpassedPercent(goal: 100, consumed: 100), isNull);
    expect(calculator.surpassedPercent(goal: 0, consumed: 10), isNull);
  });

  group('status', () {
    const c = IntakeStatus.critical;
    const w = IntakeStatus.warning;
    const y = IntakeStatus.caution;
    const g = IntakeStatus.good;
    const consumedValues = [
      29,
      30,
      59,
      60,
      84,
      85,
      100,
      110,
      111,
      120,
      121,
      130,
      131,
    ];
    const expected = {
      GoalKind.energy: [c, w, w, y, y, g, g, g, y, y, w, w, c],
      GoalKind.minimum: [c, w, w, y, y, g, g, g, g, g, g, g, g],
      GoalKind.limit: [g, g, g, y, y, w, w, w, c, c, c, c, c],
    };

    for (final MapEntry(key: kind, value: statuses) in expected.entries) {
      test('follows the thresholds for ${kind.name} goals', () {
        final actual = [
          for (final consumed in consumedValues)
            calculator.status(
              goal: 100,
              consumed: consumed.toDouble(),
              kind: kind,
            ),
        ];
        expect(actual, statuses);
      });
    }

    test('treats a zero goal as met or exceeded instead of dividing by it', () {
      expect(calculator.status(goal: 0, consumed: 0, kind: GoalKind.energy), c);
      expect(calculator.status(goal: 0, consumed: 5, kind: GoalKind.energy), c);
      expect(
        calculator.status(goal: 0, consumed: 5, kind: GoalKind.minimum),
        g,
      );
      expect(calculator.status(goal: 0, consumed: 0, kind: GoalKind.limit), g);
      expect(calculator.status(goal: 0, consumed: 5, kind: GoalKind.limit), c);
    });
  });
}
