import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/data/mappers/open_food_facts_micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';

void main() {
  test('every micronutrient has an Open Food Facts name', () {
    final micros = micronutrientsFromOpenFoodFacts({
      for (final name in [
        'vitamin-a',
        'vitamin-d',
        'vitamin-e',
        'vitamin-k',
        'vitamin-c',
        'vitamin-b1',
        'vitamin-b2',
        'vitamin-pp',
        'vitamin-b6',
        'vitamin-b9',
        'vitamin-b12',
        'calcium',
        'phosphorus',
        'magnesium',
        'potassium',
        'iron',
        'zinc',
        'copper',
        'manganese',
        'selenium',
        'iodine',
      ])
        name: 0.001,
    });

    expect(micros.amounts.keys, unorderedEquals(Micronutrient.values));
  });

  test('converts grams to mg or µg by unit', () {
    final micros = micronutrientsFromOpenFoodFacts({
      'vitamin-c': 0.006,
      'folate': 0.0001,
      'vitamin-b9': 0.00008,
      'selenium': 0.0000101,
    });

    expect(micros[Micronutrient.vitaminC], 6);
    expect(micros[Micronutrient.folate], 80);
    expect(micros[Micronutrient.selenium], 10.1);
  });

  test('keeps a zero and leaves missing or negative amounts unknown', () {
    final micros = micronutrientsFromOpenFoodFacts({
      'iron': 0,
      'zinc': -0.002,
      'energy-kcal': 72,
    });

    expect(micros.amounts, {Micronutrient.iron: 0.0});
  });
}
