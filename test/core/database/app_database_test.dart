import 'package:drift/drift.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';

import '../../helpers/test_database.dart';

void main() {
  late AppDatabase database;

  setUp(() => database = createTestDatabase());
  tearDown(() => database.close());

  test('stores and reads back a settings row', () async {
    await database
        .into(database.settings)
        .insert(const SettingsCompanion(localeCode: Value('el')));

    final rows = await database.select(database.settings).get();

    expect(rows.single.localeCode, 'el');
  });
}
