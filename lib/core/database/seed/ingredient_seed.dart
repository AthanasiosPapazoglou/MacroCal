import 'dart:convert';

import 'package:drift/drift.dart' hide JsonKey;
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient_seed.g.dart';

typedef IngredientSeedLoader = Future<List<IngredientSeed>> Function();

@JsonSerializable(createToJson: false)
class IngredientSeed {
  const new({
    required this.name,
    required this.category,
    required this.referenceG,
    required this.kcal,
    required this.proteinG,
    required this.carbsG,
    required this.sugarsG,
    required this.fatG,
    required this.saturatedG,
    required this.fiberG,
    required this.saltMg,
  });

  factory fromJson(Map<String, dynamic> json) => _$IngredientSeedFromJson(json);

  @JsonKey(name: 'ingridientName')
  final String name;
  final String? category;
  @JsonKey(name: 'referenceQuantity')
  final double referenceG;
  @JsonKey(name: 'calories')
  final double kcal;
  @JsonKey(name: 'proteins')
  final double proteinG;
  @JsonKey(name: 'carbohydrates')
  final double carbsG;
  @JsonKey(name: 'sugars')
  final double sugarsG;
  @JsonKey(name: 'fats')
  final double fatG;
  @JsonKey(name: 'saturated')
  final double saturatedG;
  @JsonKey(name: 'fiber')
  final double fiberG;
  @JsonKey(name: 'salt')
  final double saltMg;

  Map<String, Expression<Object>> toColumns() => {
    'name': Variable(name),
    'category': Variable(category == 'Uncategorised' ? null : category),
    'reference_g': Variable(referenceG),
    'kcal': Variable(kcal),
    'protein_g': Variable(proteinG),
    'carbs_g': Variable(carbsG),
    'sugars_g': Variable(sugarsG),
    'fat_g': Variable(fatG),
    'saturated_g': Variable(saturatedG),
    'fiber_g': Variable(fiberG),
    'salt_mg': Variable(saltMg),
  };
}

Future<List<IngredientSeed>> loadDefaultIngredientSeeds([
  AssetBundle? bundle,
]) async {
  final json = await (bundle ?? rootBundle).loadString(
    'assets/data/default_ingredients.json',
  );
  return [
    for (final item in jsonDecode(json) as List<dynamic>)
      IngredientSeed.fromJson(item as Map<String, dynamic>),
  ];
}

Future<void> seedIngredients<T extends Table, D>(
  GeneratedDatabase database,
  TableInfo<T, D> ingredients,
  List<IngredientSeed> seeds,
) => database.batch(
  (batch) => batch.insertAll(ingredients, [
    for (final seed in seeds) RawValuesInsertable<D>(seed.toColumns()),
  ]),
);
