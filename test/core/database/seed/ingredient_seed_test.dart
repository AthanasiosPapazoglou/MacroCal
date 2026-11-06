import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/seed/ingredient_seed.dart';

import '../../../helpers/ingredient_seeds.dart';
import '../../../helpers/test_database.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('the default asset holds 28 complete ingredients', () async {
    final seeds = await loadDefaultIngredientSeeds();

    expect(seeds, hasLength(28));
    expect(seeds.every((seed) => seed.name.isNotEmpty), isTrue);
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
