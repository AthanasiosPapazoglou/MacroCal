import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';

part 'micronutrients.freezed.dart';

/// Micronutrient amounts; a missing key is unknown, 0 is a known zero.
@freezed
abstract class Micronutrients with _$Micronutrients {
  const factory({
    @Default(<Micronutrient, double>{}) Map<Micronutrient, double> amounts,
  }) = _Micronutrients;

  const new _();

  double? operator [](Micronutrient nutrient) => amounts[nutrient];

  bool get isEmpty => amounts.isEmpty;

  Micronutrients operator +(Micronutrients other) => Micronutrients(
    amounts: {
      ...amounts,
      for (final MapEntry(:key, :value) in other.amounts.entries)
        key: (amounts[key] ?? 0) + value,
    },
  );

  Micronutrients scaled(double factor) => Micronutrients(
    amounts: amounts.map((key, value) => MapEntry(key, value * factor)),
  );
}
