import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_range.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_stats.dart';

part 'history_state.freezed.dart';

enum HistoryStatus { loading, ready, failure }

@freezed
abstract class HistoryState with _$HistoryState {
  const factory({
    @Default(HistoryStatus.loading) HistoryStatus status,
    @Default(HistoryRange.week) HistoryRange range,
    @Default(<DayLog>[]) List<DayLog> logs,
    @Default(HistoryStats()) HistoryStats stats,
  }) = _HistoryState;
}
