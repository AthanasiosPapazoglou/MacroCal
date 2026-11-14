import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';

void main() {
  const vitaminC = Micronutrients(amounts: {Micronutrient.vitaminC: 10});
  const ironAndVitaminC = Micronutrients(
    amounts: {Micronutrient.iron: 2, Micronutrient.vitaminC: 0},
  );

  test('adds known amounts and keeps unknown ones unknown', () {
    final sum = vitaminC + ironAndVitaminC;

    expect(sum[Micronutrient.vitaminC], 10);
    expect(sum[Micronutrient.iron], 2);
    expect(sum[Micronutrient.zinc], isNull);
  });

  test('a known zero stays known', () {
    expect(ironAndVitaminC[Micronutrient.vitaminC], 0);
    expect((const Micronutrients() + ironAndVitaminC).isEmpty, isFalse);
  });

  test('scales every known amount', () {
    expect(
      ironAndVitaminC.scaled(1.5),
      const Micronutrients(
        amounts: {Micronutrient.iron: 3, Micronutrient.vitaminC: 0},
      ),
    );
  });

  test('nutrients add and scale their micronutrients', () {
    const nutrients = Nutrients(kcal: 100, micros: vitaminC);

    expect(
      (nutrients + nutrients).scaled(0.5),
      const Nutrients(kcal: 100, micros: vitaminC),
    );
    expect(const Nutrients().micros.isEmpty, isTrue);
  });
}
