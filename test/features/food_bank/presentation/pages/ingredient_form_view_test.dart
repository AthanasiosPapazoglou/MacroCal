import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_field.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/ingredient_form_view.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/scan_barcode_button.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';

class _MockIngredientFormCubit extends Mock implements IngredientFormCubit;

void main() {
  late IngredientFormCubit cubit;
  late CubitStub<IngredientFormState> stub;

  const ready = IngredientFormState(
    status: IngredientFormStatus.ready,
    values: {IngredientField.referenceGrams: '100'},
  );

  setUpAll(() {
    registerFallbackValue(<IngredientField, String>{});
    registerFallbackValue(<Micronutrient, String>{});
  });

  setUp(() {
    cubit = _MockIngredientFormCubit();
    stub = CubitStub(cubit, ready);
    when(() => cubit.isEdit).thenReturn(false);
    when(() => cubit.save(any(), micros: any(named: 'micros')))
        .thenAnswer((_) async {});
  });

  Future<void> pumpView(WidgetTester tester) => pumpLocalized(
    tester,
    router: GoRouter(
      initialLocation: AppRoutes.newIngredient,
      routes: [
        GoRoute(
          path: AppRoutes.foods,
          builder: (_, _) => const Text('food bank'),
          routes: [
            GoRoute(
              path: 'new',
              builder: (_, _) => BlocProvider.value(
                value: cubit,
                child: const IngredientFormView(),
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Finder field(IngredientField field) =>
      find.byType(TextFormField).at(field.index);

  testWidgets('adding shows the scan button, editing hides it', (tester) async {
    await pumpView(tester);
    expect(find.text('Add Ingredient'), findsOneWidget);
    expect(find.byType(ScanBarcodeButton), findsOneWidget);

    when(() => cubit.isEdit).thenReturn(true);
    await pumpView(tester);
    expect(find.text('Edit Ingredient'), findsOneWidget);
    expect(find.byType(ScanBarcodeButton), findsNothing);
  });

  testWidgets('a missing name shows an error and is not saved', (tester) async {
    await pumpView(tester);

    await tester.tap(find.text('Save'));
    await tester.pump();

    expect(find.text('Enter a product name'), findsOneWidget);
    verifyNever(() => cubit.save(any(), micros: any(named: 'micros')));
  });

  testWidgets('save sends the texts and an empty category when untouched', (
    tester,
  ) async {
    await pumpView(tester);
    expect(find.text('Uncategorised'), findsOneWidget);

    await tester.enterText(field(IngredientField.name), 'Oats');
    await tester.tap(find.text('Save'));
    await tester.pump();

    final input =
        verify(() => cubit.save(captureAny(), micros: any(named: 'micros')))
                .captured
                .single
            as Map<IngredientField, String>;
    expect(input[IngredientField.name], 'Oats');
    expect(input[IngredientField.category], '');
    expect(input[IngredientField.referenceGrams], '100');
  });

  Future<void> openMicros(WidgetTester tester) async {
    final title = find.text('Micronutrients per 100 g');
    await tester.ensureVisible(title);
    await tester.tap(title);
    await tester.pumpAndSettle();
  }

  testWidgets('micronutrients are hidden while tracking is off', (
    tester,
  ) async {
    await pumpView(tester);

    expect(find.text('Micronutrients per 100 g'), findsNothing);
  });

  testWidgets('the collapsed micronutrient section opens and saves', (
    tester,
  ) async {
    stub.emit(
      ready.copyWith(
        showMicros: true,
        microValues: {Micronutrient.calcium: '120'},
      ),
    );
    await pumpView(tester);
    expect(find.text('Vitamin C (mg)'), findsNothing);

    await openMicros(tester);
    final vitaminC = find.widgetWithText(TextFormField, 'Vitamin C (mg)');
    await tester.ensureVisible(vitaminC);
    await tester.enterText(vitaminC, '12');
    await tester.enterText(field(IngredientField.name), 'Oats');
    await tester.ensureVisible(find.text('Save'));
    await tester.tap(find.text('Save'));
    await tester.pump();

    final micros =
        verify(() => cubit.save(any(), micros: captureAny(named: 'micros')))
                .captured
                .single
            as Map<Micronutrient, String>;
    expect(micros[Micronutrient.calcium], '120');
    expect(micros[Micronutrient.vitaminC], '12');
    expect(micros[Micronutrient.iron], '');
  });

  testWidgets('a found product replaces the micronutrients', (tester) async {
    final withMicros = ready.copyWith(
      showMicros: true,
      microValues: {Micronutrient.iron: '4.4'},
    );
    stub.emit(withMicros);
    await pumpView(tester);

    stub
      ..emit(withMicros.copyWith(status: IngredientFormStatus.lookingUp))
      ..emit(
        withMicros.copyWith(
          lookupOutcome: LookupOutcome.found,
          scannedMicroValues: {Micronutrient.calcium: '110'},
        ),
      );
    await tester.pump();
    await tester.pump();
    await openMicros(tester);

    expect(find.text('110'), findsOneWidget);
    expect(find.text('4.4'), findsNothing);
  });

  testWidgets('a found product fills the form and says so', (tester) async {
    await pumpView(tester);

    stub
      ..emit(ready.copyWith(status: IngredientFormStatus.lookingUp))
      ..emit(
        ready.copyWith(
          lookupOutcome: LookupOutcome.found,
          scannedValues: {
            IngredientField.name: 'Scanned Oats',
            IngredientField.kcal: '370',
          },
        ),
      );
    await tester.pump();
    await tester.pump();

    expect(find.text('Scanned Oats'), findsOneWidget);
    expect(find.text('370'), findsOneWidget);
    expect(
      find.text('Product found, its values have been filled in'),
      findsOneWidget,
    );
  });

  testWidgets('a missing product shows the not found message', (tester) async {
    await pumpView(tester);

    stub
      ..emit(ready.copyWith(status: IngredientFormStatus.lookingUp))
      ..emit(ready.copyWith(lookupOutcome: LookupOutcome.notFound));
    await tester.pump();
    await tester.pump();

    expect(
      find.text(
        'No product found or there has been an error in the connection',
      ),
      findsOneWidget,
    );
  });

  testWidgets('a saved ingredient returns to the food bank', (tester) async {
    await pumpView(tester);

    stub.emit(ready.copyWith(status: IngredientFormStatus.saved));
    await tester.pumpAndSettle();

    expect(find.text('food bank'), findsOneWidget);
  });
}
