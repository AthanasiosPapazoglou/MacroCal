import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/core/widgets/search_field.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/food_bank_view.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/ingredient_tile.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_ingredients.dart';

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

    expect(find.byType(IngredientTile), findsNWidgets(2));
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

    expect(find.byType(IngredientTile), findsNothing);
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
}
