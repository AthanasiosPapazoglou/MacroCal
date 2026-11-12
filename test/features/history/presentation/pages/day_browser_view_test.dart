import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/widgets/loader.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/history/domain/entities/date_period.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_filter.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/entities/tracked_goal.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_browser_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_browser_state.dart';
import 'package:macro_cal_public/features/history/presentation/pages/day_browser_view.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/day_log_tile.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_summary.dart';

class _MockDayBrowserCubit extends Mock implements DayBrowserCubit;

DayLog _log(int month, int day, {double kcal = 1950}) => DayLog(
  date: DateTime(2026, month, day),
  summary: sampleSummary.copyWith(consumed: Nutrients(kcal: kcal)),
);

void main() {
  late DayBrowserCubit cubit;

  final november = DatePeriod.monthOf(DateTime(2026, 11));
  final ready = DayBrowserState(
    period: DatePeriod.yearOf(DateTime(2026)),
    status: DayBrowserStatus.ready,
    periodDays: [_log(10, 30), _log(11, 2), _log(11, 5, kcal: 500)],
  );

  setUpAll(() {
    registerFallbackValue(november);
    registerFallbackValue(DaySort.newestFirst);
  });

  setUp(() => cubit = _MockDayBrowserCubit());

  Future<void> pumpView(
    WidgetTester tester,
    DayBrowserState state, {
    bool settle = true,
  }) {
    CubitStub(cubit, state);
    return pumpLocalized(
      tester,
      home: BlocProvider.value(value: cubit, child: const DayBrowserView()),
      settle: settle,
    );
  }

  testWidgets('shows a loader while loading', (tester) async {
    await pumpView(tester, DayBrowserState(period: november), settle: false);

    expect(find.byType(Loader), findsOneWidget);
    expect(find.text('November 2026'), findsOneWidget);
  });

  testWidgets('groups the days under month headers, newest first', (
    tester,
  ) async {
    await pumpView(tester, ready);

    expect(find.text('2026'), findsOneWidget);
    expect(find.text('3 days'), findsOneWidget);
    expect(find.byType(DayLogTile), findsNWidgets(3));
    final top = tester.getTopLeft;
    expect(
      top(find.text('November 2026')).dy,
      lessThan(top(find.text('Thu 05/11/2026')).dy),
    );
    expect(
      top(find.text('Mon 02/11/2026')).dy,
      lessThan(top(find.text('October 2026')).dy),
    );
    expect(
      top(find.text('October 2026')).dy,
      lessThan(top(find.text('Fri 30/10/2026')).dy),
    );
  });

  testWidgets('says when the period has no days', (tester) async {
    await pumpView(
      tester,
      DayBrowserState(period: november, status: DayBrowserStatus.ready),
    );

    expect(find.text('No archived days in this period'), findsOneWidget);
    expect(find.text('0 days'), findsOneWidget);
  });

  testWidgets('says when no day matches the filter', (tester) async {
    await pumpView(
      tester,
      ready.copyWith(
        filter: const DayFilter(
          goal: TrackedGoal.energy,
          outcome: DayOutcome.over,
        ),
      ),
    );

    expect(find.text('No days match this filter'), findsOneWidget);
    expect(find.text('Calories: Above'), findsOneWidget);
  });

  testWidgets('the arrows move the period', (tester) async {
    await pumpView(tester, ready);

    await tester.tap(find.byTooltip('Previous period'));
    await tester.tap(find.byTooltip('Next period'));

    verify(cubit.showPrevious).called(1);
    verify(cubit.showNext).called(1);
  });

  testWidgets('the sort button flips the order', (tester) async {
    await pumpView(tester, ready);

    await tester.tap(find.byTooltip('Newest first'));

    verify(() => cubit.selectSort(DaySort.oldestFirst)).called(1);
  });

  testWidgets('the filter sheet applies a goal and result', (tester) async {
    await pumpView(tester, ready);

    await tester.tap(find.text('Filter'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Sugars'));
    await tester.tap(find.text('Above'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Apply'));
    await tester.pumpAndSettle();

    verify(
      () => cubit.selectFilter(
        const DayFilter(goal: TrackedGoal.sugar, outcome: DayOutcome.over),
      ),
    ).called(1);
  });

  testWidgets('clearing the filter chip removes the filter', (tester) async {
    await pumpView(
      tester,
      ready.copyWith(
        filter: const DayFilter(
          goal: TrackedGoal.energy,
          outcome: DayOutcome.under,
        ),
      ),
    );

    expect(find.byType(DayLogTile), findsOneWidget);
    await tester.tap(find.byTooltip('Clear'));

    verify(() => cubit.selectFilter(null)).called(1);
  });

  testWidgets('the period sheet switches to a picked year', (tester) async {
    await pumpView(tester, ready.copyWith(period: november));

    await tester.tap(find.widgetWithText(TextButton, 'November 2026'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('A year'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('OK'));
    await tester.pumpAndSettle();

    verify(() => cubit.selectPeriod(DatePeriod.yearOf(DateTime(2026))))
        .called(1);
  });
}
