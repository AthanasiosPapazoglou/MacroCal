import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:macro_cal_public/core/database/app_database.steps.dart';
import 'package:macro_cal_public/core/database/seed/default_activities.dart';
import 'package:macro_cal_public/core/database/seed/ingredient_seed.dart';
import 'package:macro_cal_public/core/database/tables/activities_table.dart';
import 'package:macro_cal_public/core/database/tables/activity_entries_table.dart';
import 'package:macro_cal_public/core/database/tables/food_entries_table.dart';
import 'package:macro_cal_public/core/database/tables/ingredients_table.dart';
import 'package:macro_cal_public/core/database/tables/profile_table.dart';
import 'package:macro_cal_public/core/database/tables/settings_table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Settings,
    ProfileTable,
    ActivitiesTable,
    ActivityEntriesTable,
    IngredientsTable,
    FoodEntriesTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  new([QueryExecutor? executor, this._loadIngredientSeeds])
    : super(executor ?? _openConnection());

  final IngredientSeedLoader? _loadIngredientSeeds;

  @override
  int get schemaVersion => 4;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await seedDefaultActivities(this, activitiesTable);
      await _seedIngredients(ingredientsTable);
    },
    onUpgrade: stepByStep(
      from1To2: (m, schema) => m.createTable(schema.profile),
      from2To3: (m, schema) async {
        await m.createTable(schema.activities);
        await m.createTable(schema.activityEntries);
        await seedDefaultActivities(this, schema.activities);
      },
      from3To4: (m, schema) async {
        await m.createTable(schema.ingredients);
        await m.createTable(schema.foodEntries);
        await _seedIngredients(schema.ingredients);
      },
    ),
    beforeOpen: (_) => customStatement('PRAGMA foreign_keys = ON'),
  );

  Future<void> _seedIngredients<T extends Table, D>(
    TableInfo<T, D> ingredients,
  ) async {
    final loadSeeds = _loadIngredientSeeds;
    if (loadSeeds == null) return;
    await seedIngredients(this, ingredients, await loadSeeds());
  }

  static QueryExecutor _openConnection() => driftDatabase(
    name: 'macro_cal',
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.js'),
    ),
  );
}
