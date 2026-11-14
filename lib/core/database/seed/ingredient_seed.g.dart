// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_seed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IngredientSeed _$IngredientSeedFromJson(Map<String, dynamic> json) =>
    IngredientSeed(
      name: json['ingridientName'] as String,
      category: json['category'] as String?,
      referenceG: (json['referenceQuantity'] as num).toDouble(),
      kcal: (json['calories'] as num).toDouble(),
      proteinG: (json['proteins'] as num).toDouble(),
      carbsG: (json['carbohydrates'] as num).toDouble(),
      sugarsG: (json['sugars'] as num).toDouble(),
      fatG: (json['fats'] as num).toDouble(),
      saturatedG: (json['saturated'] as num).toDouble(),
      fiberG: (json['fiber'] as num).toDouble(),
      saltMg: (json['salt'] as num).toDouble(),
      micros:
          (json['micros'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, (e as num).toDouble()),
          ) ??
          const {},
    );
