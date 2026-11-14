import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/reference_food.dart';

final Map<String, Micronutrient> _micronutrients = Micronutrient.values
    .asNameMap();

/// Reads one entry of `reference_foods.json`; unknown nutrients are skipped.
ReferenceFood referenceFoodFromJson(Map<String, dynamic> json) {
  double number(String key) => (json[key] as num?)?.toDouble() ?? 0;
  final micros = json['micros'] as Map<String, dynamic>? ?? const {};
  return ReferenceFood(
    code: json['code'] as int,
    nameEn: json['en'] as String,
    nameEl: json['el'] as String,
    per100g: Nutrients(
      kcal: number('kcal'),
      proteinG: number('proteinG'),
      carbsG: number('carbsG'),
      sugarsG: number('sugarsG'),
      fatG: number('fatG'),
      saturatedG: number('saturatedG'),
      fiberG: number('fiberG'),
      saltMg: number('saltMg'),
      micros: Micronutrients(
        amounts: {
          for (final MapEntry(:key, :value) in micros.entries)
            ?_micronutrients[key]: (value as num).toDouble(),
        },
      ),
    ),
  );
}
