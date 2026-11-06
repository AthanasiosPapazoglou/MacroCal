import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/core/database/drift_transaction_runner.dart';
import 'package:macro_cal_public/features/history/data/repositories/drift_history_repository.dart';
import 'package:macro_cal_public/features/history/domain/use_cases/archive_day.dart';
import 'package:macro_cal_public/features/today/data/repositories/drift_activity_repository.dart';
import 'package:macro_cal_public/features/today/data/repositories/drift_food_log_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/ingredient_seeds.dart';
import '../../../../helpers/sample_summary.dart';
import '../../../../helpers/test_database.dart';

class _FailingActivityRepository extends Mock implements ActivityRepository;

void main() {
  late AppDatabase database;
  late DriftHistoryRepository history;
  late DriftFoodLogRepository foodLog;
  late DriftActivityRepository activities;

  setUp(() async {
    database = createTestDatabase(ingredientSeeds: testIngredientSeeds);
    history = DriftHistoryRepository(database);
    foodLog = DriftFoodLogRepository(database);
    activities = DriftActivityRepository(database);
    await foodLog.replaceGrams({1: 200, 2: 50});
    await activities.replaceAmounts({1: 3});
  });
  tearDown(() => database.close());

  test('saves the day as a date-only log and clears today', () async {
    final archiveDay = ArchiveDay(
      history,
      foodLog,
      activities,
      DriftTransactionRunner(database),
    );

    await archiveDay(
      date: DateTime(2026, 11, 6, 23, 15),
      summary: sampleSummary,
    );

    final logs = await history.watchDayLogs().first;
    expect(logs.single.date, DateTime(2026, 11, 6));
    expect(logs.single.summary, sampleSummary);
    expect(await foodLog.watchEntries().first, isEmpty);
    expect((await activities.watchEntries().first).single.amount, 0);
  });

  test('rolls everything back when a step fails', () async {
    final failingActivities = _FailingActivityRepository();
    when(failingActivities.resetAmounts).thenThrow(Exception('db'));
    final archiveDay = ArchiveDay(
      history,
      foodLog,
      failingActivities,
      DriftTransactionRunner(database),
    );

    await expectLater(
      archiveDay(date: DateTime(2026, 11, 6), summary: sampleSummary),
      throwsException,
    );

    expect(await history.watchDayLogs().first, isEmpty);
    expect(await foodLog.watchEntries().first, hasLength(2));
  });
}
