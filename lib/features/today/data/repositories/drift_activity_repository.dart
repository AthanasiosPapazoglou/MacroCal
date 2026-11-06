import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity_entry.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';

class DriftActivityRepository implements ActivityRepository {
  new(this._database);

  final AppDatabase _database;

  @override
  Stream<List<ActivityEntry>> watchEntries() {
    final activities = _database.activitiesTable;
    final entries = _database.activityEntriesTable;
    final query = _database.select(activities).join([
      leftOuterJoin(entries, entries.activityId.equalsExp(activities.id)),
    ])..orderBy([OrderingTerm.asc(activities.id)]);

    return query.watch().map(
      (rows) => [
        for (final row in rows)
          ActivityEntry(
            activity: _toActivity(row.readTable(activities)),
            amount: row.readTableOrNull(entries)?.amount ?? 0,
          ),
      ],
    );
  }

  @override
  Future<void> replaceAmounts(Map<int, int> amountsByActivityId) =>
      _database.transaction(() async {
        await _database.delete(_database.activityEntriesTable).go();
        await _database.batch(
          (batch) => batch.insertAll(_database.activityEntriesTable, [
            for (final MapEntry(key: activityId, value: amount)
                in amountsByActivityId.entries)
              if (amount > 0)
                ActivityEntriesTableCompanion.insert(
                  activityId: activityId,
                  amount: amount,
                ),
          ]),
        );
      });

  @override
  Future<void> resetAmounts() =>
      _database.delete(_database.activityEntriesTable).go();

  Activity _toActivity(ActivityRow row) => Activity(
    id: row.id,
    presetKey: row.presetKey,
    name: row.name,
    kcalPerUnit: row.kcalPerUnit,
    unitLabel: row.unitLabel,
    isDurationBased: row.isDurationBased,
  );
}
