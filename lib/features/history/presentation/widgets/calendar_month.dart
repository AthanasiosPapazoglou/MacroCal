import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:macro_cal_public/app/theme/intake_colors.dart';
import 'package:macro_cal_public/core/domain/date_only.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/history/domain/entities/date_period.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/entities/tracked_goal.dart';
import 'package:macro_cal_public/features/history/domain/services/history_stats_calculator.dart';
import 'package:macro_cal_public/features/today/domain/entities/goal_kind.dart';
import 'package:macro_cal_public/features/today/domain/services/nutrition_calculator.dart';

class CalendarMonth extends StatelessWidget {
  const new({
    required this.month,
    required this.days,
    required this.period,
    required this.matches,
    required this.today,
    required this.onDayTap,
    this.showTitle = true,
    super.key,
  });

  static const _nutrition = NutritionCalculator();
  static const _stats = HistoryStatsCalculator();

  final DateTime month;

  /// The month's archived days, keyed by date.
  final Map<DateTime, DayLog> days;
  final DatePeriod period;
  final bool Function(DayLog log) matches;
  final DateTime today;
  final ValueChanged<DayLog> onDayTap;
  final bool showTitle;

  /// Leading empty cells before day 1, for weeks starting on [firstWeekday].
  static int leadingBlanks(DateTime month, int firstWeekday) =>
      (DateTime(month.year, month.month).weekday % 7 - firstWeekday) % 7;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final material = MaterialLocalizations.of(context);
    final locale = Localizations.localeOf(context).toLanguageTag();
    final firstWeekday = material.firstDayOfWeekIndex;
    final dayCount = DateTime(month.year, month.month + 1, 0).day;
    final blanks = leadingBlanks(month, firstWeekday);
    final logs = days.values.toList();
    final met = logs
        .where((log) => _stats.isMet(TrackedGoal.energy, log.summary))
        .length;
    final average = logs.isEmpty
        ? 0
        : (logs.fold<double>(0, (sum, log) => sum + log.summary.consumed.kcal) /
                  logs.length)
              .round();
    final muted = Theme.of(context).colorScheme.onSurface.withValues(alpha: .6);
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (showTitle)
            Text(
              DateFormat.yMMMM(locale).format(month),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          const SizedBox(height: 4),
          Text(
            [
              l10n.historyDaysCount(logs.length),
              if (logs.isNotEmpty) ...[
                l10n.historyCalendarGoalMet(met),
                l10n.historyCalendarAverage(average),
              ],
            ].join('  ·  '),
            style: TextStyle(color: muted),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              for (var i = 0; i < 7; i++)
                Expanded(
                  child: Text(
                    material.narrowWeekdays[(firstWeekday + i) % 7],
                    textAlign: TextAlign.center,
                    style: TextStyle(color: muted),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 4),
          GridView.count(
            crossAxisCount: 7,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: [
              for (var i = 0; i < blanks; i++) const SizedBox.shrink(),
              for (var day = 1; day <= dayCount; day++)
                _dayCell(context, DateTime(month.year, month.month, day)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dayCell(BuildContext context, DateTime date) {
    final log = days[date];
    final scheme = Theme.of(context).colorScheme;
    final inPeriod = period.contains(date);
    final isToday = date == today.dateOnly;
    final color = log == null
        ? null
        : context.intakeColors.of(
            _nutrition.status(
              goal: log.summary.adjustedKcal,
              consumed: log.summary.consumed.kcal,
              kind: GoalKind.energy,
            ),
          );
    final cell = Container(
      key: ValueKey(date),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: isToday ? Border.all(color: scheme.primary, width: 2) : null,
      ),
      child: Text(
        '${date.day}',
        style: TextStyle(
          fontWeight: log == null ? FontWeight.normal : FontWeight.bold,
          color: log == null ? scheme.onSurface : Colors.black,
        ),
      ),
    );
    final dimmed = !inPeriod || (log != null && !matches(log));
    return Opacity(
      opacity: dimmed ? .25 : 1,
      child: log == null
          ? cell
          : InkWell(
              customBorder: const CircleBorder(),
              onTap: () => onDayTap(log),
              child: cell,
            ),
    );
  }
}
