import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';

import 'sample_ingredients.dart';

const sampleMilkToast = Recipe(
  id: 1,
  name: 'Milk Toast',
  ingredients: [
    RecipeIngredient(ingredient: sampleMilk, grams: 200),
    RecipeIngredient(ingredient: sampleBread, grams: 100),
  ],
);

const sampleWarmMilk = Recipe(
  id: 2,
  name: 'Warm Milk',
  finalWeightGrams: 240,
  ingredients: [RecipeIngredient(ingredient: sampleMilk, grams: 250)],
);
