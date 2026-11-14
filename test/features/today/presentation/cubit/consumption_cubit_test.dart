import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/food_kind.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/supplement_repository.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
import 'package:macro_cal_public/features/today/domain/entities/supplement_entry.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/consumption_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/consumption_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_ingredients.dart';
import '../../../../helpers/sample_recipes.dart';
import '../../../../helpers/sample_supplements.dart';

class _MockIngredientRepository extends Mock implements IngredientRepository;

class _MockRecipeRepository extends Mock implements RecipeRepository;

class _MockFoodLogRepository extends Mock implements FoodLogRepository;

class _MockSupplementRepository extends Mock implements SupplementRepository;

class _MockSettingsRepository extends Mock implements SettingsRepository;

void main() {
  late FoodLogRepository foodLog;
  late SettingsRepository settings;
  late ConsumptionCubit cubit;

  When<Future<void>> stubReplaceGrams() => when(
    () => foodLog.replaceGrams(
      any(),
      gramsByRecipeId: any(named: 'gramsByRecipeId'),
    ),
  );

  setUpAll(() {
    registerFallbackValue(<int, int>{});
    registerFallbackValue(<int, double>{});
  });

  setUp(() {
    final ingredients = _MockIngredientRepository();
    final recipes = _MockRecipeRepository();
    foodLog = _MockFoodLogRepository();
    final supplements = _MockSupplementRepository();
    settings = _MockSettingsRepository();
    when(supplements.watchSupplements).thenAnswer(
      (_) => Stream.value(const [sampleVitaminD, sampleMultivitamin]),
    );
    when(foodLog.watchSupplementEntries).thenAnswer(
      (_) => Stream.value(const [
        SupplementEntry(supplement: sampleVitaminD, units: 2),
      ]),
    );
    when(settings.watchMicrocalEnabled).thenAnswer((_) => Stream.value(true));
    when(() => foodLog.replaceSupplementUnits(any())).thenAnswer((_) async {});
    when(ingredients.watchIngredients)
        .thenAnswer((_) => Stream.value(const [sampleMilk, sampleBread]));
    when(
      recipes.watchRecipes,
    ).thenAnswer((_) => Stream.value(const [sampleMilkToast, sampleWarmMilk]));
    when(foodLog.watchEntries).thenAnswer(
      (_) => Stream.value(const [
        IngredientEntry(ingredient: sampleMilk, grams: 200),
        RecipeEntry(recipe: sampleWarmMilk, grams: 120),
      ]),
    );
    stubReplaceGrams().thenAnswer((_) async {});
    when(foodLog.clear).thenAnswer((_) async {});
    cubit = ConsumptionCubit(
      ingredients,
      recipes,
      foodLog,
      supplements,
      settings,
    );
  });
  tearDown(() => cubit.close());

  test('load combines every food with the logged grams', () async {
    await cubit.load();

    expect(cubit.state.status, ConsumptionStatus.ready);
    expect(cubit.state.kind, FoodKind.ingredient);
    expect(cubit.state.visibleIngredients, [sampleMilk, sampleBread]);
    expect(cubit.state.visibleRecipes, [sampleMilkToast, sampleWarmMilk]);
    expect(cubit.state.gramsOf(sampleMilk.id), 200);
    expect(cubit.state.gramsOf(sampleBread.id), 0);
    expect(cubit.state.recipeGramsOf(sampleWarmMilk.id), 120);
    expect(cubit.state.recipeGramsOf(sampleMilkToast.id), 0);
    expect(cubit.state.consumedIngredients, [sampleMilk]);
    expect(cubit.state.consumedRecipes, [sampleWarmMilk]);
  });

  test('updateGrams changes the draft but not the consumed snapshot', () async {
    await cubit.load();

    cubit
      ..updateGrams(sampleBread.id, 50)
      ..updateGrams(sampleMilk.id, 0)
      ..updateRecipeGrams(sampleMilkToast.id, 80);

    expect(cubit.state.gramsOf(sampleBread.id), 50);
    expect(cubit.state.recipeGramsOf(sampleMilkToast.id), 80);
    expect(cubit.state.consumedIngredients, [sampleMilk]);
    expect(cubit.state.consumedRecipes, [sampleWarmMilk]);
    verifyNever(
      () => foodLog.replaceGrams(
        any(),
        gramsByRecipeId: any(named: 'gramsByRecipeId'),
      ),
    );
  });

  test('refreshConsumed takes a new snapshot of the draft', () async {
    await cubit.load();
    cubit
      ..updateGrams(sampleBread.id, 50)
      ..updateGrams(sampleMilk.id, 0)
      ..updateRecipeGrams(sampleMilkToast.id, 80)
      ..updateRecipeGrams(sampleWarmMilk.id, 0)
      ..refreshConsumed();

    expect(cubit.state.consumedIngredients, [sampleBread]);
    expect(cubit.state.consumedRecipes, [sampleMilkToast]);
  });

  test('selectKind switches between ingredients and recipes', () async {
    await cubit.load();

    cubit.selectKind(FoodKind.recipe);

    expect(cubit.state.kind, FoodKind.recipe);
  });

  test('search filters both lists by name', () async {
    await cubit.load();

    cubit.search('toast');

    expect(cubit.state.visibleIngredients, isEmpty);
    expect(cubit.state.visibleRecipes, [sampleMilkToast]);
  });

  test('save stores the ingredient and recipe grams', () async {
    await cubit.load();
    cubit
      ..updateGrams(sampleBread.id, 50)
      ..updateRecipeGrams(sampleMilkToast.id, 80);

    await cubit.save();

    expect(cubit.state.status, ConsumptionStatus.saved);
    verify(
      () => foodLog.replaceGrams(
        {sampleMilk.id: 200, sampleBread.id: 50},
        gramsByRecipeId: {sampleWarmMilk.id: 120, sampleMilkToast.id: 80},
      ),
    ).called(1);
    verify(() => foodLog.replaceSupplementUnits({sampleVitaminD.id: 2.0}))
        .called(1);
  });

  test('load reads the logged supplement units and the switch', () async {
    await cubit.load();

    expect(cubit.state.showSupplements, isTrue);
    expect(cubit.state.visibleSupplements, [
      sampleVitaminD,
      sampleMultivitamin,
    ]);
    expect(cubit.state.unitsOf(sampleVitaminD.id), 2);
    expect(cubit.state.consumedSupplements, [sampleVitaminD]);
  });

  test('supplement units are saved and taken into the snapshot', () async {
    await cubit.load();
    cubit
      ..updateSupplementUnits(sampleMultivitamin.id, 1)
      ..updateSupplementUnits(sampleVitaminD.id, 0);

    await cubit.save();

    verify(
      () => foodLog.replaceSupplementUnits({
        sampleVitaminD.id: 0.0,
        sampleMultivitamin.id: 1.0,
      }),
    ).called(1);
    expect(cubit.state.consumedSupplements, [sampleMultivitamin]);
  });

  test('tracking off hides the consumed supplements but keeps them', () async {
    when(settings.watchMicrocalEnabled).thenAnswer((_) => Stream.value(false));
    await cubit.load();

    expect(cubit.state.consumedSupplements, isEmpty);

    await cubit.save();

    verify(() => foodLog.replaceSupplementUnits({sampleVitaminD.id: 2.0}))
        .called(1);
  });

  test('reset clears the log and the draft and stays ready', () async {
    await cubit.load();

    await cubit.reset();

    expect(cubit.state.status, ConsumptionStatus.ready);
    expect(cubit.state.gramsOf(sampleMilk.id), 0);
    expect(cubit.state.recipeGramsOf(sampleWarmMilk.id), 0);
    expect(cubit.state.consumedIngredients, isEmpty);
    expect(cubit.state.consumedRecipes, isEmpty);
    expect(cubit.state.unitsOf(sampleVitaminD.id), 0);
    expect(cubit.state.consumedSupplements, isEmpty);
    verify(foodLog.clear).called(1);
  });

  test('save emits failure when storing throws', () async {
    stubReplaceGrams().thenThrow(Exception('db'));
    await cubit.load();

    await cubit.save();

    expect(cubit.state.status, ConsumptionStatus.failure);
  });
}
