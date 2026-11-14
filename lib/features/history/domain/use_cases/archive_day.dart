import 'package:macro_cal_public/core/domain/date_only.dart';
import 'package:macro_cal_public/core/domain/transaction_runner.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/microcal/domain/services/micro_intake_calculator.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';

/// Saves the day with its micronutrients, sex and age, then clears today.
class ArchiveDay {
  new(
    this._history,
    this._foodLog,
    this._activities,
    this._profile,
    this._transaction,
  );

  final HistoryRepository _history;
  final FoodLogRepository _foodLog;
  final ActivityRepository _activities;
  final ProfileRepository _profile;
  final TransactionRunner _transaction;

  Future<void> call({
    required DateTime date,
    required DailySummary summary,
  }) async {
    final day = date.dateOnly;
    final micros = const MicroIntakeCalculator().intake(
      foodEntries: await _foodLog.watchEntries().first,
      supplementEntries: await _foodLog.watchSupplementEntries().first,
    );
    final profile = await _profile.watchProfile().first;
    await _transaction.run(() async {
      await _history.saveDayLog(
        DayLog(
          date: day,
          summary: summary,
          micros: micros.food.isEmpty && micros.supplements.isEmpty
              ? null
              : micros,
          sex: profile.sex,
          age: profile.ageOn(day),
        ),
      );
      await _foodLog.clear();
      await _activities.resetAmounts();
    });
  }
}
