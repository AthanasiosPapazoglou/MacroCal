import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity_entry.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
import 'package:macro_cal_public/features/today/domain/entities/goal_kind.dart';
import 'package:macro_cal_public/features/today/domain/entities/intake_status.dart';

class NutritionCalculator {
  const new();

  static const double sugarKcalPerGram = 4;
  static const double saturatedFatKcalPerGram = 9;

  Nutrients consumed(Iterable<FoodEntry> entries) => entries.fold(
    const Nutrients(),
    (total, entry) =>
        total + entry.ingredient.per100g.scaled(entry.grams * 0.01),
  );

  double burnedKcal(Iterable<ActivityEntry> entries) => entries.fold(
    0,
    (total, entry) => total + entry.activity.kcalPerUnit * entry.amount,
  );

  double limitGrams({
    required double percent,
    required double adjustedKcal,
    required double kcalPerGram,
  }) => (percent * 0.01 * adjustedKcal / kcalPerGram).floorToDouble();

  DailySummary summarize({
    required NutritionGoals goals,
    required Iterable<FoodEntry> foodEntries,
    required Iterable<ActivityEntry> activityEntries,
  }) {
    final burned = burnedKcal(activityEntries);
    final adjusted = goals.dailyKcal + burned;
    return DailySummary(
      goals: goals,
      consumed: consumed(foodEntries),
      burnedKcal: burned,
      adjustedKcal: adjusted,
      sugarLimitG: limitGrams(
        percent: goals.sugarLimitPct,
        adjustedKcal: adjusted,
        kcalPerGram: sugarKcalPerGram,
      ),
      saturatedLimitG: limitGrams(
        percent: goals.saturatedLimitPct,
        adjustedKcal: adjusted,
        kcalPerGram: saturatedFatKcalPerGram,
      ),
    );
  }

  double progress({required double goal, required double consumed}) {
    if (goal <= 0) return consumed > goal ? 1 : 0;
    return (consumed / goal).clamp(0, 1);
  }

  int? surpassedPercent({required double goal, required double consumed}) {
    if (goal <= 0 || consumed <= goal) return null;
    return ((consumed / goal - 1) * 100).floor();
  }

  IntakeStatus status({
    required double goal,
    required double consumed,
    required GoalKind kind,
  }) {
    if (kind == GoalKind.minimum && consumed > goal) return IntakeStatus.good;
    final ratio = goal > 0
        ? consumed / goal
        : (consumed > goal ? double.infinity : 0);
    final aimsForGoal = kind != GoalKind.limit;
    return switch (ratio) {
      < .3 => aimsForGoal ? IntakeStatus.critical : IntakeStatus.good,
      < .6 => aimsForGoal ? IntakeStatus.warning : IntakeStatus.good,
      < .85 => IntakeStatus.caution,
      <= 1.1 => aimsForGoal ? IntakeStatus.good : IntakeStatus.warning,
      <= 1.2 => aimsForGoal ? IntakeStatus.caution : IntakeStatus.critical,
      <= 1.3 => aimsForGoal ? IntakeStatus.warning : IntakeStatus.critical,
      _ => IntakeStatus.critical,
    };
  }
}
