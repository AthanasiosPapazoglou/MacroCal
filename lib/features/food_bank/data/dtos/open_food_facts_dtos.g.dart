// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_food_facts_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenFoodFactsResponseDto _$OpenFoodFactsResponseDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('OpenFoodFactsResponseDto', json, ($checkedConvert) {
  final val = OpenFoodFactsResponseDto(
    status: $checkedConvert('status', (v) => (v as num).toInt()),
    product: $checkedConvert(
      'product',
      (v) => v == null
          ? null
          : OpenFoodFactsProductDto.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

OpenFoodFactsProductDto _$OpenFoodFactsProductDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('OpenFoodFactsProductDto', json, ($checkedConvert) {
  final val = OpenFoodFactsProductDto(
    productName: $checkedConvert('product_name', (v) => v as String?),
    nutriments: $checkedConvert(
      'nutriments',
      (v) => v == null
          ? null
          : OpenFoodFactsNutrimentsDto.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
}, fieldKeyMap: const {'productName': 'product_name'});

OpenFoodFactsNutrimentsDto _$OpenFoodFactsNutrimentsDtoFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'OpenFoodFactsNutrimentsDto',
  json,
  ($checkedConvert) {
    final val = OpenFoodFactsNutrimentsDto(
      energyKcal: $checkedConvert('energy-kcal_100g', (v) => _number(v)),
      fat: $checkedConvert('fat_100g', (v) => _number(v)),
      saturatedFat: $checkedConvert('saturated-fat_100g', (v) => _number(v)),
      carbohydrates: $checkedConvert('carbohydrates_100g', (v) => _number(v)),
      sugars: $checkedConvert('sugars_100g', (v) => _number(v)),
      fiber: $checkedConvert('fiber_100g', (v) => _number(v)),
      proteins: $checkedConvert('proteins_100g', (v) => _number(v)),
      salt: $checkedConvert('salt_100g', (v) => _number(v)),
      amountsPer100g: $checkedConvert(
        'amountsPer100g',
        (v) =>
            (v as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(k, (e as num).toDouble()),
            ) ??
            const {},
        readValue: _amountsPer100g,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'energyKcal': 'energy-kcal_100g',
    'fat': 'fat_100g',
    'saturatedFat': 'saturated-fat_100g',
    'carbohydrates': 'carbohydrates_100g',
    'sugars': 'sugars_100g',
    'fiber': 'fiber_100g',
    'proteins': 'proteins_100g',
    'salt': 'salt_100g',
  },
);
