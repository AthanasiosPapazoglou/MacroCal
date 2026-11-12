import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_range.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/domain/services/history_stats_calculator.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  new(this._repository, {this._now = DateTime.now})
    : super(const HistoryState());

  /// How far back the current streak is counted.
  static const streakWindowDays = 400;

  static const _calculator = HistoryStatsCalculator();

  final HistoryRepository _repository;
  final DateTime Function() _now;
  StreamSubscription<List<DayLog>>? _recentSubscription;
  StreamSubscription<List<DayLog>>? _rangeSubscription;
  List<DayLog>? _recentLogs;
  List<DayLog>? _rangeLogs;

  void watch() {
    if (_recentSubscription != null) return;
    final today = _now();
    _recentSubscription = _repository
        .watchDayLogs(
          from: DateTime(
            today.year,
            today.month,
            today.day - streakWindowDays + 1,
          ),
        )
        .listen((logs) {
          _recentLogs = logs;
          _emitIfLoaded();
        }, onError: _onError);
    _watchRange(state.range);
  }

  void selectRange(HistoryRange range) {
    if (range == state.range) return;
    emit(state.copyWith(range: range));
    if (_recentSubscription != null) _watchRange(range);
  }

  void _watchRange(HistoryRange range) {
    unawaited(_rangeSubscription?.cancel());
    _rangeLogs = null;
    _rangeSubscription = _repository
        .watchDayLogs(from: range.since(_now()))
        .listen((logs) {
          _rangeLogs = logs;
          _emitIfLoaded();
        }, onError: _onError);
  }

  void _emitIfLoaded() {
    final rangeLogs = _rangeLogs;
    final recentLogs = _recentLogs;
    if (rangeLogs == null || recentLogs == null) return;
    emit(
      HistoryState(
        status: HistoryStatus.ready,
        range: state.range,
        logs: rangeLogs.reversed.toList(),
        stats: _calculator.calculate(
          rangeLogs,
          range: state.range,
          today: _now(),
          recentLogs: recentLogs,
        ),
      ),
    );
  }

  void _onError(Object _) =>
      emit(state.copyWith(status: HistoryStatus.failure));

  @override
  Future<void> close() async {
    await _recentSubscription?.cancel();
    await _rangeSubscription?.cancel();
    await super.close();
  }
}
