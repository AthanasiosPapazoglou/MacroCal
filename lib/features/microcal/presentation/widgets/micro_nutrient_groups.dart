import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/presentation/micronutrient_labels.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/reference_intake.dart';
import 'package:macro_cal_public/features/microcal/presentation/widgets/micro_nutrient_bar.dart';

/// Vitamins, minerals and trace elements as bars against [references].
class MicroNutrientGroups extends StatelessWidget {
  const new({
    required this.intake,
    required this.references,
    this.onTap,
    super.key,
  });

  final MicroIntake intake;
  final Map<Micronutrient, ReferenceIntake> references;
  final void Function(Micronutrient nutrient)? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final onTap = this.onTap;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final group in MicronutrientGroup.values) ...[
          const SizedBox(height: 16),
          Text(
            group.title(l10n),
            style: Theme.of(context).textTheme.titleMedium,
          ),
          for (final nutrient in group.members)
            if (references[nutrient] case final reference?)
              MicroNutrientBar(
                nutrient: nutrient,
                intake: intake,
                reference: reference,
                onTap: onTap == null ? null : () => onTap(nutrient),
              ),
        ],
      ],
    );
  }
}
