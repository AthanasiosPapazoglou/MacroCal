import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_details_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_details_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/supplement_details_view.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_supplements.dart';

class _MockSupplementDetailsCubit extends Mock
    implements SupplementDetailsCubit;

void main() {
  late SupplementDetailsCubit cubit;
  late CubitStub<SupplementDetailsState> stub;

  const ready = SupplementDetailsState(
    status: SupplementDetailsStatus.ready,
    supplement: sampleVitaminD,
  );

  setUp(() {
    cubit = _MockSupplementDetailsCubit();
    stub = CubitStub(cubit, ready);
    when(cubit.delete).thenAnswer((_) async {});
  });

  Future<void> pumpView(WidgetTester tester) => pumpLocalized(
    tester,
    router: GoRouter(
      initialLocation: AppRoutes.supplement(1),
      routes: [
        GoRoute(
          path: AppRoutes.foods,
          builder: (_, _) => const Text('food bank'),
          routes: [
            GoRoute(
              path: 'supplements/:id',
              builder: (_, _) => BlocProvider.value(
                value: cubit,
                child: const SupplementDetailsView(),
              ),
              routes: [
                GoRoute(
                  path: 'edit',
                  builder: (_, _) => const Text('edit supplement'),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );

  testWidgets('shows the name, the unit and the amounts per unit', (
    tester,
  ) async {
    await pumpView(tester);

    expect(find.text('Vitamin D3'), findsOneWidget);
    expect(find.text('Unit: Drop'), findsOneWidget);
    expect(find.text('Micronutrients per unit'), findsOneWidget);
    expect(find.text('10.0 µg'), findsOneWidget);
  });

  testWidgets('edit opens the form', (tester) async {
    await pumpView(tester);

    await tester.tap(find.text('  Edit  '));
    await tester.pumpAndSettle();

    expect(find.text('edit supplement'), findsOneWidget);
  });

  testWidgets('delete asks first and returns once deleted', (tester) async {
    await pumpView(tester);

    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    expect(
      find.text("Delete this supplement? Today's units of it are removed too."),
      findsOneWidget,
    );
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();
    verify(cubit.delete).called(1);

    stub.emit(ready.copyWith(status: SupplementDetailsStatus.deleted));
    await tester.pumpAndSettle();
    expect(find.text('food bank'), findsOneWidget);
  });
}
