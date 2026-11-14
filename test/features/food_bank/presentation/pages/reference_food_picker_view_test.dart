import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/reference_food.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/reference_food_picker_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/reference_food_picker_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/reference_food_picker_view.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_reference_foods.dart';

class _MockReferenceFoodPickerCubit extends Mock
    implements ReferenceFoodPickerCubit;

void main() {
  late ReferenceFoodPickerCubit cubit;
  late CubitStub<ReferenceFoodPickerState> stub;
  ReferenceFood? picked;

  const ready = ReferenceFoodPickerState(
    status: ReferenceFoodPickerStatus.ready,
    results: [referenceApple, referenceFeta],
  );

  setUp(() {
    picked = null;
    cubit = _MockReferenceFoodPickerCubit();
    stub = CubitStub(cubit, ready);
  });

  Future<void> pumpView(
    WidgetTester tester, {
    Locale locale = const Locale('en'),
  }) =>
      pumpLocalized(
        tester,
        locale: locale,
        router: GoRouter(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, _) => TextButton(
                onPressed: () async =>
                    picked = await context.push<ReferenceFood>('/pick'),
                child: const Text('open'),
              ),
              routes: [
                GoRoute(
                  path: 'pick',
                  builder: (_, _) => BlocProvider.value(
                    value: cubit,
                    child: const ReferenceFoodPickerView(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ).then((_) async {
        await tester.tap(find.text('open'));
        await tester.pumpAndSettle();
      });

  testWidgets('lists the foods in English with their calories', (tester) async {
    await pumpView(tester);

    expect(find.text('Apple, flesh and skin, raw'), findsOneWidget);
    expect(find.text('53.0 kcal / 100 g'), findsOneWidget);
    expect(find.text('Source: ANSES-CIQUAL 2025'), findsOneWidget);
  });

  testWidgets('shows the Greek names in Greek', (tester) async {
    await pumpView(tester, locale: const Locale('el'));

    expect(find.text('Μήλο, με φλούδα, ωμό'), findsOneWidget);
    expect(find.text('Πηγή: ANSES-CIQUAL 2025'), findsOneWidget);
  });

  testWidgets('typing searches', (tester) async {
    await pumpView(tester);

    await tester.enterText(find.byType(TextField), 'φετα');

    verify(() => cubit.search('φετα')).called(1);
  });

  testWidgets('tapping a food returns it', (tester) async {
    await pumpView(tester);

    await tester.tap(
      find.text("Feta or Feta-type cheese, 100% from ewe's milk"),
    );
    await tester.pumpAndSettle();

    expect(picked, referenceFeta);
  });

  testWidgets('says when nothing matches or loading failed', (tester) async {
    await pumpView(tester);

    stub.emit(ready.copyWith(results: const []));
    await tester.pump();
    await tester.pump();
    expect(find.text('No matching foods'), findsOneWidget);

    stub.emit(
      const ReferenceFoodPickerState(status: ReferenceFoodPickerStatus.failure),
    );
    await tester.pump();
    await tester.pump();
    expect(
      find.text('The reference foods could not be loaded'),
      findsOneWidget,
    );
  });
}
