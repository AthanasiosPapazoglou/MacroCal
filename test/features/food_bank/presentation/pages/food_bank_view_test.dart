import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/core/widgets/search_field.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/food_kind.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/food_bank_view.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/food_tile.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_ingredients.dart';
import '../../../../helpers/sample_recipes.dart';
import '../../../../helpers/sample_supplements.dart';

class _MockFoodBankCubit extends Mock implements FoodBankCubit;

void main() {
  late FoodBankCubit cubit;

  const ready = FoodBankState(
    status: FoodBankStatus.ready,
    ingredients: [sampleMilk, sampleBread],
  );

  setUp(() => cubit = _MockFoodBankCubit());

  Future<void> pumpView(WidgetTester tester, FoodBankState state) {
    CubitStub(cubit, state);
    return pumpLocalized(
      tester,
      router: GoRouter(
        initialLocation: AppRoutes.foods,
        routes: [
          GoRoute(
            path: AppRoutes.foods,
            builder: (_, _) =>
                BlocProvider.value(value: cubit, child: const FoodBankView()),
            routes: [
              GoRoute(
                path: 'new',
                builder: (_, _) => const Text('new ingredient'),
              ),
              GoRoute(
                path: 'recipes/new',
                builder: (_, _) => const Text('new recipe'),
              ),
              GoRoute(
                path: 'supplements/new',
                builder: (_, _) => const Text('new supplement'),
              ),
              GoRoute(
                path: 'supplements/:id',
                builder: (_, state) =>
                    Text('supplement ${state.pathParameters['id']}'),
              ),
              GoRoute(
                path: 'recipes/:id',
                builder: (_, state) =>
                    Text('recipe ${state.pathParameters['id']}'),
              ),
              GoRoute(
                path: ':id',
                builder: (_, state) =>
                    Text('details ${state.pathParameters['id']}'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  testWidgets('shows a grid tile per ingredient and switches to a list', (
    tester,
  ) async {
    await pumpView(tester, ready);

    expect(find.byType(FoodTile), findsNWidgets(2));
    expect(find.byType(GridView), findsOneWidget);

    await tester.tap(find.byIcon(Icons.table_rows_rounded));
    await tester.pumpAndSettle();

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(GridView), findsNothing);
  });

  testWidgets('the search button opens a search bar that filters', (
    tester,
  ) async {
    await pumpView(tester, ready);
    expect(find.byType(SearchField), findsNothing);

    await tester.tap(find.byIcon(Icons.search_rounded));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), 'milk');

    expect(find.byType(SearchField), findsOneWidget);
    verify(() => cubit.search('milk')).called(1);
  });

  testWidgets('an empty search result shows the no results message', (
    tester,
  ) async {
    await pumpView(tester, ready.copyWith(query: 'zzz'));

    expect(find.byType(FoodTile), findsNothing);
    expect(
      find.text('No items found matching your search criteria'),
      findsOneWidget,
    );
  });

  testWidgets('tapping a tile opens that ingredient', (tester) async {
    await pumpView(tester, ready);

    await tester.tap(find.text('Whole Bread'));
    await tester.pumpAndSettle();

    expect(find.text('details 2'), findsOneWidget);
  });

  testWidgets('the switch selects the recipes', (tester) async {
    await pumpView(tester, ready);

    await tester.tap(find.text('Recipes'));

    verify(() => cubit.selectKind(FoodKind.recipe)).called(1);
  });

  testWidgets('the supplements side appears only while tracking is on', (
    tester,
  ) async {
    await pumpView(tester, ready);
    expect(find.text('Supplements'), findsNothing);

    await pumpView(tester, ready.copyWith(showSupplements: true));
    await tester.tap(find.text('Supplements'));

    verify(() => cubit.selectKind(FoodKind.supplement)).called(1);
  });

  testWidgets('the supplements side lists them and opens one', (tester) async {
    await pumpView(
      tester,
      ready.copyWith(
        kind: FoodKind.supplement,
        showSupplements: true,
        supplements: const [sampleVitaminD, sampleMultivitamin],
      ),
    );

    expect(find.byIcon(Icons.medication_outlined), findsNWidgets(2));

    await tester.tap(find.text('Multivitamin'));
    await tester.pumpAndSettle();

    expect(find.text('supplement 2'), findsOneWidget);
  });

  testWidgets('without supplements the side says how to add one', (
    tester,
  ) async {
    await pumpView(
      tester,
      ready.copyWith(kind: FoodKind.supplement, showSupplements: true),
    );

    expect(find.text('No supplements yet'), findsOneWidget);
  });

  testWidgets('the recipes side shows a tile with an icon per recipe', (
    tester,
  ) async {
    await pumpView(
      tester,
      ready.copyWith(
        kind: FoodKind.recipe,
        recipes: const [sampleMilkToast, sampleWarmMilk],
      ),
    );

    expect(find.byType(FoodTile), findsNWidgets(2));
    expect(find.text('Milk Toast'), findsOneWidget);
    expect(find.byIcon(Icons.menu_book_rounded), findsNWidgets(2));
    expect(find.text('Whole Bread'), findsNothing);
  });

  testWidgets('tapping a recipe opens it', (tester) async {
    await pumpView(
      tester,
      ready.copyWith(
        kind: FoodKind.recipe,
        recipes: const [sampleMilkToast, sampleWarmMilk],
      ),
    );

    await tester.tap(find.text('Warm Milk'));
    await tester.pumpAndSettle();

    expect(find.text('recipe 2'), findsOneWidget);
  });

  testWidgets('without recipes the recipes side says how to add one', (
    tester,
  ) async {
    await pumpView(tester, ready.copyWith(kind: FoodKind.recipe));

    expect(find.text('No recipes yet'), findsOneWidget);
    expect(find.text('Build one from your ingredients'), findsOneWidget);
  });

  for (final (kind, page) in [
    (FoodKind.ingredient, 'new ingredient'),
    (FoodKind.recipe, 'new recipe'),
    (FoodKind.supplement, 'new supplement'),
  ]) {
    testWidgets('the add button opens the $page form', (tester) async {
      await pumpView(tester, ready.copyWith(kind: kind));

      await tester.tap(find.byIcon(Icons.format_list_bulleted_add));
      await tester.pumpAndSettle();

      expect(find.text(page), findsOneWidget);
    });
  }
}
