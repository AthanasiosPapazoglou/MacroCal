import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/app/view/home_shell.dart';
import 'package:macro_cal_public/features/food_bank/presentation/nutrient_kind.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/food_bank_page.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/ingredient_details_page.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/ingredient_form_page.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/nutrient_detail_page.dart';
import 'package:macro_cal_public/pages/today_consumption_page.dart';
import 'package:macro_cal_public/pages/today_excercise_page.dart';
import 'package:macro_cal_public/pages/today_overview_page.dart';

import '../../helpers/pump_app.dart';

void main() {
  Future<GoRouter> startApp(WidgetTester tester) async {
    await pumpApp(tester);
    return GoRouter.of(tester.element(find.byType(HomeShell)));
  }

  Future<void> goTo(
    WidgetTester tester,
    GoRouter router,
    String location,
  ) async {
    router.go(location);
    await tester.pumpAndSettle();
  }

  testWidgets('starts on the overview tab', (tester) async {
    await startApp(tester);

    expect(find.byType(TodaysPage), findsOneWidget);
  });

  testWidgets('the navigation bar switches to the food bank', (tester) async {
    await startApp(tester);

    await tester.tap(find.text('Food Bank'));
    await tester.pumpAndSettle();

    expect(find.byType(FoodBankPage), findsOneWidget);
    expect(find.text('Milk 1.5%'), findsOneWidget);
  });

  final pages = {
    AppRoutes.consumption: TodayConsumption,
    AppRoutes.exercise: TodayExcercise,
    AppRoutes.newIngredient: IngredientFormPage,
    AppRoutes.ingredient(1): IngredientDetailsPage,
    AppRoutes.editIngredient(1): IngredientFormPage,
    AppRoutes.nutrient(1, NutrientKind.salt): NutrientDetailPage,
  };
  for (final MapEntry(key: location, value: page) in pages.entries) {
    testWidgets('$location opens $page', (tester) async {
      final router = await startApp(tester);

      await goTo(tester, router, location);

      expect(find.byType(page), findsOneWidget);
    });
  }

  testWidgets('an ingredient link shows that ingredient', (tester) async {
    final router = await startApp(tester);

    await goTo(tester, router, AppRoutes.ingredient(2));

    expect(find.text('Whole Bread'), findsOneWidget);
  });

  for (final location in ['/foods/abc', '/foods/1/nutrient/unknown']) {
    testWidgets('$location falls back to the food bank', (tester) async {
      final router = await startApp(tester);

      await goTo(tester, router, location);

      expect(find.byType(FoodBankPage), findsOneWidget);
      expect(find.byType(IngredientDetailsPage), findsNothing);
    });
  }
}
