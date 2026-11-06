import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';

import 'generated/schema.dart';
import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() => verifier = SchemaVerifier(GeneratedHelper()));

  group('schema migrations', () {
    const versions = GeneratedHelper.versions;
    for (final (index, fromVersion) in versions.indexed) {
      for (final toVersion in versions.skip(index + 1)) {
        test('from v$fromVersion to v$toVersion', () async {
          final schema = await verifier.schemaAt(fromVersion);
          final database = AppDatabase(schema.newConnection());
          await verifier.migrateAndValidate(database, toVersion);
          await database.close();
        });
      }
    }
  });

  test('v1 to v2 keeps the saved language', () async {
    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) => batch.insertAll(oldDb.settings, const [
        v1.SettingsData(id: 1, localeCode: 'el'),
      ]),
      validateItems: (newDb) async => expect(
        await newDb.select(newDb.settings).get(),
        const [v2.SettingsData(id: 1, localeCode: 'el')],
      ),
    );
  });
}
