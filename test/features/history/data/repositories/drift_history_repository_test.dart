import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/history/data/repositories/drift_history_repository.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';

import '../../../../helpers/sample_summary.dart';
import '../../../../helpers/test_database.dart';

void main() {
  late AppDatabase database;
  late DriftHistoryRepository repository;

  setUp(() {
    database = createTestDatabase();
    repository = DriftHistoryRepository(database);
  });
  tearDown(() => database.close());

  test('round-trips a whole day log', () async {
    final log = DayLog(date: DateTime(2026, 11, 6), summary: sampleSummary);

    await repository.saveDayLog(log);

    expect(await repository.watchDayLogs().first, [log]);
  });

  test('watchDayLog emits the log of that day or null', () async {
    final log = DayLog(date: DateTime(2026, 11, 6), summary: sampleSummary);
    await repository.saveDayLog(log);

    expect(await repository.watchDayLog(DateTime(2026, 11, 6, 20)).first, log);
    expect(await repository.watchDayLog(DateTime(2026, 11, 7)).first, isNull);
  });

  test('deleteDayLog removes only that day', () async {
    final kept = DayLog(date: DateTime(2026, 11, 7), summary: sampleSummary);
    await repository.saveDayLog(
      DayLog(date: DateTime(2026, 11, 6), summary: sampleSummary),
    );
    await repository.saveDayLog(kept);

    await repository.deleteDayLog(DateTime(2026, 11, 6, 18));

    expect(await repository.watchDayLogs().first, [kept]);
  });

  test('hasLogFor matches the same day at any time', () async {
    await repository.saveDayLog(
      DayLog(date: DateTime(2026, 10, 30, 9), summary: sampleSummary),
    );

    expect(await repository.hasLogFor(DateTime(2026, 10, 30, 21)), isTrue);
    expect(await repository.hasLogFor(DateTime(2026, 10, 31)), isFalse);
  });

  test('saving the same day again replaces the earlier log', () async {
    await repository.saveDayLog(
      DayLog(date: DateTime(2026, 11, 6), summary: sampleSummary),
    );
    final updated = sampleSummary.copyWith(adjustedKcal: 2000);

    await repository.saveDayLog(
      DayLog(date: DateTime(2026, 11, 6), summary: updated),
    );

    final logs = await repository.watchDayLogs().first;
    expect(logs, hasLength(1));
    expect(logs.single.summary.adjustedKcal, 2000);
  });

  test('watchDayLogs orders logs by day', () async {
    for (final day in [12, 3, 7]) {
      await repository.saveDayLog(
        DayLog(date: DateTime(2026, 11, day), summary: sampleSummary),
      );
    }

    final logs = await repository.watchDayLogs().first;
    expect(logs.map((log) => log.date.day), [3, 7, 12]);
  });
}
