import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';

class DriftHistoryRepository implements HistoryRepository {
  new(this._database);

  final AppDatabase _database;

  @override
  Stream<List<DayLog>> watchDayLogs() {
    final query = _database.select(_database.dayLogsTable)
      ..orderBy([(log) => OrderingTerm.asc(log.day)]);
    return query.watch().map((rows) => rows.map(_toEntity).toList());
  }

  @override
  Future<bool> hasLogFor(DateTime date) async {
    final query = _database.select(_database.dayLogsTable)
      ..where((log) => log.day.equals(_dayKey(date)));
    return await query.getSingleOrNull() != null;
  }

  @override
  Future<void> saveDayLog(DayLog log) {
    final companion = _toCompanion(log);
    return _database
        .into(_database.dayLogsTable)
        .insert(
          companion,
          onConflict: DoUpdate(
            (_) => companion,
            target: [_database.dayLogsTable.day],
          ),
        );
  }

  static String _dayKey(DateTime date) =>
      '${date.year.toString().padLeft(4, '0')}-'
      '${date.month.toString().padLeft(2, '0')}-'
      '${date.day.toString().padLeft(2, '0')}';

  DayLog _toEntity(DayLogRow row) => DayLog(
    date: DateTime.parse(row.day),
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

  DayLogsTableCompanion _toCompanion(DayLog log) {
    final summary = log.summary;
    final goals = summary.goals;
    final consumed = summary.consumed;
    return DayLogsTableCompanion.insert(
      day: _dayKey(log.date),
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
    );
  }
}
