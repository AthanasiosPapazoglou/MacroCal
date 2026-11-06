import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';

const sampleMilk = Ingredient(
  id: 1,
  name: 'Milk 1.5%',
  category: 'Dairy',
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

const sampleBread = Ingredient(
  id: 2,
  name: 'Whole Bread',
  per100g: Nutrients(
    kcal: 250,
    proteinG: 9,
    carbsG: 48,
    sugarsG: 5,
    fatG: 3,
    saturatedG: 0.6,
    fiberG: 6,
    saltMg: 1100,
  ),
);
