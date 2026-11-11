import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/widgets/loader.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_range.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_stats.dart';
import 'package:macro_cal_public/features/history/domain/entities/tracked_goal.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/history_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/history_state.dart';
import 'package:macro_cal_public/features/history/presentation/pages/history_view.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/calories_chart.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/day_log_tile.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/goal_adherence_bar.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/macro_split_chart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_summary.dart';

class _MockHistoryCubit extends Mock implements HistoryCubit;

void main() {
  late HistoryCubit cubit;

  final ready = HistoryState(
    status: HistoryStatus.ready,
    logs: [
      DayLog(date: DateTime(2026, 11, 11), summary: sampleSummary),
      DayLog(date: DateTime(2026, 11, 10), summary: sampleSummary),
    ],
    stats: const HistoryStats(
      daysLogged: 2,
      averageConsumed: Nutrients(kcal: 90),
      averageAdjustedKcal: 1950,
      daysMet: {TrackedGoal.energy: 1, TrackedGoal.sugar: 2},
      currentStreak: 2,
    ),
  );

  setUp(() => cubit = _MockHistoryCubit());

  Future<void> pumpView(WidgetTester tester, HistoryState state) {
    CubitStub(cubit, state);
    return pumpLocalized(
      tester,
      home: BlocProvider.value(value: cubit, child: const HistoryView()),
    );
  }

  testWidgets('shows a loader while loading', (tester) async {
    CubitStub(cubit, const HistoryState());
    await pumpLocalized(
      tester,
      home: BlocProvider.value(value: cubit, child: const HistoryView()),
      settle: false,
    );

    expect(find.byType(Loader), findsOneWidget);
    expect(find.text('Historical Analysis'), findsOneWidget);
  });

  testWidgets('shows the failure message', (tester) async {
    await pumpView(tester, const HistoryState(status: HistoryStatus.failure));

    expect(find.text('History could not be loaded'), findsOneWidget);
  });

  testWidgets('shows the empty state when the range has no days', (
    tester,
  ) async {
    await pumpView(tester, const HistoryState(status: HistoryStatus.ready));

    expect(find.text('No archived days'), findsOneWidget);
    expect(find.byType(SegmentedButton<HistoryRange>), findsOneWidget);
    expect(find.byType(DayLogTile), findsNothing);
  });

  testWidgets('shows the summary, adherence and days of the range', (
    tester,
  ) async {
    await pumpView(tester, ready);

    expect(find.text('Days logged'), findsOneWidget);
    expect(find.text('90 / 1950'), findsOneWidget);
    expect(find.text('1 of 2 days'), findsNWidgets(2));
    expect(find.text('2 days'), findsOneWidget);
    expect(find.byType(CaloriesChart), findsOneWidget);
    expect(find.byType(MacroSplitChart), findsNothing);
    await tester.scrollUntilVisible(
      find.byType(GoalAdherenceBar).first,
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.byType(GoalAdherenceBar), findsWidgets);

    await tester.scrollUntilVisible(
      find.text('Tue 10/11/2026'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Wed 11/11/2026'), findsOneWidget);
    expect(find.text('Tue 10/11/2026'), findsOneWidget);
    expect(find.text('90 / 1950 kcal.'), findsNWidgets(2));
  });

  testWidgets('shows the macro split when macros were eaten', (tester) async {
    await pumpView(
      tester,
      ready.copyWith(
        stats: ready.stats.copyWith(
          averageConsumed: const Nutrients(kcal: 90, proteinG: 6.4),
        ),
      ),
    );

    await tester.scrollUntilVisible(
      find.byType(MacroSplitChart),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    expect(find.text('Average macro split'), findsOneWidget);
  });

  testWidgets('selecting a range asks the cubit for it', (tester) async {
    await pumpView(tester, ready);

    await tester.tap(find.text('30 days'));

    verify(() => cubit.selectRange(HistoryRange.month)).called(1);
  });
}
