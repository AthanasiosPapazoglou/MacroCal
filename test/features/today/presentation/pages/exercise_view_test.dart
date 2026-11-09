import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity_entry.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/exercise_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/exercise_state.dart';
import 'package:macro_cal_public/features/today/presentation/pages/exercise_view.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';

class _MockExerciseCubit extends Mock implements ExerciseCubit;

void main() {
  late ExerciseCubit cubit;
  late CubitStub<ExerciseState> stub;

  const walking = Activity(
    id: 1,
    name: 'walking',
    kcalPerUnit: 60,
    unitLabel: 'km',
    presetKey: 'walking',
  );
  const ready = ExerciseState(
    status: ExerciseStatus.ready,
    entries: [ActivityEntry(activity: walking, amount: 3)],
  );

  setUp(() {
    cubit = _MockExerciseCubit();
    stub = CubitStub(cubit, ready);
    when(cubit.save).thenAnswer((_) async {});
    when(cubit.reset).thenAnswer((_) async {});
  });

  Future<void> pumpView(WidgetTester tester) => pumpLocalized(
    tester,
    router: GoRouter(
      initialLocation: AppRoutes.exercise,
      routes: [
        GoRoute(
          path: AppRoutes.today,
          builder: (_, _) => const Text('overview screen'),
          routes: [
            GoRoute(
              path: 'exercise',
              builder: (_, _) =>
                  BlocProvider.value(value: cubit, child: const ExerciseView()),
            ),
          ],
        ),
      ],
    ),
  );

  testWidgets('shows each activity with its translated name and amount', (
    tester,
  ) async {
    await pumpView(tester);

    expect(find.text('Walking'), findsOneWidget);
    expect(find.text('Kilometers'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
  });

  testWidgets('typing an amount updates the draft', (tester) async {
    await pumpView(tester);

    await tester.enterText(find.byType(TextField), '12');

    verify(() => cubit.updateAmount(1, 12)).called(1);
  });

  testWidgets('reset asks first, then clears the fields', (tester) async {
    await pumpView(tester);

    await tester.tap(find.text('Reset Values'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    verifyNever(cubit.reset);

    await tester.tap(find.text('Reset Values'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();
    verify(cubit.reset).called(1);
    expect(find.text('0'), findsOneWidget);
  });

  testWidgets('a saved draft returns to the overview', (tester) async {
    await pumpView(tester);

    await tester.tap(find.text('Save Changes'));
    verify(cubit.save).called(1);

    stub.emit(ready.copyWith(status: ExerciseStatus.saved));
    await tester.pumpAndSettle();
    expect(find.text('overview screen'), findsOneWidget);
  });
}
