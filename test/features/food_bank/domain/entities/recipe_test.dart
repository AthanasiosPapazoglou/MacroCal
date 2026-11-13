import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';

void main() {
  const flour = Ingredient(
    id: 1,
    name: 'Flour',
    per100g: Nutrients(
      kcal: 360,
      proteinG: 10,
      carbsG: 76,
      sugarsG: 1,
      fatG: 1,
      saturatedG: 0.25,
      fiberG: 3,
    ),
  );
  const milk = Ingredient(
    id: 2,
    name: 'Milk',
    per100g: Nutrients(
      kcal: 50,
      proteinG: 3.5,
      carbsG: 5,
      sugarsG: 5,
      fatG: 1.5,
      saturatedG: 1,
      saltMg: 100,
    ),
  );
  const batter = Recipe(
    id: 1,
    name: 'Batter',
    ingredients: [
      RecipeIngredient(ingredient: flour, grams: 100),
      RecipeIngredient(ingredient: milk, grams: 300),
    ],
  );

  test('weighs the sum of its ingredients without a final weight', () {
    expect(batter.ingredientsWeightGrams, 400);
    expect(batter.weightGrams, 400);
  });

  test('weighs its final weight when set', () {
    final pancakes = batter.copyWith(finalWeightGrams: 200);

    expect(pancakes.ingredientsWeightGrams, 400);
    expect(pancakes.weightGrams, 200);
  });

  test('adds up every ingredient by its grams', () {
    expect(
      batter.totalNutrients,
      const Nutrients(
        kcal: 510,
        proteinG: 20.5,
        carbsG: 91,
        sugarsG: 16,
        fatG: 5.5,
        saturatedG: 3.25,
        fiberG: 3,
        saltMg: 300,
      ),
    );
  });

  test('spreads the nutrients over its weight per 100 g', () {
    expect(
      batter.per100g,
      const Nutrients(
        kcal: 127.5,
        proteinG: 5.125,
        carbsG: 22.75,
        sugarsG: 4,
        fatG: 1.375,
        saturatedG: 0.8125,
        fiberG: 0.75,
        saltMg: 75,
      ),
    );
    expect(batter.copyWith(finalWeightGrams: 200).per100g.kcal, 255);
  });

  test('has no weight or nutrients without ingredients', () {
    const empty = Recipe(id: 2, name: 'Empty');

    expect(empty.weightGrams, 0);
    expect(empty.totalNutrients, const Nutrients());
    expect(empty.per100g, const Nutrients());
  });
}
