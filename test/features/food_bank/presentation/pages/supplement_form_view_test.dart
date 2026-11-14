import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_form_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/supplement_form_view.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';

class _MockSupplementFormCubit extends Mock implements SupplementFormCubit;

void main() {
  late SupplementFormCubit cubit;
  late CubitStub<SupplementFormState> stub;

  const ready = SupplementFormState(status: SupplementFormStatus.ready);

  setUpAll(() => registerFallbackValue(<Micronutrient, String>{}));

  setUp(() {
    cubit = _MockSupplementFormCubit();
    stub = CubitStub(cubit, ready);
    when(() => cubit.isEdit).thenReturn(false);
    when(
      () => cubit.save(
        name: any(named: 'name'),
        micros: any(named: 'micros'),
      ),
    ).thenAnswer((_) async {});
  });

  Future<void> pumpView(WidgetTester tester) => pumpLocalized(
    tester,
    router: GoRouter(
      initialLocation: '/new',
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => const Text('food bank'),
          routes: [
            GoRoute(
              path: 'new',
              builder: (_, _) => BlocProvider.value(
                value: cubit,
                child: const SupplementFormView(),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  testWidgets('shows every unit and the fields per unit', (tester) async {
    await pumpView(tester);

    expect(find.text('Add Supplement'), findsOneWidget);
    expect(
      find.byType(ChoiceChip),
      findsNWidgets(SupplementUnit.values.length),
    );
    expect(find.text('Micronutrients per unit'), findsOneWidget);
    expect(find.text('Vitamin A (µg)'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Iodine (µg)'),
      300,
      scrollable: find
          .descendant(
            of: find.byType(ListView),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    expect(find.text('Iodine (µg)'), findsOneWidget);
  });

  testWidgets('choosing a unit tells the cubit', (tester) async {
    await pumpView(tester);

    await tester.tap(find.text('Drop'));

    verify(() => cubit.selectUnit(SupplementUnit.drop)).called(1);
  });

  testWidgets('a missing name is not saved', (tester) async {
    await pumpView(tester);

    await tester.tap(find.text('Save'));
    await tester.pump();

    expect(find.text('Enter a product name'), findsOneWidget);
    verifyNever(
      () => cubit.save(
        name: any(named: 'name'),
        micros: any(named: 'micros'),
      ),
    );
  });

  testWidgets('save sends the name and the amounts', (tester) async {
    stub.emit(
      ready.copyWith(microValues: const {Micronutrient.vitaminD: '25.0'}),
    );
    await pumpView(tester);

    await tester.enterText(find.byType(TextFormField).first, 'Vitamin D3');
    await tester.tap(find.text('Save'));
    await tester.pump();

    final captured = verify(
      () => cubit.save(
        name: captureAny(named: 'name'),
        micros: captureAny(named: 'micros'),
      ),
    ).captured;
    expect(captured.first, 'Vitamin D3');
    expect(
      captured.last as Map<Micronutrient, String>,
      allOf(
        containsPair(Micronutrient.vitaminD, '25.0'),
        containsPair(Micronutrient.zinc, ''),
      ),
    );
  });

  testWidgets('a saved supplement returns to the food bank', (tester) async {
    await pumpView(tester);

    stub.emit(ready.copyWith(status: SupplementFormStatus.saved));
    await tester.pumpAndSettle();

    expect(find.text('food bank'), findsOneWidget);
  });
}
