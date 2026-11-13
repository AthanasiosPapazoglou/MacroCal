import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_field.dart';
import 'package:macro_cal_public/features/food_bank/presentation/ingredient_field_labels.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/outlined_field_decoration.dart';

class IngredientFieldInput extends StatelessWidget {
  const new({
    required this.field,
    required this.controller,
    required this.focusNode,
    required this.onSubmitted,
    super.key,
  });

  final IngredientField field;
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final isText =
        field == IngredientField.name || field == IngredientField.category;
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: isText ? null : TextInputType.number,
      validator: (value) =>
          field == IngredientField.name && (value ?? '').trim().isEmpty
          ? l10n.ingredientsPageNameRequired
          : null,
      onFieldSubmitted: (_) => onSubmitted(),
      decoration: outlinedFieldDecoration(
        label: field.label(l10n),
        hint: field.hint(l10n),
      ),
    );
  }
}
