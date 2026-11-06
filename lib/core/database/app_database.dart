import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:macro_cal_public/core/database/app_database.steps.dart';
import 'package:macro_cal_public/core/database/tables/profile_table.dart';
import 'package:macro_cal_public/core/database/tables/settings_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Settings, ProfileTable])
class AppDatabase extends _$AppDatabase {
  new([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onUpgrade: stepByStep(
      from1To2: (m, schema) => m.createTable(schema.profile),
    ),
  );

  static QueryExecutor _openConnection() => driftDatabase(
    name: 'macro_cal',
    web: DriftWebOptions(
      sqlite3Wasm: Uri.parse('sqlite3.wasm'),
      driftWorker: Uri.parse('drift_worker.js'),
    ),
  );
}
