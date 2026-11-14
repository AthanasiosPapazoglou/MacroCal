import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';

import '../../../../helpers/ingredient_seeds.dart';
import '../../../../helpers/test_database.dart';

void main() {
  late AppDatabase database;
  late DriftIngredientRepository ingredients;
  late DriftRecipeRepository repository;
  late Ingredient milk;
  late Ingredient bread;

  setUp(() async {
    database = createTestDatabase(ingredientSeeds: testIngredientSeeds);
    ingredients = DriftIngredientRepository(database);
    repository = DriftRecipeRepository(database);
    [milk, bread] = await ingredients.watchIngredients().first;
  });
  tearDown(() => database.close());

  Future<int> addWarmMilk() => repository.addRecipe(
    name: 'Warm milk',
    ingredients: [RecipeIngredient(ingredient: milk, grams: 250)],
  );

  test('addRecipe stores the recipe with its ingredients in order', () async {
    final id = await repository.addRecipe(
      name: 'Milk toast',
      finalWeightGrams: 230,
      ingredients: [
        RecipeIngredient(ingredient: bread, grams: 50),
        RecipeIngredient(ingredient: milk, grams: 200),
      ],
    );

    expect(
      await repository.watchRecipe(id).first,
      Recipe(
        id: id,
        name: 'Milk toast',
        finalWeightGrams: 230,
        ingredients: [
          RecipeIngredient(ingredient: bread, grams: 50),
          RecipeIngredient(ingredient: milk, grams: 200),
        ],
      ),
    );
  });

  test('addRecipe leaves out ingredients without grams', () async {
    final id = await repository.addRecipe(
      name: 'Toast',
      ingredients: [
        RecipeIngredient(ingredient: milk, grams: 0),
        RecipeIngredient(ingredient: bread, grams: 60),
      ],
    );

    final recipe = await repository.watchRecipe(id).first;

    expect(recipe?.ingredients, [
      RecipeIngredient(ingredient: bread, grams: 60),
    ]);
  });

  test('watchRecipes lists the recipes in the order added', () async {
    await repository.addRecipe(
      name: 'Toast',
      ingredients: [RecipeIngredient(ingredient: bread, grams: 60)],
    );
    await addWarmMilk();

    final recipes = await repository.watchRecipes().first;

    expect(recipes.map((recipe) => recipe.name), ['Toast', 'Warm milk']);
  });

  test('watchRecipes emits when one of their ingredients changes', () async {
    await addWarmMilk();
    final emitted = expectLater(
      repository.watchRecipes().map(
        (recipes) => recipes.single.ingredients.single.ingredient.name,
      ),
      emitsInOrder([milk.name, 'Milk 3.5%']),
    );
    await repository.watchRecipes().first;
    await ingredients.updateIngredient(milk.copyWith(name: 'Milk 3.5%'));

    await emitted;
  });

  test('updateRecipe replaces its name, weight and ingredients', () async {
    final id = await repository.addRecipe(
      name: 'Toast',
      finalWeightGrams: 55,
      ingredients: [RecipeIngredient(ingredient: bread, grams: 60)],
    );
    final updated = Recipe(
      id: id,
      name: 'Milk toast',
      ingredients: [
        RecipeIngredient(ingredient: milk, grams: 100),
        RecipeIngredient(ingredient: bread, grams: 60),
      ],
    );

    await repository.updateRecipe(updated);

    expect(await repository.watchRecipe(id).first, updated);
  });

  test('deleteRecipe removes its ingredients and logged grams', () async {
    final id = await addWarmMilk();
    await database
        .into(database.recipeEntriesTable)
        .insert(RecipeEntriesTableCompanion.insert(recipeId: id, grams: 120));

    await repository.deleteRecipe(id);

    expect(await repository.watchRecipe(id).first, isNull);
    expect(
      await database.select(database.recipeIngredientsTable).get(),
      isEmpty,
    );
    expect(await database.select(database.recipeEntriesTable).get(), isEmpty);
  });

  test('deleting an ingredient keeps the recipes that used it', () async {
    final id = await addWarmMilk();

    await ingredients.deleteIngredient(milk.id);

    expect(
      await repository.watchRecipe(id).first,
      Recipe(id: id, name: 'Warm milk'),
    );
  });

  test('watchRecipeNamesUsing lists the recipes with the ingredient', () async {
    await repository.addRecipe(
      name: 'Toast',
      ingredients: [RecipeIngredient(ingredient: bread, grams: 60)],
    );
    await addWarmMilk();
    await repository.addRecipe(
      name: 'Milk toast',
      ingredients: [
        RecipeIngredient(ingredient: bread, grams: 60),
        RecipeIngredient(ingredient: milk, grams: 100),
      ],
    );

    expect(await repository.watchRecipeNamesUsing(milk.id).first, [
      'Warm milk',
      'Milk toast',
    ]);
  });

  test('recipe ingredients carry their micros, one item each', () async {
    const breadMicros = Micronutrients(
      amounts: {Micronutrient.iron: 2.5, Micronutrient.calcium: 30},
    );
    await ingredients.updateIngredient(
      bread.copyWith(per100g: bread.per100g.copyWith(micros: breadMicros)),
    );
    final id = await repository.addRecipe(
      name: 'Toast',
      ingredients: [
        RecipeIngredient(ingredient: bread, grams: 100),
        RecipeIngredient(ingredient: milk, grams: 200),
      ],
    );

    final recipe = (await repository.watchRecipe(id).first)!;
    expect(recipe.ingredients.map((item) => item.ingredient.per100g.micros), [
      breadMicros,
      const Micronutrients(),
    ]);
  });
}
