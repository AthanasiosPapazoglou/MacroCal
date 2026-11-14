import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_supplement_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/today/data/repositories/drift_food_log_repository.dart';

import '../../../../helpers/test_database.dart';

void main() {
  late AppDatabase database;
  late DriftSupplementRepository repository;

  const multivitamin = Micronutrients(
    amounts: {Micronutrient.vitaminD: 10, Micronutrient.zinc: 5},
  );

  setUp(() {
    database = createTestDatabase();
    repository = DriftSupplementRepository(database);
  });
  tearDown(() => database.close());

  test('starts empty', () async {
    expect(await repository.watchSupplements().first, isEmpty);
  });

  test('addSupplement round-trips name, unit and micros per unit', () async {
    final id = await repository.addSupplement(
      name: 'Multivitamin',
      unit: SupplementUnit.tablet,
      microsPerUnit: multivitamin,
    );

    expect(await repository.watchSupplements().first, [
      Supplement(
        id: id,
        name: 'Multivitamin',
        unit: SupplementUnit.tablet,
        microsPerUnit: multivitamin,
      ),
    ]);
  });

  test('updateSupplement replaces its name, unit and micros', () async {
    final id = await repository.addSupplement(
      name: 'Multivitamin',
      unit: SupplementUnit.tablet,
      microsPerUnit: multivitamin,
    );
    final updated = Supplement(
      id: id,
      name: 'Vitamin D',
      unit: SupplementUnit.drop,
      microsPerUnit: const Micronutrients(
        amounts: {Micronutrient.vitaminD: 25},
      ),
    );

    await repository.updateSupplement(updated);

    expect(await repository.watchSupplement(id).first, updated);
  });

  test('deleteSupplement removes its micros and logged units', () async {
    final foodLog = DriftFoodLogRepository(database);
    final id = await repository.addSupplement(
      name: 'Multivitamin',
      unit: SupplementUnit.tablet,
      microsPerUnit: multivitamin,
    );
    await foodLog.replaceSupplementUnits({id: 1});

    await repository.deleteSupplement(id);

    expect(await repository.watchSupplement(id).first, isNull);
    expect(
      await database.select(database.supplementMicronutrientsTable).get(),
      isEmpty,
    );
    expect(await foodLog.watchSupplementEntries().first, isEmpty);
  });
}
