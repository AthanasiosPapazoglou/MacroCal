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
import 'generated/schema_v5.dart' as v5;
import 'generated/schema_v6.dart' as v6;

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

  test('v4 to v5 keeps the food log and adds empty day logs', () async {
    const ingredient = (
      id: 1,
      name: 'Milk 1.5%',
      category: 'Dairy',
      referenceG: 100.0,
      kcal: 45.0,
      proteinG: 3.2,
      carbsG: 4.5,
      sugarsG: 4.5,
      fatG: 1.5,
      saturatedG: 1.0,
      fiberG: 0.0,
      saltMg: 50.0,
    );
    await verifier.testWithDataIntegrity(
      oldVersion: 4,
      newVersion: 5,
      createOld: v4.DatabaseAtV4.new,
      createNew: v5.DatabaseAtV5.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        batch
          ..insert(
            oldDb.ingredients,
            v4.IngredientsData(
              id: ingredient.id,
              name: ingredient.name,
              category: ingredient.category,
              referenceG: ingredient.referenceG,
              kcal: ingredient.kcal,
              proteinG: ingredient.proteinG,
              carbsG: ingredient.carbsG,
              sugarsG: ingredient.sugarsG,
              fatG: ingredient.fatG,
              saturatedG: ingredient.saturatedG,
              fiberG: ingredient.fiberG,
              saltMg: ingredient.saltMg,
            ),
          )
          ..insert(
            oldDb.foodEntries,
            const v4.FoodEntriesData(id: 1, ingredientId: 1, grams: 200),
          );
      },
      validateItems: (newDb) async {
        expect(await newDb.select(newDb.foodEntries).get(), const [
          v5.FoodEntriesData(id: 1, ingredientId: 1, grams: 200),
        ]);
        expect(await newDb.select(newDb.dayLogs).get(), isEmpty);
      },
    );
  });

  test('v5 to v6 keeps the food log and adds empty recipe tables', () async {
    await verifier.testWithDataIntegrity(
      oldVersion: 5,
      newVersion: 6,
      createOld: v5.DatabaseAtV5.new,
      createNew: v6.DatabaseAtV6.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        batch
          ..insert(
            oldDb.ingredients,
            const v5.IngredientsData(
              id: 1,
              name: 'Milk 1.5%',
              category: 'Dairy',
              referenceG: 100,
              kcal: 45,
              proteinG: 3.2,
              carbsG: 4.5,
              sugarsG: 4.5,
              fatG: 1.5,
              saturatedG: 1,
              fiberG: 0,
              saltMg: 50,
            ),
          )
          ..insert(
            oldDb.foodEntries,
            const v5.FoodEntriesData(id: 1, ingredientId: 1, grams: 200),
          );
      },
      validateItems: (newDb) async {
        expect(await newDb.select(newDb.foodEntries).get(), const [
          v6.FoodEntriesData(id: 1, ingredientId: 1, grams: 200),
        ]);
        expect(await newDb.select(newDb.recipes).get(), isEmpty);
        expect(await newDb.select(newDb.recipeIngredients).get(), isEmpty);
        expect(await newDb.select(newDb.recipeEntries).get(), isEmpty);
      },
    );
  });
}
