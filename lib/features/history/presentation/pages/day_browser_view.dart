import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:macro_cal_public/core/assets/app_assets.dart';
import 'package:macro_cal_public/core/domain/date_only.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/empty_state.dart';
import 'package:macro_cal_public/core/widgets/loader.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_filter.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_browser_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_browser_state.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/calendar_month.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/day_filter_bar.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/day_log_tile.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/period_bar.dart';

class DayBrowserView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<DayBrowserCubit>();
    final state = context.watch<DayBrowserCubit>().state;
    final newestFirst = state.sort == DaySort.newestFirst;
    final isCalendar = state.view == DayBrowserLayout.calendar;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.historyPageDays, style: AppTextStyles.appBarTitle),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            tooltip: isCalendar
                ? l10n.historyDaysShowList
                : l10n.historyDaysShowCalendar,
            icon: Icon(
              isCalendar
                  ? Icons.view_list_rounded
                  : Icons.calendar_month_rounded,
            ),
            onPressed: () => cubit.selectView(
              isCalendar ? DayBrowserLayout.list : DayBrowserLayout.calendar,
            ),
          ),
          if (!isCalendar)
            IconButton(
              tooltip: newestFirst
                  ? l10n.historyDaysSortNewest
                  : l10n.historyDaysSortOldest,
              icon: Icon(
                newestFirst
                    ? Icons.arrow_downward_rounded
                    : Icons.arrow_upward_rounded,
              ),
              onPressed: () => cubit.selectSort(
                newestFirst ? DaySort.oldestFirst : DaySort.newestFirst,
              ),
            ),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            PeriodBar(
              period: state.period,
              onPrevious: cubit.showPrevious,
              onNext: cubit.showNext,
              onSelected: cubit.selectPeriod,
            ),
            DayFilterBar(
              filter: state.filter,
              count: state.days.length,
              onChanged: cubit.selectFilter,
            ),
            Expanded(child: _body(context, state)),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context, DayBrowserState state) {
    final l10n = context.l10n;
    return switch (state.status) {
      DayBrowserStatus.loading => const Loader(),
      DayBrowserStatus.failure => EmptyState(
        image: AppImages.historical,
        title: l10n.historyPageLoadFailed,
      ),
      DayBrowserStatus.ready when state.view == DayBrowserLayout.calendar =>
        _Calendar(state: state),
      DayBrowserStatus.ready when state.days.isEmpty => EmptyState(
        image: AppImages.historical,
        title: state.periodDays.isEmpty
            ? l10n.historyDaysEmptyPeriod
            : l10n.historyDaysEmptyFilter,
      ),
      DayBrowserStatus.ready => _DayList(state: state),
    };
  }
}

class _DayList extends StatelessWidget {
  const new({required this.state});

  final DayBrowserState state;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final rows = [
      for (final (month, days) in state.monthGroups) ...[month, ...days],
    ];
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 32),
      itemCount: rows.length,
      itemBuilder: (context, index) => switch (rows[index]) {
        final DateTime month => Padding(
          padding: const EdgeInsets.fromLTRB(8, 20, 8, 4),
          child: Text(
            DateFormat.yMMMM(locale).format(month),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        final DayLog log => DayLogTile(log: log),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

class _Calendar extends StatelessWidget {
  const new({required this.state});

  final DayBrowserState state;

  @override
  Widget build(BuildContext context) {
    final period = state.period;
    final first = DateTime(period.from.year, period.from.month);
    final months =
        (period.to.year - first.year) * 12 + period.to.month - first.month + 1;
    final byMonth = <DateTime, Map<DateTime, DayLog>>{};
    for (final log in state.periodDays) {
      final date = log.date.dateOnly;
      (byMonth[DateTime(date.year, date.month)] ??= {})[date] = log;
    }
    final today = DateTime.now();
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 32),
      itemCount: months,
      itemBuilder: (context, index) {
        final month = DateTime(first.year, first.month + index);
        return CalendarMonth(
          month: month,
          days: byMonth[month] ?? const {},
          period: period,
          matches: state.matches,
          today: today,
          onDayTap: (log) => context.push(AppRoutes.historyDay(log.date)),
          showTitle: months > 1,
        );
      },
    );
  }
}
