import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity_entry.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/exercise_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/exercise_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockActivityRepository extends Mock implements ActivityRepository;

void main() {
  late ActivityRepository repository;
  late ExerciseCubit cubit;

  const walking = Activity(
    id: 1,
    name: 'Walking',
    kcalPerUnit: 50,
    unitLabel: 'Kilometers',
  );
  const cycling = Activity(
    id: 2,
    name: 'Cycling',
    kcalPerUnit: 8,
    unitLabel: 'Minutes',
  );
  const stored = [
    ActivityEntry(activity: walking, amount: 2),
    ActivityEntry(activity: cycling, amount: 0),
  ];

  setUp(() {
    repository = _MockActivityRepository();
    when(() => repository.watchEntries())
        .thenAnswer((_) => Stream.value(stored));
    when(() => repository.replaceAmounts(any())).thenAnswer((_) async {});
    when(() => repository.resetAmounts()).thenAnswer((_) async {});
    cubit = ExerciseCubit(repository);
  });
  tearDown(() => cubit.close());

  test('load emits the stored amounts', () async {
    await cubit.load();

    expect(
      cubit.state,
      const ExerciseState(status: ExerciseStatus.ready, entries: stored),
    );
  });

  test('load emits failure when the repository throws', () async {
    when(() => repository.watchEntries())
        .thenAnswer((_) => Stream.error(Exception('db')));

    await cubit.load();

    expect(cubit.state.status, ExerciseStatus.failure);
  });

  test('updateAmount changes only the draft', () async {
    await cubit.load();

    cubit.updateAmount(cycling.id, 30);

    expect(cubit.state.entries.map((entry) => entry.amount), [2, 30]);
    verifyNever(() => repository.replaceAmounts(any()));
  });

  test('save stores the draft and emits saved', () async {
    await cubit.load();
    cubit.updateAmount(walking.id, 5);

    await cubit.save();

    expect(cubit.state.status, ExerciseStatus.saved);
    verify(() => repository.replaceAmounts({walking.id: 5, cycling.id: 0}))
        .called(1);
  });

  test('save emits failure when storing throws', () async {
    when(() => repository.replaceAmounts(any())).thenThrow(Exception('db'));
    await cubit.load();

    await cubit.save();

    expect(cubit.state.status, ExerciseStatus.failure);
  });

  test('reset clears stored and draft amounts and stays ready', () async {
    await cubit.load();
    cubit.updateAmount(cycling.id, 30);

    await cubit.reset();

    expect(cubit.state.status, ExerciseStatus.ready);
    expect(cubit.state.entries.map((entry) => entry.amount), [0, 0]);
    verify(() => repository.resetAmounts()).called(1);
  });
}
