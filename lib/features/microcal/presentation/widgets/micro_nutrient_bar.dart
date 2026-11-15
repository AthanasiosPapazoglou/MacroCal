import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/presentation/micronutrient_labels.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/reference_intake.dart';
import 'package:macro_cal_public/features/microcal/presentation/microcal_labels.dart';

/// One nutrient as a share of its reference: food and supplements stacked,
/// the food coverage as a thin line above.
class MicroNutrientBar extends StatelessWidget {
  const new({
    required this.nutrient,
    required this.intake,
    required this.reference,
    required this.onTap,
    super.key,
  });

  final Micronutrient nutrient;
  final MicroIntake intake;
  final ReferenceIntake reference;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final small = theme.textTheme.bodySmall;
    final total = intake.total(nutrient);
    final food = intake.food[nutrient] ?? 0;
    final supplements = intake.supplements[nutrient] ?? 0;
    final scale = reference.target > (total ?? 0)
        ? reference.target
        : total ?? 1;
    final coverage = intake.coverageOf(nutrient).clamp(0.0, 1.0);
    final upperLimit = reference.upperLimit;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${nutrient.title(l10n)}'
                    '${reference.isAdequateIntake ? ' *' : ''}',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                Text(switch (total) {
                  final total? =>
                    '${nutrient.formatAmount(total, l10n)}'
                        ' / ${nutrient.formatAmount(reference.target, l10n)}'
                        '  ${(total / reference.target * 100).round()}%',
                  null =>
                    '– / ${nutrient.formatAmount(reference.target, l10n)}',
                }, style: small),
              ],
            ),
            const SizedBox(height: 4),
            FractionallySizedBox(
              alignment: AlignmentDirectional.centerStart,
              widthFactor: coverage,
              child: Container(height: 2, color: colors.outline),
            ),
            const SizedBox(height: 2),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                height: 10,
                child: ColoredBox(
                  color: colors.surfaceContainerHighest,
                  child: Row(
                    children: [
                      for (final (amount, color) in [
                        (food, colors.primary),
                        (supplements, colors.tertiary),
                        (scale - food - supplements, Colors.transparent),
                      ])
                        if (amount * 1000 / scale case final flex
                            when flex >= 1)
                          Expanded(
                            flex: flex.round(),
                            child: ColoredBox(color: color),
                          ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            Text(l10n.microcalCoverage((coverage * 100).round()), style: small),
            if (upperLimit != null &&
                intake.isAboveUpperLimit(nutrient, reference))
              Text(switch (upperLimit.scope) {
                UpperLimitScope.allIntake => l10n.microcalAboveUpperLimit(
                  upperLimit.source.label(l10n),
                ),
                UpperLimitScope.supplementsOnly =>
                  l10n.microcalSupplementsAboveUpperLimit(
                    upperLimit.source.label(l10n),
                  ),
              }, style: small?.copyWith(fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }
}
