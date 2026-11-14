import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';
import 'package:macro_cal_public/features/profile/presentation/profile_field_labels.dart';

/// Picks a sex or none; tapping the chosen one clears it.
class SexSelector extends StatelessWidget {
  const new({required this.sex, required this.onChanged, super.key});

  final Sex? sex;
  final ValueChanged<Sex?> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Text(l10n.profilePageSex),
        const SizedBox(height: 8),
        SegmentedButton<Sex>(
          segments: [
            for (final value in Sex.values)
              ButtonSegment(value: value, label: Text(value.label(l10n))),
          ],
          selected: {?sex},
          emptySelectionAllowed: true,
          showSelectedIcon: false,
          onSelectionChanged: (selection) => onChanged(selection.firstOrNull),
        ),
      ],
    );
  }
}
