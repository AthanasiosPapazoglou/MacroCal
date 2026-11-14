import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';

const sampleVitaminD = Supplement(
  id: 1,
  name: 'Vitamin D3',
  unit: SupplementUnit.drop,
  microsPerUnit: Micronutrients(amounts: {Micronutrient.vitaminD: 10}),
);

const sampleMultivitamin = Supplement(
  id: 2,
  name: 'Multivitamin',
  unit: SupplementUnit.tablet,
  microsPerUnit: Micronutrients(
    amounts: {Micronutrient.vitaminC: 80, Micronutrient.zinc: 10},
  ),
);
