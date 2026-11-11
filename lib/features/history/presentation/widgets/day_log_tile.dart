import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/app/theme/intake_colors.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/today/domain/entities/goal_kind.dart';
import 'package:macro_cal_public/features/today/domain/services/nutrition_calculator.dart';

class DayLogTile extends StatelessWidget {
  const new({required this.log, super.key});

  static const _calculator = NutritionCalculator();

  final DayLog log;

  @override
  Widget build(BuildContext context) {
    final summary = log.summary;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final color = context.intakeColors.of(
      _calculator.status(
        goal: summary.adjustedKcal,
        consumed: summary.consumed.kcal,
        kind: GoalKind.energy,
      ),
    );
    return ListTile(
      onTap: () => context.push(AppRoutes.historyDay(log.date)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      leading: Icon(Icons.circle, color: color, size: 16),
      title: Text(DateFormat('EEE dd/MM/yyyy', locale).format(log.date)),
      trailing: Text(
        '${summary.consumed.kcal.round()} / ${summary.adjustedKcal.round()} '
        '${context.l10n.overviewPageIntakeInfoKcal}',
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
