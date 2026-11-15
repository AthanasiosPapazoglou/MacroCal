import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/presentation/micronutrient_labels.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_stats.dart';

/// Each nutrient's average share of the reference over the range's days with
/// micronutrient data, and its average food coverage.
class MicroAverageList extends StatelessWidget {
  const new({required this.stats, super.key});

  final HistoryStats stats;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final small = theme.textTheme.bodySmall;
    final colors = theme.colorScheme;
    if (stats.microDays == 0) return Text(l10n.historyNoMicroDataRange);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l10n.historyMicroDays(stats.microDays, stats.daysLogged),
          style: small,
        ),
        Text(l10n.historyMicroAverageNote, style: small),
        for (final group in MicronutrientGroup.values) ...[
          const SizedBox(height: 16),
          Text(group.title(l10n), style: theme.textTheme.titleMedium),
          for (final nutrient in group.members)
            if (stats.microAverages[nutrient] case (
              :final percentOfReference,
              :final coverage,
            ))
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Text(nutrient.title(l10n))),
                        Text(
                          l10n.historyMicroAverage(percentOfReference.round()),
                          style: small,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    LinearProgressIndicator(
                      value: (percentOfReference / 100).clamp(0.0, 1.0),
                      minHeight: 10,
                      borderRadius: BorderRadius.circular(4),
                      color: colors.primary,
                      backgroundColor: colors.surfaceContainerHighest,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      l10n.microcalCoverage((coverage * 100).round()),
                      style: small,
                    ),
                  ],
                ),
              ),
        ],
        const SizedBox(height: 16),
        Text(l10n.microcalDisclaimer, style: small),
      ],
    );
  }
}
