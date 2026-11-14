import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/microcal/domain/services/micro_intake_calculator.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
import 'package:macro_cal_public/features/today/domain/entities/supplement_entry.dart';

void main() {
  const calculator = MicroIntakeCalculator();

  const oats = Ingredient(
    id: 1,
    name: 'Oats',
    per100g: Nutrients(
      kcal: 380,
      micros: Micronutrients(
        amounts: {Micronutrient.iron: 4, Micronutrient.magnesium: 140},
      ),
    ),
  );
  const milk = Ingredient(
    id: 2,
    name: 'Milk',
    per100g: Nutrients(
      kcal: 46,
      micros: Micronutrients(amounts: {Micronutrient.calcium: 120}),
    ),
  );
  const honey = Ingredient(id: 3, name: 'Honey', per100g: Nutrients(kcal: 300));

  test('sums food amounts and the share of grams that has each value', () {
    final intake = calculator.intake(
      foodEntries: const [
        IngredientEntry(ingredient: oats, grams: 50),
        IngredientEntry(ingredient: milk, grams: 200),
        IngredientEntry(ingredient: honey, grams: 50),
      ],
    );

    expect(intake.food[Micronutrient.iron], 2);
    expect(intake.food[Micronutrient.calcium], 240);
    expect(intake.food[Micronutrient.zinc], isNull);
    expect(intake.coverageOf(Micronutrient.iron), closeTo(50 / 300, 1e-9));
    expect(intake.coverageOf(Micronutrient.calcium), closeTo(200 / 300, 1e-9));
    expect(intake.coverageOf(Micronutrient.zinc), 0);
  });

  test('expands a recipe into its ingredients by the finished weight', () {
    const porridge = Recipe(
      id: 1,
      name: 'Porridge',
      ingredients: [
        RecipeIngredient(ingredient: oats, grams: 100),
        RecipeIngredient(ingredient: honey, grams: 100),
      ],
      finalWeightGrams: 400,
    );

    final intake = calculator.intake(
      foodEntries: const [RecipeEntry(recipe: porridge, grams: 200)],
    );

    expect(intake.food[Micronutrient.iron], 2);
    expect(intake.food[Micronutrient.magnesium], 70);
    expect(intake.coverageOf(Micronutrient.iron), 0.5);
  });

  test('keeps supplements apart from food', () {
    const vitaminD = Supplement(
      id: 1,
      name: 'Vitamin D',
      unit: SupplementUnit.drop,
      microsPerUnit: Micronutrients(amounts: {Micronutrient.vitaminD: 5}),
    );

    final intake = calculator.intake(
      foodEntries: const [IngredientEntry(ingredient: milk, grams: 100)],
      supplementEntries: const [
        SupplementEntry(supplement: vitaminD, units: 2),
      ],
    );

    expect(intake.supplements[Micronutrient.vitaminD], 10);
    expect(intake.food[Micronutrient.vitaminD], isNull);
    expect(intake.total(Micronutrient.vitaminD), 10);
    expect(intake.total(Micronutrient.calcium), 120);
    expect(intake.total(Micronutrient.iron), isNull);
  });

  test('nothing eaten gives an empty intake', () {
    expect(calculator.intake(foodEntries: const []), const MicroIntake());
  });

  test('an empty recipe adds nothing', () {
    final intake = calculator.intake(
      foodEntries: const [
        RecipeEntry(recipe: Recipe(id: 1, name: 'Empty'), grams: 100),
      ],
    );

    expect(intake, const MicroIntake());
  });
}
