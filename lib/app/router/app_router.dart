import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/app/view/home_shell.dart';
import 'package:macro_cal_public/core/domain/date_only.dart';
import 'package:macro_cal_public/features/food_bank/presentation/nutrient_kind.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/barcode_scanner_page.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/food_bank_page.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/ingredient_details_page.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/ingredient_form_page.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/nutrient_detail_page.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/recipe_details_page.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/recipe_form_page.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/reference_food_picker_page.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/supplement_details_page.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/supplement_form_page.dart';
import 'package:macro_cal_public/features/history/presentation/pages/day_detail_page.dart';
import 'package:macro_cal_public/features/history/presentation/pages/history_page.dart';
import 'package:macro_cal_public/features/profile/presentation/pages/profile_page.dart';
import 'package:macro_cal_public/features/today/presentation/pages/consumption_page.dart';
import 'package:macro_cal_public/features/today/presentation/pages/exercise_page.dart';
import 'package:macro_cal_public/features/today/presentation/pages/overview_page.dart';

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
                builder: (_, _) => const OverviewPage(),
                routes: [
                  fullScreen('consumption', (_) => const ConsumptionPage()),
                  fullScreen('exercise', (_) => const ExercisePage()),
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
                  fullScreen('new', (_) => const IngredientFormPage()),
                  fullScreen('recipes/new', (_) => const RecipeFormPage()),
                  fullScreen(
                    'supplements/new',
                    (_) => const SupplementFormPage(),
                  ),
                  fullScreen(
                    'supplements/:id',
                    (state) => SupplementDetailsPage(supplementId: _id(state)!),
                    redirect: (_, state) =>
                        _id(state) == null ? AppRoutes.foods : null,
                    routes: [
                      fullScreen(
                        'edit',
                        (state) => SupplementFormPage(supplementId: _id(state)),
                      ),
                    ],
                  ),
                  fullScreen(
                    'recipes/:id',
                    (state) => RecipeDetailsPage(recipeId: _id(state)!),
                    redirect: (_, state) =>
                        _id(state) == null ? AppRoutes.foods : null,
                    routes: [
                      fullScreen(
                        'edit',
                        (state) => RecipeFormPage(recipeId: _id(state)),
                      ),
                      fullScreen(
                        'nutrient/:kind',
                        (state) => NutrientDetailPage(kind: _kind(state)!),
                        redirect: (_, state) =>
                            _kind(state) == null ? AppRoutes.foods : null,
                      ),
                    ],
                  ),
                  fullScreen(
                    ':id',
                    (state) => IngredientDetailsPage(ingredientId: _id(state)!),
                    redirect: (_, state) =>
                        _id(state) == null ? AppRoutes.foods : null,
                    routes: [
                      fullScreen(
                        'edit',
                        (state) => IngredientFormPage(ingredientId: _id(state)),
                      ),
                      fullScreen(
                        'nutrient/:kind',
                        (state) => NutrientDetailPage(kind: _kind(state)!),
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
                builder: (_, _) => const HistoryPage(),
                routes: [
                  fullScreen(
                    ':date',
                    (state) => DayDetailPage(date: _date(state)!),
                    redirect: (_, state) =>
                        _date(state) == null ? AppRoutes.history : null,
                  ),
                ],
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
      fullScreen(
        AppRoutes.referenceFoods,
        (_) => const ReferenceFoodPickerPage(),
      ),
    ],
  );
}

int? _id(GoRouterState state) => int.tryParse(state.pathParameters['id']!);

NutrientKind? _kind(GoRouterState state) =>
    NutrientKind.values.asNameMap()[state.pathParameters['kind']];

DateTime? _date(GoRouterState state) =>
    parseIsoDay(state.pathParameters['date']!);
