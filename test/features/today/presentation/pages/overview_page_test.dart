import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_state.dart';
import 'package:macro_cal_public/features/today/presentation/pages/overview_page.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/nutrient_progress_bar.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_app.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_summary.dart';

class _MockOverviewCubit extends Mock implements OverviewCubit;

void main() {
  late OverviewCubit cubit;
  late ProfileRepository profile;
  late FoodLogRepository foodLog;
  late HistoryRepository history;
  late SettingsRepository settings;

  setUp(() {
    profile = MockProfileRepository();
    foodLog = MockFoodLogRepository();
    history = MockHistoryRepository();
    settings = MockSettingsRepository();
    when(profile.watchProfile).thenAnswer((_) => Stream.value(const Profile()));
    when(foodLog.watchEntries).thenAnswer((_) => Stream.value(const []));
    when(foodLog.watchSupplementEntries)
        .thenAnswer((_) => Stream.value(const []));
    when(history.watchDayLogs).thenAnswer((_) => Stream.value(const []));
    when(settings.watchMicrocalEnabled).thenAnswer((_) => Stream.value(false));
    cubit = _MockOverviewCubit();
    CubitStub(
      cubit,
      const OverviewState(summary: sampleSummary, status: OverviewStatus.ready),
    );
  });

  Future<void> pumpPage(WidgetTester tester) => pumpLocalized(
    tester,
    router: GoRouter(
      initialLocation: AppRoutes.today,
      routes: [
        GoRoute(
          path: AppRoutes.today,
          builder: (_, _) => MultiRepositoryProvider(
            providers: [
              RepositoryProvider<ProfileRepository>.value(value: profile),
              RepositoryProvider<FoodLogRepository>.value(value: foodLog),
              RepositoryProvider<HistoryRepository>.value(value: history),
              RepositoryProvider<SettingsRepository>.value(value: settings),
            ],
            child: BlocProvider.value(
              value: cubit,
              child: const OverviewPage(),
            ),
          ),
          routes: [
            GoRoute(
              path: 'consumption',
              builder: (_, _) => const Text('consumption screen'),
            ),
            GoRoute(
              path: 'exercise',
              builder: (_, _) => const Text('exercise screen'),
            ),
          ],
        ),
      ],
    ),
  );

  testWidgets('shows the calorie ring and five nutrient bars', (tester) async {
    await pumpPage(tester);

    expect(find.text('90 / 1950'), findsOneWidget);
    expect(find.text('1860 kcal.'), findsOneWidget);
    expect(
      find.byType(NutrientProgressBar, skipOffstage: false),
      findsNWidgets(5),
    );
  });

  testWidgets('the plus button fans out and opens consumption', (tester) async {
    await pumpPage(tester);
    expect(find.byIcon(Icons.restaurant_rounded), findsNothing);

    await tester.tap(find.byIcon(Icons.add_rounded).last);
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.sports_gymnastics_rounded), findsOneWidget);

    await tester.tap(find.byIcon(Icons.restaurant_rounded));
    await tester.pumpAndSettle();
    expect(find.text('consumption screen'), findsOneWidget);
  });

  testWidgets('tapping outside the open menu closes it', (tester) async {
    await pumpPage(tester);

    await tester.tap(find.byIcon(Icons.add_rounded).last);
    await tester.pumpAndSettle();
    await tester.tapAt(const Offset(100, 300));
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.restaurant_rounded), findsNothing);
  });
}
