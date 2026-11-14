import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/product_info.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/product_lookup_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_field.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_state.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_ingredients.dart';

class _MockIngredientRepository extends Mock implements IngredientRepository;

class _MockProductLookupRepository extends Mock
    implements ProductLookupRepository;

class _MockSettingsRepository extends Mock implements SettingsRepository;

void main() {
  late IngredientRepository ingredients;
  late ProductLookupRepository lookup;
  late SettingsRepository settings;

  const formInput = {
    IngredientField.referenceGrams: '40',
    IngredientField.name: 'Oats',
    IngredientField.category: '',
    IngredientField.kcal: '389',
    IngredientField.fatG: '6.9',
    IngredientField.saturatedG: '1.2',
    IngredientField.carbsG: '66.3',
    IngredientField.sugarsG: '1',
    IngredientField.fiberG: 'abc',
    IngredientField.proteinG: '16.9',
    IngredientField.saltG: '0.005',
  };
  const oats = Nutrients(
    kcal: 389,
    proteinG: 16.9,
    carbsG: 66.3,
    sugarsG: 1,
    fatG: 6.9,
    saturatedG: 1.2,
    saltMg: 5,
  );

  setUpAll(() {
    registerFallbackValue(sampleMilk);
    registerFallbackValue(const Nutrients());
  });

  setUp(() {
    ingredients = _MockIngredientRepository();
    lookup = _MockProductLookupRepository();
    settings = _MockSettingsRepository();
    when(settings.watchMicrocalEnabled).thenAnswer((_) => Stream.value(false));
    when(
      () => ingredients.addIngredient(
        name: any(named: 'name'),
        per100g: any(named: 'per100g'),
        category: any(named: 'category'),
        referenceGrams: any(named: 'referenceGrams'),
      ),
    ).thenAnswer((_) async => 3);
    when(() => ingredients.updateIngredient(any())).thenAnswer((_) async {});
    when(() => ingredients.watchIngredient(sampleMilk.id))
        .thenAnswer((_) => Stream.value(sampleMilk));
  });

  IngredientFormCubit create({int? ingredientId}) {
    final cubit = IngredientFormCubit(
      ingredients,
      lookup,
      settings,
      ingredientId: ingredientId,
    );
    addTearDown(cubit.close);
    return cubit;
  }

  group('parse and format', () {
    test('parse reads plain decimals and treats anything else as 0', () {
      expect(IngredientField.parse('12.5'), 12.5);
      expect(IngredientField.parse('.5'), 0.5);
      expect(IngredientField.parse(''), 0);
      expect(IngredientField.parse('1,5'), 0);
      expect(IngredientField.parse('-3'), 0);
      expect(IngredientField.parse('.'), 0);
    });

    test('parseOptional leaves empty and invalid input unknown', () {
      expect(IngredientField.parseOptional('0'), 0);
      expect(IngredientField.parseOptional('2.5'), 2.5);
      expect(IngredientField.parseOptional(''), isNull);
      expect(IngredientField.parseOptional('1,5'), isNull);
    });

    test('format drops floating point noise', () {
      expect(IngredientField.format(45), '45.0');
      expect(IngredientField.format(0.1 + 0.2), '0.3');
    });
  });

  test('a new form starts with 100 g reference and nothing else', () async {
    final cubit = create();

    await cubit.load();

    expect(cubit.isEdit, isFalse);
    expect(
      cubit.state,
      const IngredientFormState(
        status: IngredientFormStatus.ready,
        values: {IngredientField.referenceGrams: '100'},
      ),
    );
  });

  test('the form shows micronutrients when tracking is on', () async {
    when(settings.watchMicrocalEnabled).thenAnswer((_) => Stream.value(true));
    final cubit = create();

    await cubit.load();

    expect(cubit.state.showMicros, isTrue);
  });

  test('editing prefills the known micronutrients', () async {
    final milk = sampleMilk.copyWith(
      per100g: sampleMilk.per100g.copyWith(
        micros: const Micronutrients(
          amounts: {Micronutrient.calcium: 120, Micronutrient.iodine: 0},
        ),
      ),
    );
    when(() => ingredients.watchIngredient(milk.id))
        .thenAnswer((_) => Stream.value(milk));
    final cubit = create(ingredientId: milk.id);

    await cubit.load();

    expect(cubit.state.microValues, {
      Micronutrient.calcium: '120.0',
      Micronutrient.iodine: '0.0',
    });
  });

  test('editing prefills every field, with salt in grams', () async {
    final cubit = create(ingredientId: sampleMilk.id);

    await cubit.load();

    expect(cubit.isEdit, isTrue);
    expect(cubit.state.values, {
      IngredientField.referenceGrams: '100.0',
      IngredientField.name: 'Milk 1.5%',
      IngredientField.category: 'Dairy',
      IngredientField.kcal: '45.0',
      IngredientField.fatG: '1.5',
      IngredientField.saturatedG: '1.0',
      IngredientField.carbsG: '4.5',
      IngredientField.sugarsG: '4.5',
      IngredientField.fiberG: '0.0',
      IngredientField.proteinG: '3.2',
      IngredientField.saltG: '0.05',
    });
  });

  test('saving a new ingredient parses the input', () async {
    final cubit = create();
    await cubit.load();

    await cubit.save(formInput);

    expect(cubit.state.status, IngredientFormStatus.saved);
    verify(
      () => ingredients.addIngredient(
        name: 'Oats',
        per100g: oats,
        referenceGrams: 40,
      ),
    ).called(1);
  });

  test(
    'saving keeps given micronutrients and leaves the rest unknown',
    () async {
      final cubit = create();
      await cubit.load();

      await cubit.save(
        formInput,
        micros: {
          Micronutrient.iron: '4.7',
          Micronutrient.zinc: '0',
          Micronutrient.vitaminC: '',
          Micronutrient.iodine: 'abc',
        },
      );

      verify(
        () => ingredients.addIngredient(
          name: 'Oats',
          per100g: oats.copyWith(
            micros: const Micronutrients(
              amounts: {Micronutrient.iron: 4.7, Micronutrient.zinc: 0},
            ),
          ),
          referenceGrams: 40,
        ),
      ).called(1);
    },
  );

  test('saving an edit keeps the id and updates the ingredient', () async {
    final cubit = create(ingredientId: sampleMilk.id);
    await cubit.load();

    await cubit.save({...formInput, IngredientField.category: 'Cereals'});

    verify(
      () => ingredients.updateIngredient(
        Ingredient(
          id: sampleMilk.id,
          name: 'Oats',
          category: 'Cereals',
          referenceGrams: 40,
          per100g: oats,
        ),
      ),
    ).called(1);
  });

  test('saving without a name is rejected', () async {
    final cubit = create();
    await cubit.load();

    await cubit.save({...formInput, IngredientField.name: '  '});

    expect(cubit.state.status, IngredientFormStatus.invalid);
    verifyNever(
      () => ingredients.addIngredient(
        name: any(named: 'name'),
        per100g: any(named: 'per100g'),
      ),
    );
  });

  test('a found barcode fills the scanned fields', () async {
    when(() => lookup.lookup('123')).thenAnswer(
      (_) async => const ProductInfo(
        name: 'Sample Yogurt',
        per100g: Nutrients(
          kcal: 72,
          proteinG: 10,
          saltMg: 120,
          micros: Micronutrients(amounts: {Micronutrient.calcium: 110}),
        ),
      ),
    );
    final cubit = create();
    await cubit.load();

    await cubit.lookUpBarcode('123');

    expect(cubit.state.status, IngredientFormStatus.ready);
    expect(cubit.state.lookupOutcome, LookupOutcome.found);
    expect(cubit.state.scannedValues[IngredientField.name], 'Sample Yogurt');
    expect(cubit.state.scannedValues[IngredientField.kcal], '72.0');
    expect(cubit.state.scannedValues[IngredientField.saltG], '0.12');
    expect(
      cubit.state.scannedValues,
      isNot(contains(IngredientField.category)),
    );
    expect(cubit.state.scannedMicroValues, {Micronutrient.calcium: '110.0'});
  });

  test('an unknown barcode reports notFound', () async {
    when(() => lookup.lookup('000')).thenAnswer((_) async => null);
    final cubit = create();
    await cubit.load();

    await cubit.lookUpBarcode('000');

    expect(cubit.state.lookupOutcome, LookupOutcome.notFound);
    expect(cubit.state.scannedValues, isEmpty);
  });
}
