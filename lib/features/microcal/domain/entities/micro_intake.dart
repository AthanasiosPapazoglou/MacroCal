import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';

part 'micro_intake.freezed.dart';

/// Micronutrients taken in from food and from supplements, with the share of
/// eaten grams whose food has a value for each nutrient.
@freezed
abstract class MicroIntake with _$MicroIntake {
  const factory({
    @Default(Micronutrients()) Micronutrients food,
    @Default(Micronutrients()) Micronutrients supplements,
    @Default(<Micronutrient, double>{}) Map<Micronutrient, double> coverage,
  }) = _MicroIntake;

  const new _();

  /// Food and supplements together; null when neither has a value.
  double? total(Micronutrient nutrient) {
    final fromFood = food[nutrient];
    final fromSupplements = supplements[nutrient];
    if (fromFood == null && fromSupplements == null) return null;
    return (fromFood ?? 0) + (fromSupplements ?? 0);
  }

  double coverageOf(Micronutrient nutrient) => coverage[nutrient] ?? 0;
}
