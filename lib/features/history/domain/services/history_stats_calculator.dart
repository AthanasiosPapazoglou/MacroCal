import 'package:macro_cal_public/core/domain/date_only.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_filter.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_range.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_stats.dart';
import 'package:macro_cal_public/features/history/domain/entities/tracked_goal.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';
import 'package:macro_cal_public/features/today/domain/entities/intake_status.dart';
import 'package:macro_cal_public/features/today/domain/services/nutrition_calculator.dart';

class HistoryStatsCalculator {
  const new();

  static const _nutrition = NutritionCalculator();

  List<DayLog> inRange(
    Iterable<DayLog> logs, {
    required HistoryRange range,
    required DateTime today,
  }) {
    final since = range.since(today);
    return [
      for (final log in logs)
        if (since == null || !log.date.isBefore(since)) log,
    ];
  }

  bool isMet(TrackedGoal goal, DailySummary summary) =>
      _nutrition.status(
        goal: goal.targetIn(summary),
        consumed: goal.consumedIn(summary),
        kind: goal.kind,
      ) ==
      IntakeStatus.good;

  DayOutcome outcome(TrackedGoal goal, DailySummary summary) {
    if (isMet(goal, summary)) return DayOutcome.met;
    return goal.consumedIn(summary) > goal.targetIn(summary)
        ? DayOutcome.over
        : DayOutcome.under;
  }

  /// Logged days in a row ending today, or yesterday while today is open.
  int currentStreak(Iterable<DayLog> logs, {required DateTime today}) {
    final logged = {for (final log in logs) log.date.dateOnly};
    var day = today.dateOnly;
    if (!logged.contains(day)) day = DateTime(day.year, day.month, day.day - 1);
    var streak = 0;
    while (logged.contains(day)) {
      streak++;
      day = DateTime(day.year, day.month, day.day - 1);
    }
    return streak;
  }

  /// Counts the streak over [recentLogs] when given, else over [logs].
  HistoryStats calculate(
    Iterable<DayLog> logs, {
    required HistoryRange range,
    required DateTime today,
    Iterable<DayLog>? recentLogs,
  }) {
    final streak = currentStreak(recentLogs ?? logs, today: today);
    final days = inRange(logs, range: range, today: today);
    if (days.isEmpty) return HistoryStats(currentStreak: streak);
    final count = days.length;
    final summaries = days.map((log) => log.summary);
    final average = 1 / count;
    return HistoryStats(
      daysLogged: count,
      averageConsumed: summaries
          .fold(const Nutrients(), (total, summary) => total + summary.consumed)
          .scaled(average),
      averageAdjustedKcal:
          summaries.fold<double>(
            0,
            (total, summary) => total + summary.adjustedKcal,
          ) *
          average,
      averageBurnedKcal:
          summaries.fold<double>(
            0,
            (total, summary) => total + summary.burnedKcal,
          ) *
          average,
      daysMet: {
        for (final goal in TrackedGoal.values)
          goal: summaries.where((summary) => isMet(goal, summary)).length,
      },
      currentStreak: streak,
    );
  }
}
