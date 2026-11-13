import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/food_kind.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_ingredients.dart';
import '../../../../helpers/sample_recipes.dart';

class _MockIngredientRepository extends Mock implements IngredientRepository;

class _MockRecipeRepository extends Mock implements RecipeRepository;

void main() {
  late StreamController<List<Ingredient>> ingredients;
  late StreamController<List<Recipe>> recipes;
  late FoodBankCubit cubit;

  setUp(() {
    ingredients = StreamController<List<Ingredient>>.broadcast();
    recipes = StreamController<List<Recipe>>.broadcast();
    final ingredientRepository = _MockIngredientRepository();
    final recipeRepository = _MockRecipeRepository();
    when(ingredientRepository.watchIngredients)
        .thenAnswer((_) => ingredients.stream);
    when(recipeRepository.watchRecipes).thenAnswer((_) => recipes.stream);
    cubit = FoodBankCubit(ingredientRepository, recipeRepository);
  });
  tearDown(() async {
    await cubit.close();
    await ingredients.close();
    await recipes.close();
  });

  Future<void> loadSamples() async {
    cubit.watch();
    ingredients.add(const [sampleMilk, sampleBread]);
    await cubit.stream.first;
    recipes.add(const [sampleMilkToast, sampleWarmMilk]);
    await cubit.stream.first;
  }

  test('watch follows the stored ingredients and recipes', () async {
    await loadSamples();

    expect(cubit.state.status, FoodBankStatus.ready);
    expect(cubit.state.visibleIngredients, [sampleMilk, sampleBread]);
    expect(cubit.state.visibleRecipes, [sampleMilkToast, sampleWarmMilk]);
    expect(cubit.state.isFiltering, isFalse);
  });

  test('starts on the ingredients and switches to the recipes', () {
    expect(cubit.state.kind, FoodKind.ingredient);

    cubit.selectKind(FoodKind.recipe);

    expect(cubit.state.kind, FoodKind.recipe);
  });

  test('search filters both lists by name, ignoring case', () async {
    await loadSamples();

    cubit.search('BREAD');

    expect(cubit.state.isFiltering, isTrue);
    expect(cubit.state.visibleIngredients, [sampleBread]);
    expect(cubit.state.visibleRecipes, isEmpty);

    cubit.search('toast');

    expect(cubit.state.visibleRecipes, [sampleMilkToast]);
  });

  test('an empty search shows everything again', () async {
    await loadSamples();
    cubit
      ..search('milk')
      ..search('');

    expect(cubit.state.visibleIngredients, [sampleMilk, sampleBread]);
    expect(cubit.state.visibleRecipes, [sampleMilkToast, sampleWarmMilk]);
  });

  test('watch emits failure when a stream errors', () async {
    final emitted = expectLater(
      cubit.stream.map((state) => state.status),
      emits(FoodBankStatus.failure),
    );

    cubit.watch();
    recipes.addError(Exception('db'));

    await emitted;
  });
}
