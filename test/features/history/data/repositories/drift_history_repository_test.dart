import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/history/data/repositories/drift_history_repository.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';

import '../../../../helpers/sample_summary.dart';
import '../../../../helpers/test_database.dart';

void main() {
  late AppDatabase database;
  late DriftHistoryRepository repository;

  const intake = MicroIntake(
    food: Micronutrients(
      amounts: {Micronutrient.iron: 8.2, Micronutrient.vitaminC: 0},
    ),
    supplements: Micronutrients(
      amounts: {Micronutrient.vitaminD: 25, Micronutrient.iron: 5},
    ),
    coverage: {Micronutrient.iron: 0.6, Micronutrient.vitaminC: 1},
  );

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

  test('round-trips micros with the sex and age of the day', () async {
    final log = DayLog(
      date: DateTime(2026, 11, 6),
      summary: sampleSummary,
      micros: intake,
      sex: Sex.female,
      age: 36,
    );

    await repository.saveDayLog(log);

    expect(await repository.watchDayLogs().first, [log]);
    expect(await repository.watchDayLog(DateTime(2026, 11, 6)).first, log);
  });

  test('a day without micros reads back as no data', () async {
    await repository.saveDayLog(
      DayLog(date: DateTime(2026, 11, 6), summary: sampleSummary),
    );

    final log = await repository.watchDayLog(DateTime(2026, 11, 6)).first;
    expect(log!.micros, isNull);
    expect(log.sex, isNull);
    expect(log.age, isNull);
  });

  test('saving the same day again replaces its micros', () async {
    final date = DateTime(2026, 11, 6);
    const later = MicroIntake(
      food: Micronutrients(amounts: {Micronutrient.zinc: 7}),
      coverage: {Micronutrient.zinc: 0.9},
    );
    await repository.saveDayLog(
      DayLog(date: date, summary: sampleSummary, micros: intake),
    );

    await repository.saveDayLog(
      DayLog(date: date, summary: sampleSummary, micros: later),
    );

    expect((await repository.watchDayLog(date).first)!.micros, later);
  });

  test('deleteDayLog removes its micros', () async {
    final date = DateTime(2026, 11, 6);
    await repository.saveDayLog(
      DayLog(date: date, summary: sampleSummary, micros: intake),
    );

    await repository.deleteDayLog(date);

    expect(
      await database.select(database.dayLogMicronutrientsTable).get(),
      isEmpty,
    );
  });
}
