import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

/// Pops true to copy the macros as well, false for micronutrients only.
class ReferenceCopyDialog extends StatelessWidget {
  const new({required this.name, super.key});

  final String name;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.referenceFoodsCopyTitle(name)),
      content: Text(l10n.referenceFoodsCopyBody),
      actions: [
        TextButton(
          onPressed: () => context.pop(),
          child: Text(l10n.referenceFoodsCopyCancel),
        ),
        TextButton(
          onPressed: () => context.pop(false),
          child: Text(l10n.referenceFoodsCopyMicros),
        ),
        TextButton(
          onPressed: () => context.pop(true),
          child: Text(l10n.referenceFoodsCopyAll),
        ),
      ],
    );
  }
}
