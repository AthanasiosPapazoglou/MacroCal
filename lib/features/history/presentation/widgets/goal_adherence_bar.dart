import 'package:flutter/material.dart';
import 'package:macro_cal_public/app/theme/intake_colors.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_stats.dart';
import 'package:macro_cal_public/features/history/domain/entities/tracked_goal.dart';
import 'package:macro_cal_public/features/history/presentation/history_labels.dart';
import 'package:macro_cal_public/features/today/domain/entities/goal_kind.dart';
import 'package:macro_cal_public/features/today/domain/services/nutrition_calculator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GoalAdherenceBar extends StatelessWidget {
  const new({required this.goal, required this.stats, super.key});

  static const _calculator = NutritionCalculator();

  final TrackedGoal goal;
  final HistoryStats stats;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final adherence = stats.adherence(goal);
    final color = context.intakeColors.of(
      _calculator.status(goal: 1, consumed: adherence, kind: GoalKind.minimum),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, bottom: 4),
            child: Text(
              goal.label(l10n),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          LinearPercentIndicator(
            lineHeight: 28,
            animation: true,
            animateFromLastPercent: true,
            animationDuration: 600,
            percent: adherence.clamp(0, 1),
            center: Text(
              l10n.historyPageDaysMet(
                stats.daysMet[goal] ?? 0,
                stats.daysLogged,
              ),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            progressColor: color,
            backgroundColor: Colors.black.withValues(alpha: .3),
            barRadius: const Radius.circular(20),
          ),
        ],
      ),
    );
  }
}
