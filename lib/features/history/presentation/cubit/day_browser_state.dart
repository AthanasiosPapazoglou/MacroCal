import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/history/domain/entities/date_period.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_filter.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/services/history_stats_calculator.dart';

part 'day_browser_state.freezed.dart';

enum DayBrowserStatus { loading, ready, failure }

enum DayBrowserLayout { list, calendar }

@freezed
abstract class DayBrowserState with _$DayBrowserState {
  const factory({
    required DatePeriod period,
    @Default(DayBrowserStatus.loading) DayBrowserStatus status,
    @Default(<DayLog>[]) List<DayLog> periodDays,
    DayFilter? filter,
    @Default(DaySort.newestFirst) DaySort sort,
    @Default(DayBrowserLayout.list) DayBrowserLayout view,
  }) = _DayBrowserState;

  const new _();

  static const _calculator = HistoryStatsCalculator();

  bool matches(DayLog log) {
    final filter = this.filter;
    return filter == null ||
        _calculator.outcome(filter.goal, log.summary) == filter.outcome;
  }

  /// The period's days that pass the filter, in the chosen order.
  List<DayLog> get days {
    final matching = [
      for (final log in periodDays)
        if (matches(log)) log,
    ];
    return sort == DaySort.newestFirst ? matching.reversed.toList() : matching;
  }

  /// [days] grouped by month, keeping their order.
  List<(DateTime month, List<DayLog> days)> get monthGroups {
    final groups = <(DateTime, List<DayLog>)>[];
    for (final log in days) {
      final month = DateTime(log.date.year, log.date.month);
      if (groups.isEmpty || groups.last.$1 != month) groups.add((month, []));
      groups.last.$2.add(log);
    }
    return groups;
  }
}
