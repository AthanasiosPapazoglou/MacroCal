import 'package:macro_cal_public/core/database/seed/ingredient_seed.dart';

const milkSeed = IngredientSeed(
  name: 'Milk 1.5%',
  category: 'Dairy',
  referenceG: 100,
  kcal: 45,
  proteinG: 3.2,
  carbsG: 4.5,
  sugarsG: 4.5,
  fatG: 1.5,
  saturatedG: 1,
  fiberG: 0,
  saltMg: 50,
);

const breadSeed = IngredientSeed(
  name: 'Bread',
  category: 'Uncategorised',
  referenceG: 100,
  kcal: 250,
  proteinG: 9,
  carbsG: 48,
  sugarsG: 5,
  fatG: 3,
  saturatedG: 0.6,
  fiberG: 6,
  saltMg: 1100,
);

Future<List<IngredientSeed>> testIngredientSeeds() async => [
  milkSeed,
  breadSeed,
];
