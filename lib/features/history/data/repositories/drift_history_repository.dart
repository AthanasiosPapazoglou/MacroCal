import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/core/domain/date_only.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';

class DriftHistoryRepository implements HistoryRepository {
  new(this._database);

  final AppDatabase _database;

  @override
  Stream<List<DayLog>> watchDayLogs() => _watch();

  @override
  Stream<DayLog?> watchDayLog(DateTime date) =>
      _watch(date: date).map((logs) => logs.firstOrNull);

  @override
  Future<bool> hasLogFor(DateTime date) async {
    final query = _database.select(_database.dayLogsTable)
      ..where((log) => log.day.equals(date.isoDay));
    return await query.getSingleOrNull() != null;
  }

  @override
  Future<void> saveDayLog(DayLog log) => _database.transaction(() async {
    final companion = _toCompanion(log);
    final row = await _database
        .into(_database.dayLogsTable)
        .insertReturning(
          companion,
          onConflict: DoUpdate(
            (_) => companion,
            target: [_database.dayLogsTable.day],
          ),
        );
    await (_database.delete(
      _database.dayLogMicronutrientsTable,
    )..where((micro) => micro.dayLogId.equals(row.id))).go();
    final micros = log.micros;
    if (micros == null) return;
    await _database.batch(
      (batch) => batch.insertAll(_database.dayLogMicronutrientsTable, [
        for (final nutrient in Micronutrient.values)
          if (micros.food[nutrient] != null ||
              micros.supplements[nutrient] != null)
            DayLogMicronutrientsTableCompanion.insert(
              dayLogId: row.id,
              nutrient: nutrient.name,
              foodAmount: Value(micros.food[nutrient]),
              supplementAmount: Value(micros.supplements[nutrient]),
              coverage: micros.coverageOf(nutrient),
            ),
      ]),
    );
  });

  @override
  Future<void> deleteDayLog(DateTime date) => (_database.delete(
    _database.dayLogsTable,
  )..where((log) => log.day.equals(date.isoDay))).go();

  Stream<List<DayLog>> _watch({DateTime? date}) {
    final logs = _database.dayLogsTable;
    final micros = _database.dayLogMicronutrientsTable;
    final query = _database.select(logs).join([
      leftOuterJoin(micros, micros.dayLogId.equalsExp(logs.id)),
    ])..orderBy([OrderingTerm.asc(logs.day)]);
    if (date != null) query.where(logs.day.equals(date.isoDay));

    return query.watch().map((rows) {
      final microsByLog = <DayLogRow, List<DayLogMicronutrientRow>>{};
      for (final row in rows) {
        final logMicros = microsByLog.putIfAbsent(
          row.readTable(logs),
          () => [],
        );
        if (row.readTableOrNull(micros) case final micro?) {
          logMicros.add(micro);
        }
      }
      return [
        for (final MapEntry(key: log, value: logMicros) in microsByLog.entries)
          _toEntity(log, logMicros),
      ];
    });
  }

  DayLog _toEntity(DayLogRow row, List<DayLogMicronutrientRow> micros) =>
      DayLog(
        date: DateTime.parse(row.day),
        micros: _toMicroIntake(micros),
        sex: Sex.values.asNameMap()[row.sex],
        age: row.age,
        summary: DailySummary(
          goals: NutritionGoals(
            dailyKcal: row.dailyKcal,
            proteinG: row.proteinGoalG,
            fiberG: row.fiberGoalG,
            sugarLimitPct: row.sugarLimitPct,
            saturatedLimitPct: row.saturatedLimitPct,
            saltLimitMg: row.saltLimitMg,
          ),
          consumed: Nutrients(
            kcal: row.kcal,
            proteinG: row.proteinG,
            carbsG: row.carbsG,
            sugarsG: row.sugarsG,
            fatG: row.fatG,
            saturatedG: row.saturatedG,
            fiberG: row.fiberG,
            saltMg: row.saltMg,
          ),
          burnedKcal: row.burnedKcal,
          adjustedKcal: row.adjustedKcal,
          sugarLimitG: row.sugarLimitG,
          saturatedLimitG: row.saturatedLimitG,
        ),
      );

  MicroIntake? _toMicroIntake(List<DayLogMicronutrientRow> rows) {
    final food = <Micronutrient, double>{};
    final supplements = <Micronutrient, double>{};
    final coverage = <Micronutrient, double>{};
    for (final row in rows) {
      final nutrient = Micronutrient.values.asNameMap()[row.nutrient];
      if (nutrient == null) continue;
      if (row.foodAmount case final amount?) food[nutrient] = amount;
      if (row.supplementAmount case final amount?) {
        supplements[nutrient] = amount;
      }
      if (row.coverage > 0) coverage[nutrient] = row.coverage;
    }
    if (food.isEmpty && supplements.isEmpty) return null;
    return MicroIntake(
      food: Micronutrients(amounts: food),
      supplements: Micronutrients(amounts: supplements),
      coverage: coverage,
    );
  }

  DayLogsTableCompanion _toCompanion(DayLog log) {
    final summary = log.summary;
    final goals = summary.goals;
    final consumed = summary.consumed;
    return DayLogsTableCompanion.insert(
      day: log.date.isoDay,
      dailyKcal: goals.dailyKcal,
      proteinGoalG: goals.proteinG,
      fiberGoalG: goals.fiberG,
      sugarLimitPct: goals.sugarLimitPct,
      saturatedLimitPct: goals.saturatedLimitPct,
      saltLimitMg: goals.saltLimitMg,
      burnedKcal: summary.burnedKcal,
      adjustedKcal: summary.adjustedKcal,
      sugarLimitG: summary.sugarLimitG,
      saturatedLimitG: summary.saturatedLimitG,
      kcal: consumed.kcal,
      proteinG: consumed.proteinG,
      carbsG: consumed.carbsG,
      sugarsG: consumed.sugarsG,
      fatG: consumed.fatG,
      saturatedG: consumed.saturatedG,
      fiberG: consumed.fiberG,
      saltMg: consumed.saltMg,
      sex: Value(log.sex?.name),
      age: Value(log.age),
    );
  }
}
