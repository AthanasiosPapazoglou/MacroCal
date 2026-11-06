import 'package:drift/drift.dart' hide isNull;
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/today/data/repositories/drift_activity_repository.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity_entry.dart';

import '../../../../helpers/test_database.dart';

void main() {
  late AppDatabase database;
  late DriftActivityRepository repository;

  const walking = Activity(
    id: 1,
    presetKey: 'walking',
    name: 'Walking',
    kcalPerUnit: 50,
    unitLabel: 'Kilometers',
  );

  setUp(() {
    database = createTestDatabase();
    repository = DriftActivityRepository(database);
  });
  tearDown(() => database.close());

  Future<int> addCycling() => database
      .into(database.activitiesTable)
      .insert(
        ActivitiesTableCompanion.insert(
          name: 'Cycling',
          kcalPerUnit: 8,
          unitLabel: 'Minutes',
          isDurationBased: const Value(true),
        ),
      );

  test('a new database starts with the walking preset at 0', () async {
    expect(await repository.watchEntries().first, const [
      ActivityEntry(activity: walking, amount: 0),
    ]);
  });

  test('replaceAmounts stores amounts and skips zeros', () async {
    final cyclingId = await addCycling();

    await repository.replaceAmounts({walking.id: 3, cyclingId: 0});

    final entries = await repository.watchEntries().first;
    expect(entries.map((entry) => entry.amount), [3, 0]);
    expect(
      await database.select(database.activityEntriesTable).get(),
      hasLength(1),
    );
  });

  test('replaceAmounts overwrites earlier amounts', () async {
    await repository.replaceAmounts({walking.id: 3});
    await repository.replaceAmounts({walking.id: 5});

    expect((await repository.watchEntries().first).single.amount, 5);
  });

  test('resetAmounts clears every amount', () async {
    await repository.replaceAmounts({walking.id: 3});

    await repository.resetAmounts();

    expect((await repository.watchEntries().first).single.amount, 0);
  });

  test('watchEntries emits after a change', () async {
    final emitted = expectLater(
      repository.watchEntries().map((entries) => entries.single.amount),
      emitsInOrder([0, 4]),
    );
    await repository.watchEntries().first;
    await repository.replaceAmounts({walking.id: 4});

    await emitted;
  });

  test('deleting an activity deletes its entry', () async {
    final cyclingId = await addCycling();
    await repository.replaceAmounts({cyclingId: 20});

    await (database.delete(
      database.activitiesTable,
    )..where((activity) => activity.id.equals(cyclingId))).go();

    expect(await database.select(database.activityEntriesTable).get(), isEmpty);
  });
}
