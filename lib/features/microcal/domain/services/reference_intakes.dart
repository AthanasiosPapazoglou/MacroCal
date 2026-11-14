import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/reference_intake.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';

/// Adult reference intakes: EFSA targets and upper levels, NASEM upper levels
/// where EFSA set none, EU label NRVs while sex or age is unknown.
class ReferenceIntakes {
  const new();

  static const int minimumAge = 18;
  static const double kcalPerMegajoule = 239.006;

  /// Null under [minimumAge]. [energyKcal] scales thiamin and niacin, which
  /// EFSA sets per MJ.
  Map<Micronutrient, ReferenceIntake>? forPerson({
    required double energyKcal,
    Sex? sex,
    int? age,
  }) {
    if (age != null && age < minimumAge) return null;
    return {
      for (final nutrient in Micronutrient.values)
        nutrient: sex == null || age == null
            ? ReferenceIntake(
                target: _euNrv(nutrient),
                source: .euNrv,
                upperLimit: _upperLimit(nutrient, age: age),
              )
            : _efsa(
                nutrient,
                male: sex == .male,
                age: age,
                megajoules: energyKcal / kcalPerMegajoule,
              ),
    };
  }

  ReferenceIntake _efsa(
    Micronutrient nutrient, {
    required bool male,
    required int age,
    required double megajoules,
  }) {
    final (target, isAdequateIntake) = switch (nutrient) {
      .vitaminA => (male ? 750.0 : 650.0, false),
      .vitaminD => (15.0, true),
      .vitaminE => (male ? 13.0 : 11.0, true),
      .vitaminK => (70.0, true),
      .vitaminC => (male ? 110.0 : 95.0, false),
      .thiamin => (0.1 * megajoules, false),
      .riboflavin => (1.6, false),
      .niacin => (1.6 * megajoules, false),
      .vitaminB6 => (male ? 1.7 : 1.6, false),
      .folate => (330.0, false),
      .vitaminB12 => (4.0, true),
      .calcium => (age < 25 ? 1000.0 : 950.0, false),
      .phosphorus => (550.0, true),
      .magnesium => (male ? 350.0 : 300.0, true),
      .potassium => (3500.0, true),
      .iron => (male || age >= 51 ? 11.0 : 16.0, false),
      .zinc => (male ? 11.7 : 9.3, false),
      .copper => (male ? 1.6 : 1.3, true),
      .manganese => (3.0, true),
      .selenium => (70.0, true),
      .iodine => (150.0, true),
    };
    return ReferenceIntake(
      target: target,
      source: .efsa,
      isAdequateIntake: isAdequateIntake,
      upperLimit: _upperLimit(nutrient, age: age),
    );
  }

  double _euNrv(Micronutrient nutrient) => switch (nutrient) {
    .vitaminA => 800,
    .vitaminD => 5,
    .vitaminE => 12,
    .vitaminK => 75,
    .vitaminC => 80,
    .thiamin => 1.1,
    .riboflavin => 1.4,
    .niacin => 16,
    .vitaminB6 => 1.4,
    .folate => 200,
    .vitaminB12 => 2.5,
    .calcium => 800,
    .phosphorus => 700,
    .magnesium => 375,
    .potassium => 2000,
    .iron => 14,
    .zinc => 10,
    .copper => 1,
    .manganese => 2,
    .selenium => 55,
    .iodine => 150,
  };

  UpperLimit? _upperLimit(Micronutrient nutrient, {int? age}) =>
      switch (nutrient) {
        .vitaminA => const UpperLimit(
          amount: 3000,
          source: .efsa,
          scope: .supplementsOnly,
        ),
        .vitaminD => const UpperLimit(amount: 100, source: .efsa),
        .vitaminE => const UpperLimit(amount: 300, source: .efsa),
        .vitaminC => const UpperLimit(amount: 2000, source: .nasem),
        .vitaminB6 => const UpperLimit(amount: 12, source: .efsa),
        .folate => const UpperLimit(
          amount: 1000,
          source: .efsa,
          scope: .supplementsOnly,
        ),
        .calcium => const UpperLimit(amount: 2500, source: .efsa),
        .phosphorus => UpperLimit(
          amount: age != null && age > 70 ? 3000 : 4000,
          source: .nasem,
        ),
        .magnesium => const UpperLimit(
          amount: 250,
          source: .efsa,
          scope: .supplementsOnly,
        ),
        .iron => const UpperLimit(amount: 45, source: .nasem),
        .zinc => const UpperLimit(amount: 25, source: .efsa),
        .copper => const UpperLimit(amount: 5, source: .efsa),
        .manganese => const UpperLimit(amount: 11, source: .nasem),
        .selenium => const UpperLimit(amount: 255, source: .efsa),
        .iodine => const UpperLimit(amount: 600, source: .efsa),
        .vitaminK ||
        .thiamin ||
        .riboflavin ||
        .niacin ||
        .vitaminB12 ||
        .potassium => null,
      };
}
