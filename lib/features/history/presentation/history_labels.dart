import 'package:intl/intl.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/history/domain/entities/date_period.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_filter.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_range.dart';
import 'package:macro_cal_public/features/history/domain/entities/tracked_goal.dart';

extension HistoryRangeLabel on HistoryRange {
  String label(AppLocalizations l10n) => switch (this) {
    HistoryRange.week => l10n.historyRangeWeek,
    HistoryRange.month => l10n.historyRangeMonth,
    HistoryRange.all => l10n.historyRangeAll,
  };
}

extension TrackedGoalLabel on TrackedGoal {
  String label(AppLocalizations l10n) => switch (this) {
    TrackedGoal.energy => l10n.historyGoalEnergy,
    TrackedGoal.protein => l10n.overviewPageNutrientsProtein,
    TrackedGoal.fiber => l10n.overviewPageNutrientsFiber,
    TrackedGoal.sugar => l10n.overviewPageNutrientsSugars,
    TrackedGoal.saturated => l10n.overviewPageNutrientsSaturated,
    TrackedGoal.salt => l10n.overviewPageNutrientsSalt,
  };
}

extension DayOutcomeLabel on DayOutcome {
  String label(AppLocalizations l10n) => switch (this) {
    DayOutcome.met => l10n.historyOutcomeMet,
    DayOutcome.under => l10n.historyOutcomeUnder,
    DayOutcome.over => l10n.historyOutcomeOver,
  };
}

extension DayFilterLabel on DayFilter {
  String label(AppLocalizations l10n) =>
      '${goal.label(l10n)}: ${outcome.label(l10n)}';
}

extension DatePeriodLabel on DatePeriod {
  String label(String locale) => switch (kind) {
    DatePeriodKind.month => DateFormat.yMMMM(locale).format(from),
    DatePeriodKind.year => DateFormat.y(locale).format(from),
    DatePeriodKind.range =>
      '${DateFormat('dd/MM/yy').format(from)} – '
          '${DateFormat('dd/MM/yy').format(to)}',
  };
}
