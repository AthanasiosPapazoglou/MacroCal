import 'package:macro_cal_public/core/domain/date_only.dart';
import 'package:macro_cal_public/core/domain/transaction_runner.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';

class ArchiveDay {
  new(this._history, this._foodLog, this._activities, this._transaction);

  final HistoryRepository _history;
  final FoodLogRepository _foodLog;
  final ActivityRepository _activities;
  final TransactionRunner _transaction;

  Future<void> call({required DateTime date, required DailySummary summary}) =>
      _transaction.run(() async {
        await _history.saveDayLog(
          DayLog(date: date.dateOnly, summary: summary),
        );
        await _foodLog.clear();
        await _activities.resetAmounts();
      });
}
