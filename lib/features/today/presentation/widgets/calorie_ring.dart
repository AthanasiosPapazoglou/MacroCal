import 'package:flutter/material.dart';
import 'package:macro_cal_public/app/theme/intake_colors.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/today/domain/entities/goal_kind.dart';
import 'package:macro_cal_public/features/today/domain/services/nutrition_calculator.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CalorieRing extends StatelessWidget {
  const new({required this.goalKcal, required this.consumedKcal, super.key});

  static const _calculator = NutritionCalculator();

  final double goalKcal;
  final double consumedKcal;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final percent = _calculator.progress(
      goal: goalKcal,
      consumed: consumedKcal,
    );
    final color = context.intakeColors.of(
      _calculator.status(
        goal: goalKcal,
        consumed: consumedKcal,
        kind: GoalKind.energy,
      ),
    );
    final emphasis = TextStyle(fontWeight: FontWeight.bold, color: color);
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).hintColor.withValues(alpha: .2),
          ),
          child: CircularPercentIndicator(
            animation: true,
            animateFromLastPercent: true,
            radius: 100,
            lineWidth: 12,
            percent: percent,
            animationDuration: 1000,
            progressColor: color,
            backgroundColor: Colors.black.withValues(alpha: .3),
            center: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${consumedKcal.toInt()} / ${goalKcal.toInt()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  l10n.overviewPageIntakeInfoKcal,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  percent == 1
                      ? l10n.overviewPageIntakeInfoExceeding
                      : l10n.overviewPageIntakeInfoRemaining,
                  style: emphasis,
                ),
                Text(
                  '${(consumedKcal - goalKcal).abs().toInt()} kcal.',
                  style: emphasis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
