import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/presentation/micronutrient_labels.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/outlined_field_decoration.dart';

class MicronutrientInput extends StatelessWidget {
  const new({
    required this.nutrient,
    required this.controller,
    required this.focusNode,
    required this.onSubmitted,
    super.key,
  });

  final Micronutrient nutrient;
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      onFieldSubmitted: (_) => onSubmitted(),
      decoration: outlinedFieldDecoration(
        label: '${nutrient.title(context.l10n)} (${nutrient.unitSymbol})',
      ),
    );
  }
}
