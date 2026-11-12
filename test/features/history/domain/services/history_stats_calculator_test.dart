import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_range.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_stats.dart';
import 'package:macro_cal_public/features/history/domain/entities/tracked_goal.dart';
import 'package:macro_cal_public/features/history/domain/services/history_stats_calculator.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';

DayLog _log(DateTime date, {required double kcal, double proteinG = 0}) =>
    DayLog(
      date: date,
      summary: DailySummary(
        goals: const NutritionGoals(dailyKcal: 2000),
        consumed: Nutrients(kcal: kcal, proteinG: proteinG, saltMg: 1000),
        burnedKcal: 100,
        adjustedKcal: 2100,
        sugarLimitG: 50,
        saturatedLimitG: 20,
      ),
    );

void main() {
  const calculator = HistoryStatsCalculator();
  final today = DateTime(2026, 11, 11, 18, 30);

  group('HistoryRange.since', () {
    test('includes today in the day count', () {
      expect(HistoryRange.week.since(today), DateTime(2026, 11, 5));
      expect(HistoryRange.month.since(today), DateTime(2026, 10, 13));
      expect(HistoryRange.all.since(today), isNull);
    });
  });

  group('inRange', () {
    final logs = [
      _log(DateTime(2026, 10), kcal: 1),
      _log(DateTime(2026, 11, 4), kcal: 2),
      _log(DateTime(2026, 11, 5), kcal: 3),
      _log(DateTime(2026, 11, 10), kcal: 4),
    ];

    test('keeps the days on or after the range start', () {
      expect(
        calculator
            .inRange(logs, range: HistoryRange.week, today: today)
            .map((log) => log.summary.consumed.kcal),
        [3, 4],
      );
      expect(
        calculator.inRange(logs, range: HistoryRange.all, today: today),
        logs,
      );
    });
  });

  group('currentStreak', () {
    test('counts back from today when today is logged', () {
      final logs = [
        _log(DateTime(2026, 11, 8), kcal: 0),
        _log(DateTime(2026, 11, 10), kcal: 0),
        _log(DateTime(2026, 11, 11), kcal: 0),
      ];
      expect(calculator.currentStreak(logs, today: today), 2);
    });

    test('counts back from yesterday while today is open', () {
      final logs = [
        _log(DateTime(2026, 11, 9), kcal: 0),
        _log(DateTime(2026, 11, 10), kcal: 0),
      ];
      expect(calculator.currentStreak(logs, today: today), 2);
    });

    test('is zero when neither today nor yesterday is logged', () {
      final logs = [_log(DateTime(2026, 11, 9), kcal: 0)];
      expect(calculator.currentStreak(logs, today: today), 0);
    });

    test('crosses a month boundary', () {
      final logs = [
        _log(DateTime(2026, 10, 31), kcal: 0),
        _log(DateTime(2026, 11), kcal: 0),
      ];
      expect(calculator.currentStreak(logs, today: DateTime(2026, 11, 2)), 2);
    });
  });

  group('calculate', () {
    test('returns empty stats with the streak when no day is in range', () {
      final stats = calculator.calculate(
        [_log(DateTime(2026, 11, 10), kcal: 2000)],
        range: HistoryRange.week,
        today: DateTime(2026, 12),
      );
      expect(stats, const HistoryStats());
      expect(stats.adherence(TrackedGoal.energy), 0);
    });

    test('averages the days and counts the goals met', () {
      final stats = calculator.calculate(
        [
          _log(DateTime(2026, 11, 9), kcal: 2000, proteinG: 120),
          _log(DateTime(2026, 11, 10), kcal: 500, proteinG: 50),
        ],
        range: HistoryRange.week,
        today: today,
      );

      expect(stats.daysLogged, 2);
      expect(stats.averageConsumed.kcal, 1250);
      expect(stats.averageConsumed.proteinG, 85);
      expect(stats.averageAdjustedKcal, 2100);
      expect(stats.averageBurnedKcal, 100);
      expect(stats.currentStreak, 2);
      expect(stats.daysMet, {
        TrackedGoal.energy: 1,
        TrackedGoal.protein: 1,
        TrackedGoal.fiber: 0,
        TrackedGoal.sugar: 2,
        TrackedGoal.saturated: 2,
        TrackedGoal.salt: 2,
      });
      expect(stats.adherence(TrackedGoal.energy), .5);
    });
  });

  test('calculate counts the streak over the recent logs when given', () {
    final stats = calculator.calculate(
      [_log(DateTime(2026, 11, 10), kcal: 2000)],
      range: HistoryRange.week,
      today: today,
      recentLogs: [
        _log(DateTime(2026, 11, 8), kcal: 0),
        _log(DateTime(2026, 11, 9), kcal: 0),
        _log(DateTime(2026, 11, 10), kcal: 0),
      ],
    );

    expect(stats.daysLogged, 1);
    expect(stats.currentStreak, 3);
  });

  group('TrackedGoal', () {
    final summary = _log(today, kcal: 1800, proteinG: 90).summary;

    test('reads the target and the consumed value of each goal', () {
      expect(TrackedGoal.energy.targetIn(summary), 2100);
      expect(TrackedGoal.energy.consumedIn(summary), 1800);
      expect(TrackedGoal.protein.targetIn(summary), 100);
      expect(TrackedGoal.sugar.targetIn(summary), 50);
      expect(TrackedGoal.saturated.targetIn(summary), 20);
      expect(TrackedGoal.salt.targetIn(summary), 5800);
      expect(TrackedGoal.salt.consumedIn(summary), 1000);
    });
  });
}
