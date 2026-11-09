import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/core/widgets/search_field.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/consumption_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/consumption_state.dart';
import 'package:macro_cal_public/features/today/presentation/pages/consumption_view.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/amount_row.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_ingredients.dart';

class _MockConsumptionCubit extends Mock implements ConsumptionCubit;

void main() {
  late ConsumptionCubit cubit;
  late CubitStub<ConsumptionState> stub;

  const ready = ConsumptionState(
    status: ConsumptionStatus.ready,
    ingredients: [sampleMilk, sampleBread],
    grams: {1: 200},
    consumedIds: [1],
  );

  setUp(() {
    cubit = _MockConsumptionCubit();
    stub = CubitStub(cubit, ready);
    when(cubit.save).thenAnswer((_) async {});
    when(cubit.reset).thenAnswer((_) async {});
  });

  Future<void> pumpView(WidgetTester tester) => pumpLocalized(
    tester,
    router: GoRouter(
      initialLocation: AppRoutes.consumption,
      routes: [
        GoRoute(
          path: AppRoutes.today,
          builder: (_, _) => const Text('overview screen'),
          routes: [
            GoRoute(
              path: 'consumption',
              builder: (_, _) => BlocProvider.value(
                value: cubit,
                child: const ConsumptionView(),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  testWidgets('lists every ingredient with its grams', (tester) async {
    await pumpView(tester);

    expect(find.byType(AmountRow), findsNWidgets(2));
    expect(find.text('200'), findsOneWidget);
  });

  testWidgets('typing grams updates the draft', (tester) async {
    await pumpView(tester);

    await tester.enterText(find.byType(TextField).last, '150');

    verify(() => cubit.updateGrams(2, 150)).called(1);
  });

  testWidgets('search filters on the all foods tab', (tester) async {
    await pumpView(tester);

    await tester.tap(find.byIcon(Icons.search_rounded));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(SearchField), 'bread');

    verify(() => cubit.search('bread')).called(1);
  });

  testWidgets('the consumed tab refreshes and shows the empty state', (
    tester,
  ) async {
    await pumpView(tester);
    stub.emit(ready.copyWith(consumedIds: const []));

    await tester.tap(find.text('Consumed'));
    await tester.pumpAndSettle();

    verify(cubit.refreshConsumed).called(greaterThanOrEqualTo(1));
    expect(find.text('This page is empty.'), findsOneWidget);
  });

  testWidgets('reset asks first, then zeroes the fields', (tester) async {
    await pumpView(tester);

    await tester.tap(find.text('Reset Values'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();

    verify(cubit.reset).called(1);
    expect(find.text('200'), findsNothing);
  });

  testWidgets('a saved draft returns to the overview', (tester) async {
    await pumpView(tester);

    await tester.tap(find.text('Save Changes'));
    verify(cubit.save).called(1);

    stub.emit(ready.copyWith(status: ConsumptionStatus.saved));
    await tester.pumpAndSettle();
    expect(find.text('overview screen'), findsOneWidget);
  });
}
