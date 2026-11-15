import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/presentation/micronutrient_labels.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/reference_intake.dart';
import 'package:macro_cal_public/features/microcal/domain/services/micro_intake_calculator.dart';
import 'package:macro_cal_public/features/microcal/presentation/microcal_labels.dart';

/// A nutrient's reference values, description and today's top contributors.
class MicroNutrientSheet extends StatelessWidget {
  const new({
    required this.nutrient,
    required this.reference,
    required this.contributors,
    super.key,
  });

  static const maxContributors = 5;

  final Micronutrient nutrient;
  final ReferenceIntake reference;
  final List<MicroContributor> contributors;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final target = nutrient.formatAmount(reference.target, l10n);
    final source = reference.source.label(l10n);
    final upperLimit = reference.upperLimit;
    return SafeArea(
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        children: [
          Text(nutrient.title(l10n), style: theme.textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            reference.isAdequateIntake
                ? l10n.microcalAdequateIntakeLine(target, source)
                : l10n.microcalReferenceLine(target, source),
          ),
          if (upperLimit != null)
            Text(
              switch (upperLimit.scope) {
                UpperLimitScope.allIntake => l10n.microcalUpperLimitLine,
                UpperLimitScope.supplementsOnly =>
                  l10n.microcalUpperLimitSupplementsLine,
              }(
                nutrient.formatAmount(upperLimit.amount, l10n),
                upperLimit.source.label(l10n),
              ),
            ),
          const SizedBox(height: 12),
          Text(nutrient.about(l10n)),
          const SizedBox(height: 16),
          Text(
            l10n.microcalTopContributors,
            style: theme.textTheme.titleMedium,
          ),
          if (contributors.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(l10n.microcalNoContributors),
            ),
          for (final contributor in contributors.take(maxContributors))
            ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                contributor.isSupplement
                    ? Icons.medication_rounded
                    : Icons.restaurant_rounded,
              ),
              title: Text(contributor.name),
              trailing: Text(nutrient.formatAmount(contributor.amount, l10n)),
            ),
          const SizedBox(height: 12),
          Text(l10n.microcalDisclaimer, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }
}
