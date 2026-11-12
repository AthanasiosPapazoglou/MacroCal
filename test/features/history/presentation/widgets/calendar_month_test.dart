import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/app/theme/app_theme.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/history/domain/entities/date_period.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/calendar_month.dart';

import '../../../../helpers/sample_summary.dart';

DayLog _log(int day, {double kcal = 1950}) => DayLog(
  date: DateTime(2026, 11, day),
  summary: sampleSummary.copyWith(consumed: Nutrients(kcal: kcal)),
);

void main() {
  group('leadingBlanks', () {
    test('counts the cells before day 1 for a Sunday start', () {
      expect(CalendarMonth.leadingBlanks(DateTime(2026, 11), 0), 0);
      expect(CalendarMonth.leadingBlanks(DateTime(2026, 10), 0), 4);
      expect(CalendarMonth.leadingBlanks(DateTime(2026, 2), 0), 0);
    });

    test('counts the cells before day 1 for a Monday start', () {
      expect(CalendarMonth.leadingBlanks(DateTime(2026, 11), 1), 6);
      expect(CalendarMonth.leadingBlanks(DateTime(2026, 10), 1), 3);
      expect(CalendarMonth.leadingBlanks(DateTime(2026, 6), 1), 0);
    });
  });

  Future<List<DayLog>> pumpMonth(
    WidgetTester tester, {
    Locale locale = const Locale('en'),
    DateTime? month,
    List<DayLog> days = const [],
    DatePeriod? period,
    bool Function(DayLog)? matches,
    bool showTitle = true,
  }) async {
    final tapped = <DayLog>[];
    final shown = month ?? DateTime(2026, 11);
    tester.view
      ..physicalSize = const Size(1179, 2556)
      ..devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.dark,
        locale: locale,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Scaffold(
          body: SingleChildScrollView(
            child: CalendarMonth(
              month: shown,
              days: {for (final log in days) log.date: log},
              period: period ?? DatePeriod.monthOf(shown),
              matches: matches ?? (_) => true,
              today: DateTime(2026, 11, 12, 9),
              onDayTap: tapped.add,
              showTitle: showTitle,
            ),
          ),
        ),
      ),
    );
    await tester.pumpAndSettle();
    return tapped;
  }

  Opacity opacityOf(WidgetTester tester, DateTime date) => tester.widget(
    find.ancestor(
      of: find.byKey(ValueKey(date)),
      matching: find.byType(Opacity),
    ),
  );

  BoxDecoration decorationOf(WidgetTester tester, DateTime date) =>
      tester.widget<Container>(find.byKey(ValueKey(date))).decoration!
          as BoxDecoration;

  testWidgets('shows the month, its summary and every day', (tester) async {
    await pumpMonth(tester, days: [_log(2), _log(5, kcal: 500)]);

    expect(find.text('November 2026'), findsOneWidget);
    expect(find.text('2 days  ·  1 on goal  ·  Avg 1225 kcal'), findsOneWidget);
    expect(find.text('30'), findsOneWidget);
    expect(find.text('31'), findsNothing);
  });

  testWidgets('starts weeks on Sunday in English and Monday in Greek', (
    tester,
  ) async {
    await pumpMonth(tester);
    final english = tester.getTopLeft(find.byKey(ValueKey(DateTime(2026, 11))));
    expect(
      english.dx,
      lessThan(
        tester.getTopLeft(find.byKey(ValueKey(DateTime(2026, 11, 2)))).dx,
      ),
    );

    await pumpMonth(tester, locale: const Locale('el'));
    final sunday = tester.getTopLeft(find.byKey(ValueKey(DateTime(2026, 11))));
    final monday = tester.getTopLeft(
      find.byKey(ValueKey(DateTime(2026, 11, 2))),
    );
    expect(sunday.dx, greaterThan(monday.dx));
    expect(sunday.dy, lessThan(monday.dy));
  });

  testWidgets('can leave out the month title', (tester) async {
    await pumpMonth(tester, showTitle: false);

    expect(find.text('November 2026'), findsNothing);
    expect(find.text('0 days'), findsOneWidget);
  });

  testWidgets('shows February with 28 days', (tester) async {
    await pumpMonth(tester, month: DateTime(2026, 2));

    expect(find.text('28'), findsOneWidget);
    expect(find.text('29'), findsNothing);
    expect(find.text('0 days'), findsOneWidget);
  });

  testWidgets('colours archived days and outlines today', (tester) async {
    await pumpMonth(tester, days: [_log(2), _log(5, kcal: 500)]);

    expect(decorationOf(tester, DateTime(2026, 11, 2)).color, isNotNull);
    expect(
      decorationOf(tester, DateTime(2026, 11, 2)).color,
      isNot(decorationOf(tester, DateTime(2026, 11, 5)).color),
    );
    expect(decorationOf(tester, DateTime(2026, 11, 3)).color, isNull);
    expect(decorationOf(tester, DateTime(2026, 11, 12)).border, isNotNull);
    expect(decorationOf(tester, DateTime(2026, 11, 11)).border, isNull);
  });

  testWidgets('dims filtered-out days and days outside the period', (
    tester,
  ) async {
    await pumpMonth(
      tester,
      days: [_log(2), _log(5)],
      period: DatePeriod.between(DateTime(2026, 11), DateTime(2026, 11, 10)),
      matches: (log) => log.date.day == 2,
    );

    expect(opacityOf(tester, DateTime(2026, 11, 2)).opacity, 1);
    expect(opacityOf(tester, DateTime(2026, 11, 5)).opacity, lessThan(1));
    expect(opacityOf(tester, DateTime(2026, 11, 7)).opacity, 1);
    expect(opacityOf(tester, DateTime(2026, 11, 20)).opacity, lessThan(1));
  });

  testWidgets('tapping an archived day reports it', (tester) async {
    final tapped = await pumpMonth(tester, days: [_log(2)]);

    await tester.tap(find.text('3'));
    await tester.tap(find.text('2'));

    expect(tapped.map((log) => log.date), [DateTime(2026, 11, 2)]);
  });
}
