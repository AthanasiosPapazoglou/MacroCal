import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/reference_intake.dart';
import 'package:macro_cal_public/features/microcal/domain/services/reference_intakes.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';

void main() {
  const references = ReferenceIntakes();
  const energyKcal = 2390.06;

  Map<Micronutrient, ReferenceIntake> adult(Sex sex, int age) =>
      references.forPerson(energyKcal: energyKcal, sex: sex, age: age)!;

  test('has no values under 18', () {
    expect(
      references.forPerson(energyKcal: energyKcal, sex: Sex.female, age: 17),
      isNull,
    );
  });

  test('covers every nutrient with an EFSA target for adults', () {
    final values = adult(Sex.male, 30);

    expect(values.keys, unorderedEquals(Micronutrient.values));
    expect(values.values.map((value) => value.source).toSet(), {
      ReferenceSource.efsa,
    });
    expect(values.values.every((value) => value.target > 0), isTrue);
  });

  test('uses EU label values while sex or age is missing', () {
    final withoutSex = references.forPerson(energyKcal: energyKcal, age: 30)!;
    final withoutAge = references.forPerson(
      energyKcal: energyKcal,
      sex: Sex.male,
    )!;

    expect(withoutSex[Micronutrient.iron]!.target, 14);
    expect(withoutSex[Micronutrient.iron]!.source, ReferenceSource.euNrv);
    expect(withoutAge[Micronutrient.vitaminD]!.target, 5);
    expect(withoutAge[Micronutrient.selenium]!.upperLimit!.amount, 255);
  });

  test('targets follow sex and age', () {
    expect(adult(Sex.male, 30)[Micronutrient.iron]!.target, 11);
    expect(adult(Sex.female, 30)[Micronutrient.iron]!.target, 16);
    expect(adult(Sex.female, 55)[Micronutrient.iron]!.target, 11);
    expect(adult(Sex.female, 20)[Micronutrient.calcium]!.target, 1000);
    expect(adult(Sex.female, 25)[Micronutrient.calcium]!.target, 950);
    expect(adult(Sex.male, 30)[Micronutrient.zinc]!.target, 11.7);
  });

  test('thiamin and niacin scale with energy', () {
    final values = adult(Sex.female, 40);

    expect(values[Micronutrient.thiamin]!.target, closeTo(1, 1e-9));
    expect(values[Micronutrient.niacin]!.target, closeTo(16, 1e-9));
  });

  test('marks adequate intakes', () {
    final values = adult(Sex.male, 30);

    expect(values[Micronutrient.vitaminD]!.isAdequateIntake, isTrue);
    expect(values[Micronutrient.vitaminC]!.isAdequateIntake, isFalse);
  });

  test('upper levels name their source and scope', () {
    final values = adult(Sex.male, 30);

    expect(
      values[Micronutrient.magnesium]!.upperLimit,
      const UpperLimit(
        amount: 250,
        source: ReferenceSource.efsa,
        scope: UpperLimitScope.supplementsOnly,
      ),
    );
    expect(
      values[Micronutrient.iron]!.upperLimit,
      const UpperLimit(amount: 45, source: ReferenceSource.nasem),
    );
    expect(values[Micronutrient.niacin]!.upperLimit, isNull);
    expect(values[Micronutrient.phosphorus]!.upperLimit!.amount, 4000);
    expect(
      adult(Sex.male, 71)[Micronutrient.phosphorus]!.upperLimit!.amount,
      3000,
    );
  });
}
