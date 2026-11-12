import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/history/domain/entities/date_period.dart';
import 'package:macro_cal_public/features/history/presentation/history_labels.dart';

class PeriodBar extends StatelessWidget {
  const new({
    required this.period,
    required this.onPrevious,
    required this.onNext,
    required this.onSelected,
    super.key,
  });

  final DatePeriod period;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final ValueChanged<DatePeriod> onSelected;

  Future<void> _choose(BuildContext context) async {
    final l10n = context.l10n;
    final kind = await showModalBottomSheet<DatePeriodKind>(
      context: context,
      isScrollControlled: true,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(title: Text(l10n.historyDaysPeriodTitle)),
            for (final (kind, label, icon) in [
              (
                DatePeriodKind.month,
                l10n.historyDaysPeriodMonth,
                Icons.calendar_view_month_rounded,
              ),
              (
                DatePeriodKind.year,
                l10n.historyDaysPeriodYear,
                Icons.calendar_today_rounded,
              ),
              (
                DatePeriodKind.range,
                l10n.historyDaysPeriodRange,
                Icons.date_range_rounded,
              ),
            ])
              ListTile(
                leading: Icon(icon),
                title: Text(label),
                selected: kind == period.kind,
                onTap: () => Navigator.of(context).pop(kind),
              ),
          ],
        ),
      ),
    );
    if (kind == null || !context.mounted) return;
    final today = DateTime.now();
    final first = DateTime(2000);
    final last = today.isAfter(period.to) ? today : period.to;
    if (kind == DatePeriodKind.range) {
      final range = await showDateRangePicker(
        context: context,
        firstDate: first,
        lastDate: last,
        initialDateRange: DateTimeRange(start: period.from, end: period.to),
      );
      if (range != null) onSelected(DatePeriod.between(range.start, range.end));
      return;
    }
    final picked = await showDatePicker(
      context: context,
      firstDate: first,
      lastDate: last,
      initialDate: period.from,
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked == null) return;
    onSelected(
      kind == DatePeriodKind.month
          ? DatePeriod.monthOf(picked)
          : DatePeriod.yearOf(picked),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    return Row(
      children: [
        IconButton(
          tooltip: l10n.historyDaysPrevious,
          icon: const Icon(Icons.chevron_left_rounded),
          onPressed: onPrevious,
        ),
        Expanded(
          child: TextButton(
            onPressed: () => _choose(context),
            child: Text(
              period.label(locale),
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        IconButton(
          tooltip: l10n.historyDaysNext,
          icon: const Icon(Icons.chevron_right_rounded),
          onPressed: onNext,
        ),
      ],
    );
  }
}
