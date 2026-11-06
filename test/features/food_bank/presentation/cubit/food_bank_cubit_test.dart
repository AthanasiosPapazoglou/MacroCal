import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_ingredients.dart';

class _MockIngredientRepository extends Mock implements IngredientRepository;

void main() {
  late StreamController<List<Ingredient>> ingredients;
  late IngredientRepository repository;
  late FoodBankCubit cubit;

  setUp(() {
    ingredients = StreamController<List<Ingredient>>.broadcast();
    repository = _MockIngredientRepository();
    when(() => repository.watchIngredients())
        .thenAnswer((_) => ingredients.stream);
    cubit = FoodBankCubit(repository);
  });
  tearDown(() async {
    await cubit.close();
    await ingredients.close();
  });

  Future<void> loadSamples() async {
    cubit.watch();
    ingredients.add(const [sampleMilk, sampleBread]);
    await cubit.stream.first;
  }

  test('watch follows the stored ingredients', () async {
    await loadSamples();

    expect(cubit.state.status, FoodBankStatus.ready);
    expect(cubit.state.visibleIngredients, [sampleMilk, sampleBread]);
    expect(cubit.state.isFiltering, isFalse);
  });

  test('search filters by name, ignoring case', () async {
    await loadSamples();

    cubit.search('BREAD');

    expect(cubit.state.isFiltering, isTrue);
    expect(cubit.state.visibleIngredients, [sampleBread]);
  });

  test('an empty search shows everything again', () async {
    await loadSamples();
    cubit
      ..search('milk')
      ..search('');

    expect(cubit.state.visibleIngredients, [sampleMilk, sampleBread]);
  });

  test('watch emits failure when the stream errors', () async {
    final emitted = expectLater(
      cubit.stream.map((state) => state.status),
      emits(FoodBankStatus.failure),
    );

    cubit.watch();
    ingredients.addError(Exception('db'));

    await emitted;
  });
}
