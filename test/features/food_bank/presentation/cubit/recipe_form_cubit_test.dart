import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_form_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_ingredients.dart';

class _MockRecipeRepository extends Mock implements RecipeRepository;

class _MockIngredientRepository extends Mock implements IngredientRepository;

void main() {
  late RecipeRepository recipes;
  late RecipeFormCubit cubit;

  setUpAll(() => registerFallbackValue(<RecipeIngredient>[]));

  setUp(() async {
    recipes = _MockRecipeRepository();
    final ingredients = _MockIngredientRepository();
    when(ingredients.watchIngredients)
        .thenAnswer((_) => Stream.value(const [sampleMilk, sampleBread]));
    when(
      () => recipes.addRecipe(
        name: any(named: 'name'),
        ingredients: any(named: 'ingredients'),
        finalWeightGrams: any(named: 'finalWeightGrams'),
      ),
    ).thenAnswer((_) async => 1);
    cubit = RecipeFormCubit(recipes, ingredients);
    await cubit.load();
  });
  tearDown(() => cubit.close());

  void verifyNothingSaved() => verifyNever(
    () => recipes.addRecipe(
      name: any(named: 'name'),
      ingredients: any(named: 'ingredients'),
      finalWeightGrams: any(named: 'finalWeightGrams'),
    ),
  );

  test('load offers every ingredient', () {
    expect(cubit.state.status, RecipeFormStatus.ready);
    expect(cubit.state.items, isEmpty);
    expect(cubit.state.addable, [sampleMilk, sampleBread]);
  });

  test('an added ingredient starts at 0 g and is no longer offered', () {
    cubit
      ..addIngredient(sampleBread)
      ..addIngredient(sampleBread);

    expect(cubit.state.items, [
      const RecipeIngredient(ingredient: sampleBread, grams: 0),
    ]);
    expect(cubit.state.addable, [sampleMilk]);
  });

  test('grams, removal and the final weight update the draft', () {
    cubit
      ..addIngredient(sampleMilk)
      ..addIngredient(sampleBread)
      ..updateGrams(sampleMilk.id, 200)
      ..updateGrams(sampleBread.id, 100)
      ..updateFinalWeight(250);

    expect(cubit.state.draft.ingredientsWeightGrams, 300);
    expect(cubit.state.draft.weightGrams, 250);

    cubit
      ..removeIngredient(sampleMilk.id)
      ..updateFinalWeight(0);

    expect(cubit.state.items, [
      const RecipeIngredient(ingredient: sampleBread, grams: 100),
    ]);
    expect(cubit.state.finalWeightGrams, isNull);
  });

  test('saving without grams asks for ingredients', () async {
    cubit.addIngredient(sampleMilk);

    await cubit.save('Warm milk');

    expect(cubit.state.status, RecipeFormStatus.missingIngredients);
    verifyNothingSaved();
  });

  test('an edit clears the missing ingredients message', () async {
    cubit.addIngredient(sampleMilk);
    await cubit.save('Warm milk');

    cubit.updateGrams(sampleMilk.id, 250);

    expect(cubit.state.status, RecipeFormStatus.ready);
  });

  test('saving without a name stores nothing', () async {
    cubit
      ..addIngredient(sampleMilk)
      ..updateGrams(sampleMilk.id, 250);

    await cubit.save('  ');

    expect(cubit.state.status, RecipeFormStatus.invalid);
    verifyNothingSaved();
  });

  test('save stores the trimmed name, ingredients and final weight', () async {
    cubit
      ..addIngredient(sampleMilk)
      ..updateGrams(sampleMilk.id, 250)
      ..updateFinalWeight(240);
    final emitted = expectLater(
      cubit.stream.map((state) => state.status),
      emitsInOrder([RecipeFormStatus.saving, RecipeFormStatus.saved]),
    );

    await cubit.save(' Warm milk ');

    await emitted;
    verify(
      () => recipes.addRecipe(
        name: 'Warm milk',
        ingredients: const [
          RecipeIngredient(ingredient: sampleMilk, grams: 250),
        ],
        finalWeightGrams: 240,
      ),
    ).called(1);
  });

  test('a failed save reports the failure', () async {
    when(
      () => recipes.addRecipe(
        name: any(named: 'name'),
        ingredients: any(named: 'ingredients'),
        finalWeightGrams: any(named: 'finalWeightGrams'),
      ),
    ).thenThrow(Exception('db'));
    cubit
      ..addIngredient(sampleMilk)
      ..updateGrams(sampleMilk.id, 250);

    await cubit.save('Warm milk');

    expect(cubit.state.status, RecipeFormStatus.failure);
  });
}
