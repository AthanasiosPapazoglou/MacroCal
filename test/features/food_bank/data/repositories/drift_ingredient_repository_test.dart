import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/today/data/repositories/drift_food_log_repository.dart';

import '../../../../helpers/ingredient_seeds.dart';
import '../../../../helpers/test_database.dart';

void main() {
  late AppDatabase database;
  late DriftIngredientRepository repository;

  const oats = Nutrients(
    kcal: 389,
    proteinG: 16.9,
    carbsG: 66.3,
    sugarsG: 1,
    fatG: 6.9,
    saturatedG: 1.2,
    fiberG: 10.6,
    saltMg: 5,
  );

  const oatMicros = Micronutrients(
    amounts: {Micronutrient.iron: 4.3, Micronutrient.vitaminD: 0},
  );

  setUp(() {
    database = createTestDatabase(ingredientSeeds: testIngredientSeeds);
    repository = DriftIngredientRepository(database);
  });
  tearDown(() => database.close());

  test('watchIngredients emits the seeded ingredients in order', () async {
    final ingredients = await repository.watchIngredients().first;

    expect(ingredients.map((ingredient) => ingredient.name), [
      'Milk 1.5%',
      'Bread',
    ]);
    expect(ingredients.first.per100g.saltMg, 50);
    expect(ingredients.last.category, isNull);
  });

  test('addIngredient stores every field and returns the new id', () async {
    final id = await repository.addIngredient(
      name: 'Oats',
      category: 'Cereals',
      referenceGrams: 40,
      per100g: oats,
    );

    expect(
      await repository.watchIngredient(id).first,
      Ingredient(
        id: id,
        name: 'Oats',
        category: 'Cereals',
        referenceGrams: 40,
        per100g: oats,
      ),
    );
  });

  test('updateIngredient replaces the stored values', () async {
    final milk = (await repository.watchIngredients().first).first;
    final updated = milk.copyWith(name: 'Milk 3.5%', category: null);

    await repository.updateIngredient(updated);

    expect(await repository.watchIngredient(milk.id).first, updated);
  });

  test('deleteIngredient removes it and its logged grams', () async {
    final foodLog = DriftFoodLogRepository(database);
    final milk = (await repository.watchIngredients().first).first;
    await foodLog.replaceGrams({milk.id: 200});

    await repository.deleteIngredient(milk.id);

    expect(await repository.watchIngredient(milk.id).first, isNull);
    expect(await foodLog.watchEntries().first, isEmpty);
  });

  test('round-trips micros, keeping missing ones unknown', () async {
    final id = await repository.addIngredient(
      name: 'Oats',
      per100g: oats.copyWith(micros: oatMicros),
    );

    final micros = (await repository.watchIngredient(id).first)!.per100g.micros;
    expect(micros, oatMicros);
    expect(micros[Micronutrient.zinc], isNull);
  });

  test('watchIngredients lists each ingredient once with its micros', () async {
    await repository.addIngredient(
      name: 'Oats',
      per100g: oats.copyWith(micros: oatMicros),
    );

    final ingredients = await repository.watchIngredients().first;
    expect(ingredients.map((ingredient) => ingredient.name), [
      'Milk 1.5%',
      'Bread',
      'Oats',
    ]);
    expect(ingredients.first.per100g.micros.isEmpty, isTrue);
    expect(ingredients.last.per100g.micros, oatMicros);
  });

  test('updateIngredient replaces its micros', () async {
    final id = await repository.addIngredient(
      name: 'Oats',
      per100g: oats.copyWith(micros: oatMicros),
    );
    final saved = (await repository.watchIngredient(id).first)!;
    const zinc = Micronutrients(amounts: {Micronutrient.zinc: 3.6});

    await repository.updateIngredient(
      saved.copyWith(per100g: saved.per100g.copyWith(micros: zinc)),
    );

    expect((await repository.watchIngredient(id).first)!.per100g.micros, zinc);
  });

  test('deleteIngredient removes its micros', () async {
    final id = await repository.addIngredient(
      name: 'Oats',
      per100g: oats.copyWith(micros: oatMicros),
    );

    await repository.deleteIngredient(id);

    expect(
      await database.select(database.ingredientMicronutrientsTable).get(),
      isEmpty,
    );
  });
}
