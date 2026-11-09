import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_state.dart';
import 'package:macro_cal_public/features/today/presentation/pages/overview_page.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/nutrient_progress_bar.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_summary.dart';

class _MockOverviewCubit extends Mock implements OverviewCubit;

void main() {
  late OverviewCubit cubit;

  setUp(() {
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
          builder: (_, _) =>
              BlocProvider.value(value: cubit, child: const OverviewPage()),
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
