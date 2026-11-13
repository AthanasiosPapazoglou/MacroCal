import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_details_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_details_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_ingredients.dart';

class _MockIngredientRepository extends Mock implements IngredientRepository;

class _MockRecipeRepository extends Mock implements RecipeRepository;

void main() {
  late StreamController<Ingredient?> ingredient;
  late StreamController<List<String>> recipeNames;
  late IngredientRepository repository;
  late IngredientDetailsCubit cubit;

  setUp(() {
    ingredient = StreamController<Ingredient?>.broadcast();
    recipeNames = StreamController<List<String>>.broadcast();
    repository = _MockIngredientRepository();
    final recipes = _MockRecipeRepository();
    when(() => repository.watchIngredient(sampleMilk.id))
        .thenAnswer((_) => ingredient.stream);
    when(() => repository.deleteIngredient(any())).thenAnswer((_) async {});
    when(() => recipes.watchRecipeNamesUsing(sampleMilk.id))
        .thenAnswer((_) => recipeNames.stream);
    cubit = IngredientDetailsCubit(repository, recipes, sampleMilk.id);
  });
  tearDown(() async {
    await cubit.close();
    await ingredient.close();
    await recipeNames.close();
  });

  test('watch follows the recipes that use the ingredient', () async {
    cubit.watch();
    ingredient.add(sampleMilk);
    await cubit.stream.first;

    recipeNames.add(const ['Milk Toast', 'Warm Milk']);
    await cubit.stream.first;

    expect(cubit.state.ingredient, sampleMilk);
    expect(cubit.state.recipeNames, ['Milk Toast', 'Warm Milk']);
  });

  test('watch follows the ingredient', () async {
    final emitted = expectLater(
      cubit.stream,
      emitsInOrder([
        const IngredientDetailsState(
          status: IngredientDetailsStatus.ready,
          ingredient: sampleMilk,
        ),
        IngredientDetailsState(
          status: IngredientDetailsStatus.ready,
          ingredient: sampleMilk.copyWith(name: 'Milk 3.5%'),
        ),
      ]),
    );

    cubit.watch();
    ingredient
      ..add(sampleMilk)
      ..add(sampleMilk.copyWith(name: 'Milk 3.5%'));

    await emitted;
  });

  test('an unknown id reports notFound', () async {
    final emitted = expectLater(
      cubit.stream.map((state) => state.status),
      emits(IngredientDetailsStatus.notFound),
    );

    cubit.watch();
    ingredient.add(null);

    await emitted;
  });

  test('delete removes the ingredient and stays deleted', () async {
    cubit.watch();
    ingredient.add(sampleMilk);
    await cubit.stream.first;

    await cubit.delete();
    ingredient.add(null);
    recipeNames.add(const []);
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.status, IngredientDetailsStatus.deleted);
    verify(() => repository.deleteIngredient(sampleMilk.id)).called(1);
  });

  test('delete emits failure when the repository throws', () async {
    when(() => repository.deleteIngredient(any())).thenThrow(Exception('db'));

    await cubit.delete();

    expect(cubit.state.status, IngredientDetailsStatus.failure);
  });
}
