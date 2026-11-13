import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_details_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_details_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/recipe_details_view.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/nutrient_row.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_recipes.dart';

class _MockRecipeDetailsCubit extends Mock implements RecipeDetailsCubit;

void main() {
  late RecipeDetailsCubit cubit;
  late CubitStub<RecipeDetailsState> stub;

  const ready = RecipeDetailsState(
    status: RecipeDetailsStatus.ready,
    recipe: sampleMilkToast,
  );

  setUp(() {
    cubit = _MockRecipeDetailsCubit();
    stub = CubitStub(cubit, ready);
    when(cubit.delete).thenAnswer((_) async {});
  });

  Future<void> pumpView(WidgetTester tester) => pumpLocalized(
    tester,
    router: GoRouter(
      initialLocation: AppRoutes.recipe(1),
      routes: [
        GoRoute(
          path: AppRoutes.foods,
          builder: (_, _) => const Text('food bank'),
          routes: [
            GoRoute(
              path: 'recipes/:id',
              builder: (_, _) => BlocProvider.value(
                value: cubit,
                child: const RecipeDetailsView(),
              ),
              routes: [
                GoRoute(
                  path: 'edit',
                  builder: (_, state) =>
                      Text('edit ${state.pathParameters['id']}'),
                ),
                GoRoute(
                  path: 'nutrient/:kind',
                  builder: (_, state) =>
                      Text('nutrient ${state.pathParameters['kind']}'),
                ),
              ],
            ),
            GoRoute(
              path: ':id',
              builder: (_, state) =>
                  Text('ingredient ${state.pathParameters['id']}'),
            ),
          ],
        ),
      ],
    ),
  );

  testWidgets('shows the ingredients, the whole recipe and each nutrient', (
    tester,
  ) async {
    await pumpView(tester);

    expect(find.text('Milk Toast'), findsOneWidget);
    expect(find.text('Milk 1.5%'), findsOneWidget);
    expect(find.text('200 gr.'), findsOneWidget);
    expect(find.text('Whole Bread'), findsOneWidget);
    expect(find.text('100 gr.'), findsOneWidget);
    expect(find.text('Whole recipe: 300 gr., 340 kcal'), findsOneWidget);
    expect(find.text('113.3'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('Salt'), 100);

    expect(
      find.descendant(
        of: find.widgetWithText(NutrientRow, 'Salt'),
        matching: find.text('400.0'),
      ),
      findsOneWidget,
    );
  });

  testWidgets('a final weight shows beside the ingredients weight', (
    tester,
  ) async {
    stub.emit(ready.copyWith(recipe: sampleWarmMilk));
    await pumpView(tester);

    expect(
      find.text('Whole recipe: 240 gr. (ingredients 250 gr.), 113 kcal'),
      findsOneWidget,
    );
  });

  testWidgets('a final weight equal to the ingredients weight shows once', (
    tester,
  ) async {
    stub.emit(
      ready.copyWith(recipe: sampleMilkToast.copyWith(finalWeightGrams: 300)),
    );
    await pumpView(tester);

    expect(find.text('Whole recipe: 300 gr., 340 kcal'), findsOneWidget);
  });

  for (final (label, target, page) in [
    ('an ingredient', find.text('Whole Bread'), 'ingredient 2'),
    ('a nutrient', find.text('Calories'), 'nutrient calories'),
    ('edit', find.textContaining('Edit'), 'edit 1'),
  ]) {
    testWidgets('tapping $label opens its page', (tester) async {
      await pumpView(tester);

      await tester.tap(target);
      await tester.pumpAndSettle();

      expect(find.text(page), findsOneWidget);
    });
  }

  testWidgets('delete asks first, then a deleted recipe returns', (
    tester,
  ) async {
    await pumpView(tester);

    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();
    expect(
      find.text('Are you sure you wish to delete this recipe?'),
      findsOneWidget,
    );
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();
    verify(cubit.delete).called(1);

    stub.emit(ready.copyWith(status: RecipeDetailsStatus.deleted));
    await tester.pumpAndSettle();

    expect(find.text('food bank'), findsOneWidget);
  });
}
