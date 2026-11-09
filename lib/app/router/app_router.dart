import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/app/view/home_shell.dart';
import 'package:macro_cal_public/components/barcode_scanner.dart';
import 'package:macro_cal_public/features/food_bank/presentation/nutrient_kind.dart';
import 'package:macro_cal_public/features/profile/presentation/pages/profile_page.dart';
import 'package:macro_cal_public/pages/create_ingredient_page.dart';
import 'package:macro_cal_public/pages/food_bank_page.dart';
import 'package:macro_cal_public/pages/food_metric_detail_page.dart';
import 'package:macro_cal_public/pages/historical_page.dart';
import 'package:macro_cal_public/pages/ingredient_details_page.dart';
import 'package:macro_cal_public/pages/today_consumption_page.dart';
import 'package:macro_cal_public/pages/today_excercise_page.dart';
import 'package:macro_cal_public/pages/today_overview_page.dart';

GoRouter createAppRouter() {
  final rootNavigatorKey = GlobalKey<NavigatorState>();

  GoRoute fullScreen(
    String path,
    Widget Function(GoRouterState state) builder, {
    GoRouterRedirect? redirect,
    List<RouteBase> routes = const [],
  }) => GoRoute(
    path: path,
    parentNavigatorKey: rootNavigatorKey,
    redirect: redirect,
    builder: (_, state) => builder(state),
    routes: routes,
  );

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: AppRoutes.today,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (_, _, navigationShell) =>
            HomeShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.today,
                builder: (_, _) => const TodaysPage(),
                routes: [
                  fullScreen('consumption', (_) => const TodayConsumption()),
                  fullScreen('exercise', (_) => const TodayExcercise()),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.foods,
                builder: (_, _) => const FoodBankPage(),
                routes: [
                  fullScreen('new', (_) => const CreateOrEditIngredientPage()),
                  fullScreen(
                    ':id',
                    (state) => IngredientDetailsPage(ingredientId: _id(state)!),
                    redirect: (_, state) =>
                        _id(state) == null ? AppRoutes.foods : null,
                    routes: [
                      fullScreen(
                        'edit',
                        (state) => CreateOrEditIngredientPage(
                          ingredientId: _id(state),
                        ),
                      ),
                      fullScreen(
                        'nutrient/:kind',
                        (state) => FoodMetricDetailsPage(kind: _kind(state)!),
                        redirect: (_, state) =>
                            _kind(state) == null ? AppRoutes.foods : null,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.history,
                builder: (_, _) => const HistoricalPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (_, _) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
      fullScreen(AppRoutes.scan, (_) => const BarcodeScannerPage()),
    ],
  );
}

int? _id(GoRouterState state) => int.tryParse(state.pathParameters['id']!);

NutrientKind? _kind(GoRouterState state) =>
    NutrientKind.values.asNameMap()[state.pathParameters['kind']];
