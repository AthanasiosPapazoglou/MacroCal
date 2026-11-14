import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/reference_food.dart';

const referenceApple = ReferenceFood(
  code: 13039,
  nameEn: 'Apple, flesh and skin, raw',
  nameEl: 'Μήλο, με φλούδα, ωμό',
  per100g: Nutrients(
    kcal: 53,
    carbsG: 11.6,
    sugarsG: 9.4,
    fiberG: 1.9,
    micros: Micronutrients(
      amounts: {Micronutrient.vitaminC: 4.6, Micronutrient.potassium: 107},
    ),
  ),
);

const referenceFeta = ReferenceFood(
  code: 12061,
  nameEn: "Feta or Feta-type cheese, 100% from ewe's milk",
  nameEl: 'Φέτα, πρόβεια',
  per100g: Nutrients(
    kcal: 264.7,
    proteinG: 16.3,
    fatG: 21.8,
    saltMg: 2700,
    micros: Micronutrients(amounts: {Micronutrient.calcium: 276}),
  ),
);

const referencePineapple = ReferenceFood(
  code: 1,
  nameEn: 'Pineapple, flesh without skin, raw',
  nameEl: 'Ανανάς, ωμός',
  per100g: Nutrients(kcal: 52),
);
