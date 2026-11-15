import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/microcal/presentation/microcal_labels.dart';
import 'package:macro_cal_public/features/microcal/presentation/widgets/micro_nutrient_groups.dart';

/// An archived day's micronutrients against the references that applied then.
class DayMicronutrients extends StatelessWidget {
  const new({required this.log, super.key});

  final DayLog log;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final small = Theme.of(context).textTheme.bodySmall;
    final micros = log.micros;
    final references = log.references;
    if (micros == null) return Text(l10n.historyNoMicroData);
    if (references == null) return Text(l10n.microcalUnderAge);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          referenceIntakesLine(l10n, sex: log.sex, age: log.age),
          style: small,
        ),
        if (micros.isLowCoverage)
          Text(
            l10n.historyLowCoverage,
            style: small?.copyWith(fontStyle: FontStyle.italic),
          ),
        MicroNutrientGroups(intake: micros, references: references),
        const SizedBox(height: 16),
        Text(l10n.microcalAdequateIntakeNote, style: small),
        const SizedBox(height: 8),
        Text(l10n.microcalDisclaimer, style: small),
      ],
    );
  }
}
