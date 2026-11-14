import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/reference_food_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/reference_food_picker_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/reference_food_picker_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_reference_foods.dart';

class _MockReferenceFoodRepository extends Mock
    implements ReferenceFoodRepository;

void main() {
  late ReferenceFoodRepository repository;
  late ReferenceFoodPickerCubit cubit;

  setUp(() {
    repository = _MockReferenceFoodRepository();
    cubit = ReferenceFoodPickerCubit(repository);
  });
  tearDown(() => cubit.close());

  test('load lists every food', () async {
    when(repository.loadAll)
        .thenAnswer((_) async => const [referenceApple, referenceFeta]);

    await cubit.load();

    expect(
      cubit.state,
      const ReferenceFoodPickerState(
        status: ReferenceFoodPickerStatus.ready,
        results: [referenceApple, referenceFeta],
      ),
    );
  });

  test('search narrows the results', () async {
    when(repository.loadAll)
        .thenAnswer((_) async => const [referenceApple, referenceFeta]);
    await cubit.load();

    cubit.search('φετα');

    expect(cubit.state.query, 'φετα');
    expect(cubit.state.results, [referenceFeta]);
  });

  test('a failed load reports failure', () async {
    when(repository.loadAll).thenThrow(Exception('missing asset'));

    await cubit.load();

    expect(cubit.state.status, ReferenceFoodPickerStatus.failure);
  });
}
