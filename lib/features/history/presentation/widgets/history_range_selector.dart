import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_range.dart';
import 'package:macro_cal_public/features/history/presentation/history_labels.dart';

class HistoryRangeSelector extends StatelessWidget {
  const new({required this.range, required this.onChanged, super.key});

  final HistoryRange range;
  final ValueChanged<HistoryRange> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SegmentedButton<HistoryRange>(
      showSelectedIcon: false,
      segments: [
        for (final range in HistoryRange.values)
          ButtonSegment(value: range, label: Text(range.label(l10n))),
      ],
      selected: {range},
      onSelectionChanged: (selection) => onChanged(selection.single),
    );
  }
}
