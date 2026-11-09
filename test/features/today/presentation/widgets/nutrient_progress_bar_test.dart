import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/today/domain/entities/goal_kind.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/nutrient_progress_bar.dart';

import '../../../../helpers/pump_localized.dart';

void main() {
  Future<void> pumpBar(
    WidgetTester tester, {
    required double goal,
    required double consumed,
    GoalKind kind = GoalKind.limit,
    bool showDecimals = true,
  }) => pumpLocalized(
    tester,
    home: Scaffold(
      body: NutrientProgressBar(
        title: 'Sugars',
        goal: goal,
        consumed: consumed,
        kind: kind,
        showDecimals: showDecimals,
      ),
    ),
  );

  testWidgets('shows the title and the truncated value', (tester) async {
    await pumpBar(tester, goal: 48, consumed: 9.87);

    expect(find.text('Sugars'), findsOneWidget);
    expect(find.text('9.8 / 48'), findsOneWidget);
  });

  testWidgets('shows whole numbers when decimals are off', (tester) async {
    await pumpBar(tester, goal: 5800, consumed: 120.6, showDecimals: false);

    expect(find.text('120 / 5800'), findsOneWidget);
  });

  testWidgets('a surpassed goal shows by how much', (tester) async {
    await pumpBar(tester, goal: 40, consumed: 50);

    expect(find.text('Surpassed Sugars (25%)'), findsOneWidget);
  });

  testWidgets('a surpassed goal of zero has no percentage', (tester) async {
    await pumpBar(tester, goal: 0, consumed: 5);

    expect(find.text('Surpassed Sugars'), findsOneWidget);
  });
}
