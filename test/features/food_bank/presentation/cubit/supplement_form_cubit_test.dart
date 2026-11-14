import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/supplement_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_form_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_supplements.dart';

class _MockSupplementRepository extends Mock implements SupplementRepository;

void main() {
  late SupplementRepository repository;

  setUpAll(() {
    registerFallbackValue(sampleVitaminD);
    registerFallbackValue(SupplementUnit.tablet);
    registerFallbackValue(const Micronutrients());
  });

  setUp(() {
    repository = _MockSupplementRepository();
    when(
      () => repository.addSupplement(
        name: any(named: 'name'),
        unit: any(named: 'unit'),
        microsPerUnit: any(named: 'microsPerUnit'),
      ),
    ).thenAnswer((_) async => 3);
    when(() => repository.updateSupplement(any())).thenAnswer((_) async {});
    when(() => repository.watchSupplement(sampleMultivitamin.id))
        .thenAnswer((_) => Stream.value(sampleMultivitamin));
  });

  SupplementFormCubit create({int? supplementId}) {
    final cubit = SupplementFormCubit(repository, supplementId: supplementId);
    addTearDown(cubit.close);
    return cubit;
  }

  test('a new form starts empty with tablets', () async {
    final cubit = create();

    await cubit.load();

    expect(cubit.isEdit, isFalse);
    expect(
      cubit.state,
      const SupplementFormState(status: SupplementFormStatus.ready),
    );
  });

  test('editing prefills the name, unit and known amounts', () async {
    final cubit = create(supplementId: sampleMultivitamin.id);

    await cubit.load();

    expect(cubit.isEdit, isTrue);
    expect(cubit.state.name, 'Multivitamin');
    expect(cubit.state.unit, SupplementUnit.tablet);
    expect(cubit.state.microValues, {
      Micronutrient.vitaminC: '80.0',
      Micronutrient.zinc: '10.0',
    });
  });

  test('saving a new supplement keeps the unit and given amounts', () async {
    final cubit = create();
    await cubit.load();
    cubit.selectUnit(SupplementUnit.drop);

    await cubit.save(
      name: ' Vitamin D3 ',
      micros: {
        Micronutrient.vitaminD: '10',
        Micronutrient.iodine: '',
        Micronutrient.zinc: 'x',
      },
    );

    expect(cubit.state.status, SupplementFormStatus.saved);
    verify(
      () => repository.addSupplement(
        name: 'Vitamin D3',
        unit: SupplementUnit.drop,
        microsPerUnit: const Micronutrients(
          amounts: {Micronutrient.vitaminD: 10},
        ),
      ),
    ).called(1);
  });

  test('saving an edit updates the same supplement', () async {
    final cubit = create(supplementId: sampleMultivitamin.id);
    await cubit.load();

    await cubit.save(name: 'Multi', micros: {Micronutrient.vitaminC: '60'});

    verify(
      () => repository.updateSupplement(
        sampleMultivitamin.copyWith(
          name: 'Multi',
          microsPerUnit: const Micronutrients(
            amounts: {Micronutrient.vitaminC: 60},
          ),
        ),
      ),
    ).called(1);
  });

  test('a blank name is rejected', () async {
    final cubit = create();
    await cubit.load();

    await cubit.save(name: '  ', micros: const {});

    expect(cubit.state.status, SupplementFormStatus.invalid);
    verifyNever(
      () => repository.addSupplement(
        name: any(named: 'name'),
        unit: any(named: 'unit'),
        microsPerUnit: any(named: 'microsPerUnit'),
      ),
    );
  });
}
