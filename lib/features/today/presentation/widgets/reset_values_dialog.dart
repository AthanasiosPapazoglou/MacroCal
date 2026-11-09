import 'package:flutter/material.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';

/// Pops `true` when the user confirms the reset.
class ResetValuesDialog extends StatelessWidget {
  const new({
    required this.title,
    required this.body,
    required this.cancelLabel,
    required this.confirmLabel,
    super.key,
  });

  final String title;
  final String body;
  final String cancelLabel;
  final String confirmLabel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelLabel),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            confirmLabel,
            style: const TextStyle(color: AppColors.confirmationButtonsColor),
          ),
        ),
      ],
    );
  }
}
