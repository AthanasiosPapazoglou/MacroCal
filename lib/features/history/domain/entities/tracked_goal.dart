import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';
import 'package:macro_cal_public/features/today/domain/entities/goal_kind.dart';

enum TrackedGoal {
  energy(GoalKind.energy),
  protein(GoalKind.minimum),
  fiber(GoalKind.minimum),
  sugar(GoalKind.limit),
  saturated(GoalKind.limit),
  salt(GoalKind.limit);

  new(this.kind);

  final GoalKind kind;

  double targetIn(DailySummary summary) => switch (this) {
    energy => summary.adjustedKcal,
    protein => summary.goals.proteinG,
    fiber => summary.goals.fiberG,
    sugar => summary.sugarLimitG,
    saturated => summary.saturatedLimitG,
    salt => summary.goals.saltLimitMg,
  };

  double consumedIn(DailySummary summary) => switch (this) {
    energy => summary.consumed.kcal,
    protein => summary.consumed.proteinG,
    fiber => summary.consumed.fiberG,
    sugar => summary.consumed.sugarsG,
    saturated => summary.consumed.saturatedG,
    salt => summary.consumed.saltMg,
  };
}
