import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/calories_chart.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/macro_split_chart.dart';

import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_summary.dart';

void main() {
  List<DayLog> logs(int count) => [
    for (var day = count; day >= 1; day--)
      DayLog(date: DateTime(2026, 10, day), summary: sampleSummary),
  ];

  BarChartData barData(WidgetTester tester) =>
      tester.widget<BarChart>(find.byType(BarChart)).data;

  group('CaloriesChart', () {
    testWidgets('draws one bar per day oldest first with the goal line', (
      tester,
    ) async {
      await pumpLocalized(
        tester,
        home: Scaffold(body: CaloriesChart(logs: logs(3), averageGoal: 1950)),
      );

      final data = barData(tester);
      expect(data.barGroups, hasLength(3));
      expect(data.barGroups.first.barRods.single.toY, 90);
      expect(data.extraLinesData.horizontalLines.single.y, 1950);
      expect(find.text('01/10'), findsOneWidget);
      expect(find.text('03/10'), findsOneWidget);
    });

    testWidgets('keeps only the latest days', (tester) async {
      await pumpLocalized(
        tester,
        home: Scaffold(body: CaloriesChart(logs: logs(31), averageGoal: 1950)),
      );
      expect(barData(tester).barGroups, hasLength(31));

      final more = [
        DayLog(date: DateTime(2026, 11), summary: sampleSummary),
        ...logs(31),
      ];
      await pumpLocalized(
        tester,
        home: Scaffold(body: CaloriesChart(logs: more, averageGoal: 1950)),
      );
      expect(barData(tester).barGroups, hasLength(CaloriesChart.maxDays));
      expect(find.text('01/10'), findsNothing);
    });
  });

  group('MacroSplitChart', () {
    const average = Nutrients(proteinG: 100, carbsG: 200, fatG: 400 / 9);

    test('has data only when a macro was eaten', () {
      expect(MacroSplitChart.hasData(const Nutrients()), isFalse);
      expect(MacroSplitChart.hasData(average), isTrue);
    });

    testWidgets('splits the kcal of each macro with a gram legend', (
      tester,
    ) async {
      await pumpLocalized(
        tester,
        home: const Scaffold(body: MacroSplitChart(average: average)),
      );

      expect(
        tester
            .widget<PieChart>(find.byType(PieChart))
            .data
            .sections
            .map((section) => section.title),
        ['25%', '50%', '25%'],
      );
      expect(find.text('Protein'), findsOneWidget);
      expect(find.text('Carbs'), findsOneWidget);
      expect(find.text('Fat'), findsOneWidget);
      expect(find.text('200 gr.'), findsOneWidget);
    });

    testWidgets('leaves out a macro that was not eaten', (tester) async {
      await pumpLocalized(
        tester,
        home: const Scaffold(
          body: MacroSplitChart(average: Nutrients(proteinG: 10)),
        ),
      );

      expect(
        tester.widget<PieChart>(find.byType(PieChart)).data.sections,
        hasLength(1),
      );
    });
  });
}
