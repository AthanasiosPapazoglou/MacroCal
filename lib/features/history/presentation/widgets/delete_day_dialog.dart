import 'package:flutter/material.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

/// Pops `true` when the user confirms the deletion.
class DeleteDayDialog extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.historyDayDeleteTitle),
      content: Text(l10n.historyDayDeleteBody),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(l10n.ingredientDetailsDeleteDialogCancel),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            l10n.ingredientDetailsButtonSideActionsDeleteButton,
            style: const TextStyle(color: AppColors.redAccent),
          ),
        ),
      ],
    );
  }
}
