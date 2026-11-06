import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';

void main() {
  const sample = Nutrients(
    kcal: 100,
    proteinG: 10,
    carbsG: 20,
    sugarsG: 5,
    fatG: 4,
    saturatedG: 2,
    fiberG: 3,
    saltMg: 400,
  );

  test('adds every field', () {
    expect(
      sample + sample,
      const Nutrients(
        kcal: 200,
        proteinG: 20,
        carbsG: 40,
        sugarsG: 10,
        fatG: 8,
        saturatedG: 4,
        fiberG: 6,
        saltMg: 800,
      ),
    );
  });

  test('scales every field', () {
    expect(
      sample.scaled(0.5),
      const Nutrients(
        kcal: 50,
        proteinG: 5,
        carbsG: 10,
        sugarsG: 2.5,
        fatG: 2,
        saturatedG: 1,
        fiberG: 1.5,
        saltMg: 200,
      ),
    );
  });
}
