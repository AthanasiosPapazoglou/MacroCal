import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';

const Map<Micronutrient, String> _offNames = {
  Micronutrient.vitaminA: 'vitamin-a',
  Micronutrient.vitaminD: 'vitamin-d',
  Micronutrient.vitaminE: 'vitamin-e',
  Micronutrient.vitaminK: 'vitamin-k',
  Micronutrient.vitaminC: 'vitamin-c',
  Micronutrient.thiamin: 'vitamin-b1',
  Micronutrient.riboflavin: 'vitamin-b2',
  Micronutrient.niacin: 'vitamin-pp',
  Micronutrient.vitaminB6: 'vitamin-b6',
  Micronutrient.folate: 'vitamin-b9',
  Micronutrient.vitaminB12: 'vitamin-b12',
  Micronutrient.calcium: 'calcium',
  Micronutrient.phosphorus: 'phosphorus',
  Micronutrient.magnesium: 'magnesium',
  Micronutrient.potassium: 'potassium',
  Micronutrient.iron: 'iron',
  Micronutrient.zinc: 'zinc',
  Micronutrient.copper: 'copper',
  Micronutrient.manganese: 'manganese',
  Micronutrient.selenium: 'selenium',
  Micronutrient.iodine: 'iodine',
};

/// Converts Open Food Facts amounts, in grams per 100 g, to each unit.
Micronutrients micronutrientsFromOpenFoodFacts(
  Map<String, double> gramsPer100g,
) => Micronutrients(
  amounts: {
    for (final nutrient in Micronutrient.values)
      if (gramsPer100g[_offNames[nutrient]] case final grams? when grams >= 0)
        nutrient: double.parse(
          (grams * _perGram(nutrient.unit)).toStringAsFixed(6),
        ),
  },
);

double _perGram(MicronutrientUnit unit) => switch (unit) {
  MicronutrientUnit.mg => 1e3,
  MicronutrientUnit.ug => 1e6,
};
