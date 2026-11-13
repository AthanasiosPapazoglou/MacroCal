import 'package:flutter/material.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

/// Pops `true` when the user confirms the deletion.
class DeleteFoodDialog extends StatelessWidget {
  const new({required this.body, this.note, super.key});

  final String body;
  final String? note;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final note = this.note;
    return AlertDialog(
      title: Text(l10n.ingredientDetailsDeleteDialogTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(body),
          if (note != null) ...[const SizedBox(height: 12), Text(note)],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            l10n.ingredientDetailsDeleteDialogCancel,
            style: const TextStyle(color: AppColors.redAccent),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(l10n.ingredientDetailsDeleteDialogConfirm),
        ),
      ],
    );
  }
}
