import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/seed/ingredient_seed.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';

import '../../../helpers/ingredient_seeds.dart';
import '../../../helpers/test_database.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('the default asset holds 28 complete ingredients', () async {
    final seeds = await loadDefaultIngredientSeeds();

    expect(seeds, hasLength(28));
    expect(seeds.every((seed) => seed.name.isNotEmpty), isTrue);
  });

  test('the generic default ingredients carry micronutrients', () async {
    final seeds = await loadDefaultIngredientSeeds();
    final withMicros = seeds.where((seed) => seed.micros.isNotEmpty);

    expect(withMicros.map((seed) => seed.name), [
      'Γάλα 1.5%',
      'Αυγά Μέτρια',
      'Ελαιόλαδο',
      'Μήλο',
      'Chicken Breast (Raw)',
      'Chicken Thigh (Raw)',
    ]);
    final names = Micronutrient.values.map((nutrient) => nutrient.name);
    expect(
      withMicros.expand((seed) => seed.micros.keys).every(names.contains),
      isTrue,
    );
  });

  test('a new database stores the seed micronutrients', () async {
    final database = createTestDatabase(
      ingredientSeeds: () async => [
        IngredientSeed(
          name: milkSeed.name,
          category: milkSeed.category,
          referenceG: milkSeed.referenceG,
          kcal: milkSeed.kcal,
          proteinG: milkSeed.proteinG,
          carbsG: milkSeed.carbsG,
          sugarsG: milkSeed.sugarsG,
          fatG: milkSeed.fatG,
          saturatedG: milkSeed.saturatedG,
          fiberG: milkSeed.fiberG,
          saltMg: milkSeed.saltMg,
          micros: const {'calcium': 120, 'iodine': 26},
        ),
        breadSeed,
      ],
    );
    addTearDown(database.close);

    final milk = await (database.select(
      database.ingredientsTable,
    )..where((row) => row.name.equals(milkSeed.name))).getSingle();
    final micros = await database
        .select(database.ingredientMicronutrientsTable)
        .get();

    expect(micros.map((row) => row.ingredientId).toSet(), {milk.id});
    expect(
      {for (final row in micros) row.nutrient: row.amount},
      {'calcium': 120, 'iodine': 26},
    );
  });

  test('a new database is seeded and Uncategorised becomes null', () async {
    final database = createTestDatabase(ingredientSeeds: testIngredientSeeds);
    addTearDown(database.close);

    final rows = await database.select(database.ingredientsTable).get();

    expect(rows.map((row) => row.name), ['Milk 1.5%', 'Bread']);
    expect(rows.map((row) => row.category), ['Dairy', null]);
    expect(rows.first.saltMg, milkSeed.saltMg);
  });

  test('a database without a seed loader starts empty', () async {
    final database = createTestDatabase();
    addTearDown(database.close);

    expect(await database.select(database.ingredientsTable).get(), isEmpty);
  });
}
