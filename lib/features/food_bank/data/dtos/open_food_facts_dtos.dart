import 'package:json_annotation/json_annotation.dart';

part 'open_food_facts_dtos.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class OpenFoodFactsResponseDto {
  const new({required this.status, this.product});

  factory fromJson(Map<String, dynamic> json) =>
      _$OpenFoodFactsResponseDtoFromJson(json);

  final int status;
  final OpenFoodFactsProductDto? product;
}

@JsonSerializable(createToJson: false, checked: true)
class OpenFoodFactsProductDto {
  const new({this.productName, this.nutriments});

  factory fromJson(Map<String, dynamic> json) =>
      _$OpenFoodFactsProductDtoFromJson(json);

  @JsonKey(name: 'product_name')
  final String? productName;
  final OpenFoodFactsNutrimentsDto? nutriments;
}

@JsonSerializable(createToJson: false, checked: true)
class OpenFoodFactsNutrimentsDto {
  const new({
    this.energyKcal,
    this.fat,
    this.saturatedFat,
    this.carbohydrates,
    this.sugars,
    this.fiber,
    this.proteins,
    this.salt,
    this.amountsPer100g = const {},
  });

  factory fromJson(Map<String, dynamic> json) =>
      _$OpenFoodFactsNutrimentsDtoFromJson(json);

  @JsonKey(name: 'energy-kcal_100g', fromJson: _number)
  final double? energyKcal;
  @JsonKey(name: 'fat_100g', fromJson: _number)
  final double? fat;
  @JsonKey(name: 'saturated-fat_100g', fromJson: _number)
  final double? saturatedFat;
  @JsonKey(name: 'carbohydrates_100g', fromJson: _number)
  final double? carbohydrates;
  @JsonKey(name: 'sugars_100g', fromJson: _number)
  final double? sugars;
  @JsonKey(name: 'fiber_100g', fromJson: _number)
  final double? fiber;
  @JsonKey(name: 'proteins_100g', fromJson: _number)
  final double? proteins;
  @JsonKey(name: 'salt_100g', fromJson: _number)
  final double? salt;

  /// Every numeric `*_100g` value keyed by its name without the suffix.
  @JsonKey(readValue: _amountsPer100g)
  final Map<String, double> amountsPer100g;
}

const _per100gSuffix = '_100g';

Map<String, double> _amountsPer100g(Map<dynamic, dynamic> json, String _) => {
  for (final MapEntry(:key, :value) in json.entries)
    if (key case final String name when name.endsWith(_per100gSuffix))
      name.substring(0, name.length - _per100gSuffix.length): ?_number(value),
};

double? _number(Object? value) => switch (value) {
  final num number => number.toDouble(),
  final String text => double.tryParse(text),
  _ => null,
};
