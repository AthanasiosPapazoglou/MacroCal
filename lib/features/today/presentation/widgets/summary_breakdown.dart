import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';
import 'package:macro_cal_public/features/today/domain/entities/goal_kind.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/calorie_ring.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/nutrient_progress_bar.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/section_header.dart';

/// The calorie ring and nutrient bars of one day against its goals.
class SummaryBreakdown extends StatelessWidget {
  const new({required this.summary, super.key});

  final DailySummary summary;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final goals = summary.goals;
    final consumed = summary.consumed;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(l10n.overviewPageIntake),
        CalorieRing(
          goalKcal: summary.adjustedKcal,
          consumedKcal: consumed.kcal,
        ),
        SectionHeader(l10n.overviewPageHealthy),
        NutrientProgressBar(
          title: l10n.overviewPageNutrientsProtein,
          goal: goals.proteinG,
          consumed: consumed.proteinG,
          kind: GoalKind.minimum,
        ),
        NutrientProgressBar(
          title: l10n.overviewPageNutrientsFiber,
          goal: goals.fiberG,
          consumed: consumed.fiberG,
          kind: GoalKind.minimum,
        ),
        SectionHeader(l10n.overviewPageUnhealthy),
        NutrientProgressBar(
          title: l10n.overviewPageNutrientsSugars,
          goal: summary.sugarLimitG,
          consumed: consumed.sugarsG,
          kind: GoalKind.limit,
        ),
        NutrientProgressBar(
          title: l10n.overviewPageNutrientsSaturated,
          goal: summary.saturatedLimitG,
          consumed: consumed.saturatedG,
          kind: GoalKind.limit,
        ),
        NutrientProgressBar(
          title: l10n.overviewPageNutrientsSalt,
          goal: goals.saltLimitMg,
          consumed: consumed.saltMg,
          kind: GoalKind.limit,
          showDecimals: false,
        ),
      ],
    );
  }
}
