import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:integration_test/integration_test.dart';
import 'package:macro_cal_public/bootstrap.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/core/database/seed/ingredient_seed.dart';
import 'package:macro_cal_public/core/widgets/numeric_field.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_field.dart';

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

  Future<void> enterField(
    WidgetTester tester,
    IngredientField field,
    String text,
  ) async {
    final input = find.byType(TextFormField).at(field.index);
    await tester.ensureVisible(input);
    await tester.pumpAndSettle();
    await tester.enterText(input, text);
  }

  testWidgets(
    'log food, archive the day, then review and delete it in history',
    (tester) async {
      await tester.pumpWidget(
        await createApp(database: database, httpClient: http.Client()),
      );
      await tester.pumpAndSettle();
      expect(find.text('0 / 2100'), findsOneWidget);

      await tapAndSettle(tester, find.text('Food Bank'));
      await tapAndSettle(tester, find.byIcon(Icons.format_list_bulleted_add));
      await enterField(tester, IngredientField.name, 'E2E Oats');
      await enterField(tester, IngredientField.kcal, '400');
      await enterField(tester, IngredientField.proteinG, '10');
      await tapAndSettle(tester, find.text('Save'));
      expect(find.text('Food Bank'), findsOneWidget);

      await tapAndSettle(tester, find.text('Overview'));
      await tapAndSettle(tester, find.byIcon(Icons.add_rounded).last);
      await tapAndSettle(tester, find.byIcon(Icons.restaurant_rounded));
      await tapAndSettle(tester, find.byIcon(Icons.search_rounded));
      await tester.enterText(find.byType(TextField).first, 'E2E');
      await tester.pumpAndSettle();
      await tester.enterText(
        find.descendant(
          of: find.byType(NumericField),
          matching: find.byType(TextField),
        ),
        '200',
      );
      await tapAndSettle(tester, find.text('Save Changes'));

      expect(find.text('800 / 2100'), findsOneWidget);
      expect(find.text('20.0 / 100'), findsOneWidget);

      await tapAndSettle(tester, find.byIcon(Icons.save_rounded));
      await tapAndSettle(tester, find.text('Complete'));

      expect(find.text('0 / 2100'), findsOneWidget);
      final logs = await database.select(database.dayLogsTable).get();
      expect(logs, hasLength(1));

      await tapAndSettle(tester, find.text('Historical'));
      expect(find.text('800 / 2100'), findsOneWidget);
      await tester.scrollUntilVisible(
        find.text('800 / 2100 kcal.'),
        300,
        scrollable: find.byType(Scrollable).first,
      );
      await tapAndSettle(tester, find.text('800 / 2100 kcal.'));
      expect(find.text('Calory intake'), findsOneWidget);
      expect(find.text('800 / 2100'), findsOneWidget);

      await tapAndSettle(tester, find.byTooltip('Delete day'));
      await tapAndSettle(tester, find.text('Delete'));

      expect(find.text('No archived days'), findsOneWidget);
      expect(await database.select(database.dayLogsTable).get(), isEmpty);
    },
  );
}
