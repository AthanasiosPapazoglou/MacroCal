import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/app/theme/app_theme.dart';
import 'package:macro_cal_public/app/theme/intake_colors.dart';
import 'package:macro_cal_public/core/widgets/empty_state.dart';
import 'package:macro_cal_public/core/widgets/numeric_field.dart';
import 'package:macro_cal_public/core/widgets/swipe_back_detector.dart';
import 'package:macro_cal_public/features/today/domain/entities/intake_status.dart';

Widget _wrap(Widget child) => MaterialApp(
  theme: AppTheme.dark,
  home: Scaffold(body: child),
);

void main() {
  test('IntakeColors maps every status to its color', () {
    final colors = AppTheme.dark.extension<IntakeColors>()!;
    expect(colors.of(IntakeStatus.critical), colors.critical);
    expect(colors.of(IntakeStatus.warning), colors.warning);
    expect(colors.of(IntakeStatus.caution), colors.caution);
    expect(colors.of(IntakeStatus.good), colors.good);
  });

  testWidgets('NumericField keeps up to four digits and reports ints', (
    tester,
  ) async {
    final values = <int>[];
    await tester.pumpWidget(
      _wrap(NumericField(controller: null, onChanged: values.add)),
    );

    await tester.enterText(find.byType(TextField), '12a345');

    expect(find.text('1234'), findsOneWidget);
    expect(values.last, 1234);
  });

  testWidgets('EmptyState shows its title and subtitle and settles', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(const EmptyState(title: 'Nothing', subtitle: 'here')),
    );
    await tester.pumpAndSettle();

    expect(find.text('Nothing'), findsOneWidget);
    expect(find.text('here'), findsOneWidget);
  });

  testWidgets('SwipeBackDetector pops once per long swipe', (tester) async {
    final navigatorKey = GlobalKey<NavigatorState>();
    await tester.pumpWidget(
      MaterialApp(navigatorKey: navigatorKey, home: const Text('root')),
    );
    for (final name in ['middle', 'top']) {
      navigatorKey.currentState!.push(
        MaterialPageRoute<void>(
          builder: (_) => SwipeBackDetector(
            child: SizedBox.expand(
              child: ColoredBox(color: Colors.white, child: Text(name)),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
    }

    await tester.drag(find.text('top'), const Offset(300, 0));
    await tester.pumpAndSettle();

    expect(find.text('middle'), findsOneWidget);
    expect(find.text('top'), findsNothing);
  });
}
