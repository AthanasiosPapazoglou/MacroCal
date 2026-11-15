import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:integration_test/integration_test.dart';
import 'package:macro_cal_public/bootstrap.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/core/database/seed/ingredient_seed.dart';
import 'package:macro_cal_public/core/widgets/numeric_field.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late AppDatabase database;

  setUp(() {
    database = AppDatabase(NativeDatabase.memory(), loadDefaultIngredientSeeds);
  });

  tearDown(() => database.close());

  Future<void> tapAndSettle(WidgetTester tester, Finder finder) async {
    await tester.ensureVisible(finder);
    await tester.pumpAndSettle();
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Finder amountField() => find.descendant(
    of: find.byType(NumericField),
    matching: find.byType(TextField),
  );

  testWidgets(
    'track micronutrients from a reference food and a supplement, then archive',
    (tester) async {
      await tester.pumpWidget(
        await createApp(database: database, httpClient: http.Client()),
      );
      await tester.pumpAndSettle();

      await tapAndSettle(tester, find.byIcon(Icons.settings_rounded));
      await tapAndSettle(tester, find.text('Track micronutrients'));
      await tester.tapAt(const Offset(10, 300));
      await tester.pumpAndSettle();

      await tapAndSettle(tester, find.text('Food Bank'));
      await tapAndSettle(tester, find.byIcon(Icons.format_list_bulleted_add));
      await tapAndSettle(tester, find.text('Fill from a reference food'));
      await tester.enterText(find.byType(TextField).first, 'lentil blond');
      await tester.pumpAndSettle();
      await tapAndSettle(
        tester,
        find.text('Lentil, blond, boiled/cooked in water'),
      );
      await tapAndSettle(tester, find.text('Macros too'));
      await tapAndSettle(tester, find.text('Save'));
      final ingredients = await database
          .select(database.ingredientsTable)
          .get();
      expect(
        ingredients.map((row) => row.name),
        contains('Lentil, blond, boiled/cooked in water'),
      );

      await tapAndSettle(tester, find.text('Supplements'));
      await tapAndSettle(tester, find.byIcon(Icons.format_list_bulleted_add));
      expect(find.text('Add Supplement'), findsOneWidget);
      await tester.enterText(find.byType(TextFormField).first, 'E2E D3');
      await tapAndSettle(tester, find.text('Drop'));
      final vitaminD = find.widgetWithText(TextFormField, 'Vitamin D (µg)');
      await tester.scrollUntilVisible(
        vitaminD,
        200,
        scrollable: find
            .descendant(
              of: find.byType(Form),
              matching: find.byType(Scrollable),
            )
            .first,
      );
      await tester.enterText(vitaminD, '25');
      await tapAndSettle(tester, find.text('Save'));
      expect(find.text('E2E D3'), findsOneWidget);

      await tapAndSettle(tester, find.text('Overview'));
      await tapAndSettle(tester, find.byIcon(Icons.add_rounded).last);
      await tapAndSettle(tester, find.byIcon(Icons.restaurant_rounded));
      await tapAndSettle(tester, find.byIcon(Icons.search_rounded));
      await tester.enterText(find.byType(TextField).first, 'Lentil, blond');
      await tester.pumpAndSettle();
      await tester.enterText(amountField(), '200');
      await tester.pumpAndSettle();
      await tapAndSettle(tester, find.byIcon(Icons.search_off_rounded));
      await tester.tap(find.text('Supplements'));
      await tester.pumpAndSettle();
      await tester.enterText(amountField(), '2');
      await tapAndSettle(tester, find.text('Save Changes'));

      expect(find.text('244 / 2100'), findsOneWidget);
      expect(
        await database.select(database.supplementEntriesTable).get(),
        hasLength(1),
      );

      await tester.scrollUntilVisible(
        find.textContaining('of 21 at reference (7-day)'),
        300,
        scrollable: find.byType(Scrollable).first,
      );
      await tapAndSettle(tester, find.textContaining('of 21 at reference'));
      expect(
        find.text(
          'Reference intakes: EU label values. '
          'Add your sex and birth year in the profile for EFSA values.',
        ),
        findsOneWidget,
      );
      expect(find.text('Based on 1 of 7 days'), findsOneWidget);
      await tapAndSettle(tester, find.text('Today'));
      expect(find.text('50 µg / 5 µg  1000%'), findsOneWidget);
      await tester.ensureVisible(find.text('5 mg / 14 mg  36%'));
      await tester.pumpAndSettle();
      expect(find.text('5 mg / 14 mg  36%'), findsOneWidget);

      await tapAndSettle(tester, find.text('Vitamin D'));
      expect(find.text("Today's top contributors"), findsOneWidget);
      expect(find.text('E2E D3'), findsOneWidget);
      await tester.tapAt(const Offset(200, 100));
      await tester.pumpAndSettle();
      await tester.pageBack();
      await tester.pumpAndSettle();

      await tapAndSettle(tester, find.byIcon(Icons.save_rounded));
      await tapAndSettle(tester, find.text('Complete'));

      expect(find.text('0 / 2100'), findsOneWidget);
      final micros = {
        for (final row
            in await database.select(database.dayLogMicronutrientsTable).get())
          row.nutrient: row,
      };
      expect(micros['iron']?.foodAmount, closeTo(5, 1e-9));
      expect(micros['vitaminD']?.supplementAmount, closeTo(50, 1e-9));
      expect(
        await database.select(database.supplementEntriesTable).get(),
        isEmpty,
      );
    },
  );
}
