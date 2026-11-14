import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_details_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_details_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/ingredient_details_view.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/nutrient_row.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_ingredients.dart';

class _MockIngredientDetailsCubit extends Mock
    implements IngredientDetailsCubit;

void main() {
  late IngredientDetailsCubit cubit;
  late CubitStub<IngredientDetailsState> stub;

  const ready = IngredientDetailsState(
    status: IngredientDetailsStatus.ready,
    ingredient: sampleMilk,
  );

  setUp(() {
    cubit = _MockIngredientDetailsCubit();
    stub = CubitStub(cubit, ready);
    when(cubit.delete).thenAnswer((_) async {});
  });

  Future<void> pumpView(WidgetTester tester) => pumpLocalized(
    tester,
    router: GoRouter(
      initialLocation: AppRoutes.ingredient(1),
      routes: [
        GoRoute(
          path: AppRoutes.foods,
          builder: (_, _) => const Text('food bank'),
          routes: [
            GoRoute(
              path: ':id',
              builder: (_, _) => BlocProvider.value(
                value: cubit,
                child: const IngredientDetailsView(),
              ),
              routes: [
                GoRoute(
                  path: 'nutrient/:kind',
                  builder: (_, state) =>
                      Text('nutrient ${state.pathParameters['kind']}'),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );

  testWidgets('shows the ingredient header and a row per nutrient', (
    tester,
  ) async {
    await pumpView(tester);

    expect(find.text('Milk 1.5%'), findsOneWidget);
    expect(find.byType(NutrientRow), findsNWidgets(8));
  });

  testWidgets('micronutrients are hidden while tracking is off', (
    tester,
  ) async {
    await pumpView(tester);

    expect(find.text('Micronutrients per 100 g'), findsNothing);
  });

  testWidgets('tracking on lists micronutrients with unknown as a dash', (
    tester,
  ) async {
    stub.emit(
      ready.copyWith(
        microcalEnabled: true,
        ingredient: sampleMilk.copyWith(
          per100g: sampleMilk.per100g.copyWith(
            micros: const Micronutrients(
              amounts: {
                Micronutrient.calcium: 120,
                Micronutrient.vitaminB12: 0.4,
              },
            ),
          ),
        ),
      ),
    );
    await pumpView(tester);

    expect(find.text('Micronutrients per 100 g'), findsOneWidget);
    expect(find.text('Calcium'), findsOneWidget);
    expect(find.text('120.0 mg'), findsOneWidget);
    expect(find.text('0.4 µg'), findsOneWidget);
    expect(find.text('—'), findsNWidgets(Micronutrient.values.length - 2));
  });

  testWidgets('tapping a nutrient opens its description', (tester) async {
    await pumpView(tester);

    await tester.tap(find.text('Calories'));
    await tester.pumpAndSettle();

    expect(find.text('nutrient calories'), findsOneWidget);
  });

  testWidgets('delete asks first and only deletes on confirm', (tester) async {
    await pumpView(tester);

    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    expect(find.textContaining('these recipes'), findsNothing);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    verifyNever(cubit.delete);

    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();
    verify(cubit.delete).called(1);
  });

  testWidgets('the delete dialog names the recipes that use it', (
    tester,
  ) async {
    stub.emit(ready.copyWith(recipeNames: const ['Milk Toast', 'Warm Milk']));
    await pumpView(tester);

    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    expect(
      find.text(
        'It will also be removed from these recipes: Milk Toast, Warm Milk',
      ),
      findsOneWidget,
    );
  });

  testWidgets('a deleted ingredient returns to the food bank', (tester) async {
    await pumpView(tester);

    stub.emit(ready.copyWith(status: IngredientDetailsStatus.deleted));
    await tester.pumpAndSettle();

    expect(find.text('food bank'), findsOneWidget);
  });
}
