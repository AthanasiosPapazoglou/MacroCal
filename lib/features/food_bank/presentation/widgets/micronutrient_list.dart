import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/presentation/micronutrient_labels.dart';

/// Micronutrient amounts by group, with a dash for unknown ones.
class MicronutrientList extends StatelessWidget {
  const new({required this.micros, this.title, super.key});

  static const unknown = '—';

  final Micronutrients micros;

  /// Defaults to the per 100 g heading.
  final String? title;

  static String format(double amount) =>
      double.parse(amount.toStringAsFixed(3)).toString();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 8),
          child: Text(
            title ?? l10n.micronutrientsPer100g,
            style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        for (final group in MicronutrientGroup.values) ...[
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 4),
            child: Text(group.title(l10n), style: textTheme.titleMedium),
          ),
          for (final nutrient in group.members)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(nutrient.title(l10n), style: textTheme.bodyLarge),
                  Text(switch (micros[nutrient]) {
                    final amount? => '${format(amount)} ${nutrient.unitSymbol}',
                    null => unknown,
                  }, style: textTheme.bodyLarge),
                ],
              ),
            ),
        ],
      ],
    );
  }
}
