import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations_native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';

import '../../helpers/ingredient_seeds.dart';
import 'generated/schema.dart';
import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;
import 'generated/schema_v3.dart' as v3;
import 'generated/schema_v4.dart' as v4;

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

  test('v2 to v3 keeps the profile and adds the walking preset', () async {
    await verifier.testWithDataIntegrity(
      oldVersion: 2,
      newVersion: 3,
      createOld: v2.DatabaseAtV2.new,
      createNew: v3.DatabaseAtV3.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) => batch.insertAll(oldDb.profile, const [
        v2.ProfileData(
          id: 1,
          dailyKcal: 1800,
          proteinG: 120,
          fiberG: 30,
          sugarLimitPct: 5,
          saturatedLimitPct: 6,
          saltLimitMg: 5000,
          weightKg: 80,
          heightCm: 175,
        ),
      ]),
      validateItems: (newDb) async {
        expect(await newDb.select(newDb.profile).get(), const [
          v3.ProfileData(
            id: 1,
            dailyKcal: 1800,
            proteinG: 120,
            fiberG: 30,
            sugarLimitPct: 5,
            saturatedLimitPct: 6,
            saltLimitMg: 5000,
            weightKg: 80,
            heightCm: 175,
          ),
        ]);
        expect(await newDb.select(newDb.activities).get(), const [
          v3.ActivitiesData(
            id: 1,
            presetKey: 'walking',
            name: 'Walking',
            kcalPerUnit: 50,
            unitLabel: 'Kilometers',
            isDurationBased: 0,
          ),
        ]);
      },
    );
  });

  test('v3 to v4 keeps activities and seeds the default ingredients', () async {
    await verifier.testWithDataIntegrity(
      oldVersion: 3,
      newVersion: 4,
      createOld: v3.DatabaseAtV3.new,
      createNew: v4.DatabaseAtV4.new,
      openTestedDatabase: (executor) =>
          AppDatabase(executor, testIngredientSeeds),
      createItems: (batch, oldDb) => batch.insertAll(
        oldDb.activityEntries,
        const [v3.ActivityEntriesData(id: 1, activityId: 1, amount: 3)],
      ),
      validateItems: (newDb) async {
        expect(await newDb.select(newDb.activityEntries).get(), const [
          v4.ActivityEntriesData(id: 1, activityId: 1, amount: 3),
        ]);
        final ingredients = await newDb.select(newDb.ingredients).get();
        expect(ingredients.map((row) => (row.name, row.category)), [
          ('Milk 1.5%', 'Dairy'),
          ('Bread', null),
        ]);
        expect(await newDb.select(newDb.foodEntries).get(), isEmpty);
      },
    );
  });
}
