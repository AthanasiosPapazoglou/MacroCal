import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/presentation/nutrient_kind.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/nutrient_detail_page.dart';

import '../../../../helpers/pump_localized.dart';

void main() {
  testWidgets('scrolls to the whole description on a short screen', (
    tester,
  ) async {
    await pumpLocalized(
      tester,
      home: const NutrientDetailPage(kind: NutrientKind.fat),
    );
    tester.view
      ..physicalSize = const Size(960, 1280)
      ..devicePixelRatio = 3;
    await tester.pumpAndSettle();

    expect(find.text('Total Fat'), findsOneWidget);
    final description = find.textContaining('Fats, also known as lipids');
    await tester.scrollUntilVisible(description, 200);

    expect(description, findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
