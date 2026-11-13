import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_details_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_details_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_recipes.dart';

class _MockRecipeRepository extends Mock implements RecipeRepository;

void main() {
  late StreamController<Recipe?> recipe;
  late RecipeRepository repository;
  late RecipeDetailsCubit cubit;

  setUp(() {
    recipe = StreamController<Recipe?>.broadcast();
    repository = _MockRecipeRepository();
    when(() => repository.watchRecipe(sampleMilkToast.id))
        .thenAnswer((_) => recipe.stream);
    when(() => repository.deleteRecipe(any())).thenAnswer((_) async {});
    cubit = RecipeDetailsCubit(repository, sampleMilkToast.id);
  });
  tearDown(() async {
    await cubit.close();
    await recipe.close();
  });

  test('watch follows the recipe', () async {
    final renamed = sampleMilkToast.copyWith(name: 'Toast with milk');
    final emitted = expectLater(
      cubit.stream,
      emitsInOrder([
        const RecipeDetailsState(
          status: RecipeDetailsStatus.ready,
          recipe: sampleMilkToast,
        ),
        RecipeDetailsState(status: RecipeDetailsStatus.ready, recipe: renamed),
      ]),
    );

    cubit.watch();
    recipe
      ..add(sampleMilkToast)
      ..add(renamed);

    await emitted;
  });

  test('an unknown id reports notFound', () async {
    final emitted = expectLater(
      cubit.stream.map((state) => state.status),
      emits(RecipeDetailsStatus.notFound),
    );

    cubit.watch();
    recipe.add(null);

    await emitted;
  });

  test('watch emits failure when the stream errors', () async {
    final emitted = expectLater(
      cubit.stream.map((state) => state.status),
      emits(RecipeDetailsStatus.failure),
    );

    cubit.watch();
    recipe.addError(Exception('db'));

    await emitted;
  });

  test('delete removes the recipe and stays deleted', () async {
    cubit.watch();
    recipe.add(sampleMilkToast);
    await cubit.stream.first;

    await cubit.delete();
    recipe.add(null);
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.status, RecipeDetailsStatus.deleted);
    verify(() => repository.deleteRecipe(sampleMilkToast.id)).called(1);
  });

  test('delete emits failure when the repository throws', () async {
    when(() => repository.deleteRecipe(any())).thenThrow(Exception('db'));

    await cubit.delete();

    expect(cubit.state.status, RecipeDetailsStatus.failure);
  });
}
