import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/food_kind.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/supplement_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_state.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_ingredients.dart';
import '../../../../helpers/sample_recipes.dart';
import '../../../../helpers/sample_supplements.dart';

class _MockIngredientRepository extends Mock implements IngredientRepository;

class _MockRecipeRepository extends Mock implements RecipeRepository;

class _MockSupplementRepository extends Mock implements SupplementRepository;

class _MockSettingsRepository extends Mock implements SettingsRepository;

void main() {
  late StreamController<List<Ingredient>> ingredients;
  late StreamController<List<Recipe>> recipes;
  late StreamController<List<Supplement>> supplements;
  late StreamController<bool> microcalEnabled;
  late FoodBankCubit cubit;

  setUp(() {
    ingredients = StreamController<List<Ingredient>>.broadcast();
    recipes = StreamController<List<Recipe>>.broadcast();
    supplements = StreamController<List<Supplement>>.broadcast();
    microcalEnabled = StreamController<bool>.broadcast();
    final ingredientRepository = _MockIngredientRepository();
    final recipeRepository = _MockRecipeRepository();
    final supplementRepository = _MockSupplementRepository();
    final settingsRepository = _MockSettingsRepository();
    when(ingredientRepository.watchIngredients)
        .thenAnswer((_) => ingredients.stream);
    when(recipeRepository.watchRecipes).thenAnswer((_) => recipes.stream);
    when(supplementRepository.watchSupplements)
        .thenAnswer((_) => supplements.stream);
    when(settingsRepository.watchMicrocalEnabled)
        .thenAnswer((_) => microcalEnabled.stream);
    cubit = FoodBankCubit(
      ingredientRepository,
      recipeRepository,
      supplementRepository,
      settingsRepository,
    );
  });
  tearDown(() async {
    await cubit.close();
    await ingredients.close();
    await recipes.close();
    await supplements.close();
    await microcalEnabled.close();
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

  test('supplements show while tracking is on and filter by name', () async {
    await loadSamples();

    microcalEnabled.add(true);
    await cubit.stream.first;
    supplements.add(const [sampleVitaminD, sampleMultivitamin]);
    await cubit.stream.first;
    cubit
      ..selectKind(FoodKind.supplement)
      ..search('multi');

    expect(cubit.state.showSupplements, isTrue);
    expect(cubit.state.visibleSupplements, [sampleMultivitamin]);
  });

  test('turning tracking off leaves the supplements side', () async {
    await loadSamples();
    microcalEnabled.add(true);
    await cubit.stream.first;
    cubit.selectKind(FoodKind.supplement);

    microcalEnabled.add(false);
    await cubit.stream.first;

    expect(cubit.state.showSupplements, isFalse);
    expect(cubit.state.kind, FoodKind.ingredient);
  });
}
