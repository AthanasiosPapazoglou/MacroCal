import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/supplement_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_details_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_details_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_supplements.dart';

class _MockSupplementRepository extends Mock implements SupplementRepository;

void main() {
  late StreamController<Supplement?> supplement;
  late SupplementRepository repository;
  late SupplementDetailsCubit cubit;

  setUp(() {
    supplement = StreamController<Supplement?>.broadcast();
    repository = _MockSupplementRepository();
    when(() => repository.watchSupplement(sampleVitaminD.id))
        .thenAnswer((_) => supplement.stream);
    when(() => repository.deleteSupplement(any())).thenAnswer((_) async {});
    cubit = SupplementDetailsCubit(repository, sampleVitaminD.id);
  });
  tearDown(() async {
    await cubit.close();
    await supplement.close();
  });

  test('watch follows the supplement and reports a missing one', () async {
    final emitted = expectLater(
      cubit.stream,
      emitsInOrder([
        const SupplementDetailsState(
          status: SupplementDetailsStatus.ready,
          supplement: sampleVitaminD,
        ),
        const SupplementDetailsState(status: SupplementDetailsStatus.notFound),
      ]),
    );

    cubit.watch();
    supplement
      ..add(sampleVitaminD)
      ..add(null);

    await emitted;
  });

  test('delete removes it and stays deleted', () async {
    cubit.watch();

    await cubit.delete();
    supplement.add(null);
    await Future<void>.delayed(Duration.zero);

    expect(cubit.state.status, SupplementDetailsStatus.deleted);
    verify(() => repository.deleteSupplement(sampleVitaminD.id)).called(1);
  });

  test('a failed delete reports failure', () async {
    when(() => repository.deleteSupplement(any())).thenThrow(Exception('db'));

    await cubit.delete();

    expect(cubit.state.status, SupplementDetailsStatus.failure);
  });
}
