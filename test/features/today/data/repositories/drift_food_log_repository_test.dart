import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/today/data/repositories/drift_food_log_repository.dart';

import '../../../../helpers/ingredient_seeds.dart';
import '../../../../helpers/test_database.dart';

void main() {
  late AppDatabase database;
  late DriftFoodLogRepository repository;
  late Ingredient milk;
  late Ingredient bread;

  setUp(() async {
    database = createTestDatabase(ingredientSeeds: testIngredientSeeds);
    repository = DriftFoodLogRepository(database);
    [milk, bread] = await DriftIngredientRepository(database)
        .watchIngredients()
        .first;
  });
  tearDown(() => database.close());

  test('starts empty', () async {
    expect(await repository.watchEntries().first, isEmpty);
  });

  test(
    'replaceGrams logs ingredients with their grams and skips zeros',
    () async {
      await repository.replaceGrams({milk.id: 200, bread.id: 0});

      final entries = await repository.watchEntries().first;
      expect(entries.map((entry) => (entry.ingredient, entry.grams)), [
        (milk, 200),
      ]);
    },
  );

  test('replaceGrams overwrites the previous log', () async {
    await repository.replaceGrams({milk.id: 200});
    await repository.replaceGrams({bread.id: 50});

    final entries = await repository.watchEntries().first;
    expect(entries.map((entry) => (entry.ingredient.id, entry.grams)), [
      (bread.id, 50),
    ]);
  });

  test('clear removes every entry', () async {
    await repository.replaceGrams({milk.id: 200, bread.id: 50});

    await repository.clear();

    expect(await repository.watchEntries().first, isEmpty);
  });

  test('watchEntries emits after a change', () async {
    final emitted = expectLater(
      repository.watchEntries().map((entries) => entries.length),
      emitsInOrder([0, 2]),
    );
    await repository.watchEntries().first;
    await repository.replaceGrams({milk.id: 200, bread.id: 50});

    await emitted;
  });
}
