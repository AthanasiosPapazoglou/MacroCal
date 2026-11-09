import 'package:flutter/material.dart';
import 'package:macro_cal_public/app/theme/intake_colors.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/today/domain/entities/goal_kind.dart';
import 'package:macro_cal_public/features/today/domain/services/nutrition_calculator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class NutrientProgressBar extends StatelessWidget {
  const new({
    required this.title,
    required this.goal,
    required this.consumed,
    required this.kind,
    this.showDecimals = true,
    super.key,
  });

  static const _calculator = NutritionCalculator();

  final String title;
  final double goal;
  final double consumed;
  final GoalKind kind;
  final bool showDecimals;

  String _heading(AppLocalizations l10n) {
    final surpassed = l10n.overviewPageSurpassed(title);
    final percent = _calculator.surpassedPercent(
      goal: goal,
      consumed: consumed,
    );
    return percent == null ? surpassed : '$surpassed ($percent%)';
  }

  @override
  Widget build(BuildContext context) {
    final isSurpassed = consumed > goal;
    final statusColor = context.intakeColors.of(
      _calculator.status(goal: goal, consumed: consumed, kind: kind),
    );
    final barColor = isSurpassed && kind == GoalKind.minimum
        ? Colors.green
        : statusColor;
    final value = showDecimals
        ? (consumed * 10).truncateToDouble() / 10
        : consumed.toInt();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              isSurpassed ? _heading(context.l10n) : title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSurpassed ? barColor : Colors.white,
              ),
            ),
          ),
          Center(
            child: LinearPercentIndicator(
              lineHeight: 35,
              animation: true,
              animateFromLastPercent: true,
              percent: _calculator.progress(goal: goal, consumed: consumed),
              center: Text(
                '$value / ${goal.toInt()}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              animationDuration: 1000,
              progressColor: barColor,
              backgroundColor: Colors.black.withValues(alpha: .3),
              barRadius: const Radius.circular(20),
            ),
          ),
        ],
      ),
    );
  }
}
