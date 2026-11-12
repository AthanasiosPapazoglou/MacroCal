import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_filter.dart';
import 'package:macro_cal_public/features/history/domain/entities/tracked_goal.dart';
import 'package:macro_cal_public/features/history/presentation/history_labels.dart';

class DayFilterBar extends StatelessWidget {
  const new({
    required this.filter,
    required this.count,
    required this.onChanged,
    super.key,
  });

  final DayFilter? filter;
  final int count;
  final ValueChanged<DayFilter?> onChanged;

  Future<void> _edit(BuildContext context) async {
    final picked = await showModalBottomSheet<DayFilter>(
      context: context,
      isScrollControlled: true,
      builder: (_) => _FilterSheet(initial: filter),
    );
    if (picked != null) onChanged(picked);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final filter = this.filter;
    return Row(
      children: [
        if (filter == null)
          ActionChip(
            avatar: const Icon(Icons.filter_list_rounded),
            label: Text(l10n.historyDaysFilter),
            onPressed: () => _edit(context),
          )
        else
          InputChip(
            avatar: const Icon(Icons.filter_list_rounded),
            label: Text(filter.label(l10n)),
            onPressed: () => _edit(context),
            onDeleted: () => onChanged(null),
            deleteButtonTooltipMessage: l10n.historyDaysFilterClear,
          ),
        const Spacer(),
        Text(l10n.historyDaysCount(count)),
        const SizedBox(width: 8),
      ],
    );
  }
}

class _FilterSheet extends StatefulWidget {
  const new({required this.initial});

  final DayFilter? initial;

  @override
  State<_FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<_FilterSheet> {
  late TrackedGoal _goal = widget.initial?.goal ?? TrackedGoal.energy;
  late DayOutcome _outcome = widget.initial?.outcome ?? DayOutcome.met;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final heading = Theme.of(context).textTheme.titleMedium;
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.historyDaysFilterGoal, style: heading),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final goal in TrackedGoal.values)
                  ChoiceChip(
                    label: Text(goal.label(l10n)),
                    selected: goal == _goal,
                    onSelected: (_) => setState(() => _goal = goal),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(l10n.historyDaysFilterOutcome, style: heading),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                for (final outcome in DayOutcome.values)
                  ChoiceChip(
                    label: Text(outcome.label(l10n)),
                    selected: outcome == _outcome,
                    onSelected: (_) => setState(() => _outcome = outcome),
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                onPressed: () =>
                    Navigator.of(context)
                        .pop(DayFilter(goal: _goal, outcome: _outcome)),
                child: Text(l10n.historyDaysFilterApply),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
