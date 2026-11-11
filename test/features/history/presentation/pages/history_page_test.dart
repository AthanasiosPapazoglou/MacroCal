import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/history/presentation/pages/history_page.dart';

import '../../../../helpers/pump_localized.dart';

void main() {
  testWidgets('shows the translated placeholder and no dead buttons', (
    tester,
  ) async {
    await pumpLocalized(tester, home: const HistoryPage());

    expect(find.text('Historical Analysis'), findsOneWidget);
    expect(find.text('Page not available yet'), findsOneWidget);
    expect(find.text('Coming Soon!'), findsOneWidget);
    expect(find.text('Generate New'), findsNothing);
    expect(find.byIcon(Icons.restaurant_rounded), findsNothing);
  });
}
