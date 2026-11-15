import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/reference_intake.dart';

void main() {
  const intake = MicroIntake(
    food: Micronutrients(
      amounts: {Micronutrient.magnesium: 300, Micronutrient.zinc: 20},
    ),
    supplements: Micronutrients(
      amounts: {Micronutrient.magnesium: 200, Micronutrient.zinc: 10},
    ),
  );

  test('has data when food or supplements have a value', () {
    expect(intake.hasData, isTrue);
    expect(const MicroIntake().hasData, isFalse);
  });

  group('isAboveUpperLimit', () {
    test('compares all intake when the limit applies to all intake', () {
      const reference = ReferenceIntake(
        target: 9.4,
        source: ReferenceSource.efsa,
        upperLimit: UpperLimit(amount: 25, source: ReferenceSource.efsa),
      );

      expect(intake.isAboveUpperLimit(Micronutrient.zinc, reference), isTrue);
    });

    test('compares supplements only when the limit says so', () {
      ReferenceIntake reference(double limit) => ReferenceIntake(
        target: 350,
        source: ReferenceSource.efsa,
        upperLimit: UpperLimit(
          amount: limit,
          source: ReferenceSource.efsa,
          scope: UpperLimitScope.supplementsOnly,
        ),
      );

      expect(
        intake.isAboveUpperLimit(Micronutrient.magnesium, reference(250)),
        isFalse,
      );
      expect(
        intake.isAboveUpperLimit(Micronutrient.magnesium, reference(150)),
        isTrue,
      );
    });

    test('is false without a limit or a value', () {
      const reference = ReferenceIntake(
        target: 95,
        source: ReferenceSource.efsa,
      );

      expect(
        intake.isAboveUpperLimit(Micronutrient.magnesium, reference),
        isFalse,
      );
      expect(
        intake.isAboveUpperLimit(
          Micronutrient.iron,
          reference.copyWith(
            upperLimit: const UpperLimit(
              amount: 1,
              source: ReferenceSource.nasem,
            ),
          ),
        ),
        isFalse,
      );
    });
  });

  test('counts the nutrients at or above their reference', () {
    expect(
      intake.countAtReference(const {
        Micronutrient.magnesium: ReferenceIntake(
          target: 500,
          source: ReferenceSource.efsa,
        ),
        Micronutrient.zinc: ReferenceIntake(
          target: 31,
          source: ReferenceSource.efsa,
        ),
        Micronutrient.iron: ReferenceIntake(
          target: 11,
          source: ReferenceSource.efsa,
        ),
      }),
      1,
    );
  });

  test('coverage below half of the nutrients on average is low', () {
    final full = MicroIntake(
      coverage: {for (final nutrient in Micronutrient.values) nutrient: 1},
    );
    final half = MicroIntake(
      coverage: {
        for (final nutrient in Micronutrient.values.take(10)) nutrient: 1,
      },
    );

    expect(full.averageCoverage, 1);
    expect(full.isLowCoverage, isFalse);
    expect(half.isLowCoverage, isTrue);
  });
}
