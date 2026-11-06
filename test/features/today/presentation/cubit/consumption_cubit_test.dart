import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/consumption_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/consumption_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_ingredients.dart';

class _MockIngredientRepository extends Mock implements IngredientRepository;

class _MockFoodLogRepository extends Mock implements FoodLogRepository;

void main() {
  late IngredientRepository ingredients;
  late FoodLogRepository foodLog;
  late ConsumptionCubit cubit;

  setUp(() {
    ingredients = _MockIngredientRepository();
    foodLog = _MockFoodLogRepository();
    when(() => ingredients.watchIngredients())
        .thenAnswer((_) => Stream.value(const [sampleMilk, sampleBread]));
    when(() => foodLog.watchEntries()).thenAnswer(
      (_) =>
          Stream.value(const [FoodEntry(ingredient: sampleMilk, grams: 200)]),
    );
    when(() => foodLog.replaceGrams(any())).thenAnswer((_) async {});
    when(() => foodLog.clear()).thenAnswer((_) async {});
    cubit = ConsumptionCubit(ingredients, foodLog);
  });
  tearDown(() => cubit.close());

  test('load combines every ingredient with the logged grams', () async {
    await cubit.load();

    expect(cubit.state.status, ConsumptionStatus.ready);
    expect(cubit.state.visibleIngredients, [sampleMilk, sampleBread]);
    expect(cubit.state.gramsOf(sampleMilk.id), 200);
    expect(cubit.state.gramsOf(sampleBread.id), 0);
    expect(cubit.state.consumedIngredients, [sampleMilk]);
  });

  test('updateGrams changes the draft but not the consumed snapshot', () async {
    await cubit.load();

    cubit
      ..updateGrams(sampleBread.id, 50)
      ..updateGrams(sampleMilk.id, 0);

    expect(cubit.state.gramsOf(sampleBread.id), 50);
    expect(cubit.state.consumedIngredients, [sampleMilk]);
    verifyNever(() => foodLog.replaceGrams(any()));
  });

  test('refreshConsumed takes a new snapshot of the draft', () async {
    await cubit.load();
    cubit
      ..updateGrams(sampleBread.id, 50)
      ..updateGrams(sampleMilk.id, 0)
      ..refreshConsumed();

    expect(cubit.state.consumedIngredients, [sampleBread]);
  });

  test('search filters the ingredient list by name', () async {
    await cubit.load();

    cubit.search('milk');

    expect(cubit.state.visibleIngredients, [sampleMilk]);
  });

  test('save stores the draft and emits saved', () async {
    await cubit.load();
    cubit.updateGrams(sampleBread.id, 50);

    await cubit.save();

    expect(cubit.state.status, ConsumptionStatus.saved);
    verify(() => foodLog.replaceGrams({sampleMilk.id: 200, sampleBread.id: 50}))
        .called(1);
  });

  test('reset clears the log and the draft and stays ready', () async {
    await cubit.load();

    await cubit.reset();

    expect(cubit.state.status, ConsumptionStatus.ready);
    expect(cubit.state.gramsOf(sampleMilk.id), 0);
    expect(cubit.state.consumedIngredients, isEmpty);
    verify(() => foodLog.clear()).called(1);
  });

  test('save emits failure when storing throws', () async {
    when(() => foodLog.replaceGrams(any())).thenThrow(Exception('db'));
    await cubit.load();

    await cubit.save();

    expect(cubit.state.status, ConsumptionStatus.failure);
  });
}
