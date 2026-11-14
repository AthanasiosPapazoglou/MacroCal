import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/today/data/repositories/drift_food_log_repository.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';

import '../../../../helpers/ingredient_seeds.dart';
import '../../../../helpers/test_database.dart';

void main() {
  late AppDatabase database;
  late DriftFoodLogRepository repository;
  late DriftRecipeRepository recipes;
  late Ingredient milk;
  late Ingredient bread;

  setUp(() async {
    database = createTestDatabase(ingredientSeeds: testIngredientSeeds);
    repository = DriftFoodLogRepository(database);
    recipes = DriftRecipeRepository(database);
    [milk, bread] = await DriftIngredientRepository(database)
        .watchIngredients()
        .first;
  });
  tearDown(() => database.close());

  Future<Recipe> addToast() async {
    final id = await recipes.addRecipe(
      name: 'Toast',
      finalWeightGrams: 250,
      ingredients: [
        RecipeIngredient(ingredient: bread, grams: 100),
        RecipeIngredient(ingredient: milk, grams: 200),
      ],
    );
    return (await recipes.watchRecipe(id).first)!;
  }

  test('starts empty', () async {
    expect(await repository.watchEntries().first, isEmpty);
  });

  test(
    'replaceGrams logs ingredients with their grams and skips zeros',
    () async {
      await repository.replaceGrams({milk.id: 200, bread.id: 0});

      expect(await repository.watchEntries().first, [
        IngredientEntry(ingredient: milk, grams: 200),
      ]);
    },
  );

  test('replaceGrams logs recipes after the ingredients', () async {
    final toast = await addToast();

    await repository.replaceGrams(
      {bread.id: 30},
      gramsByRecipeId: {toast.id: 120},
    );

    expect(await repository.watchEntries().first, [
      IngredientEntry(ingredient: bread, grams: 30),
      RecipeEntry(recipe: toast, grams: 120),
    ]);
  });

  test('replaceGrams overwrites the previous log', () async {
    final toast = await addToast();
    await repository.replaceGrams(
      {milk.id: 200},
      gramsByRecipeId: {toast.id: 120},
    );

    await repository.replaceGrams({bread.id: 50});

    expect(await repository.watchEntries().first, [
      IngredientEntry(ingredient: bread, grams: 50),
    ]);
  });

  test('clear removes every entry', () async {
    final toast = await addToast();
    await repository.replaceGrams(
      {milk.id: 200, bread.id: 50},
      gramsByRecipeId: {toast.id: 120},
    );

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

  test('a logged recipe follows edits to its ingredients', () async {
    final toast = await addToast();
    await repository.replaceGrams({}, gramsByRecipeId: {toast.id: 120});
    final kcal = repository.watchEntries().map(
      (entries) => entries.single.per100g.kcal,
    );
    final emitted = expectLater(
      kcal,
      emitsInOrder([closeTo(136, 1e-9), emitsThrough(closeTo(156, 1e-9))]),
    );
    await repository.watchEntries().first;

    await DriftIngredientRepository(database).updateIngredient(
      milk.copyWith(per100g: milk.per100g.copyWith(kcal: 45 + 25)),
    );

    await emitted;
  });

  test('deleting a recipe removes its logged grams', () async {
    final toast = await addToast();
    await repository.replaceGrams({}, gramsByRecipeId: {toast.id: 120});

    await recipes.deleteRecipe(toast.id);

    expect(await repository.watchEntries().first, isEmpty);
  });
}
