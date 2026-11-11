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

  static const _calculator = HistoryStatsCalculator();

  final HistoryRepository _repository;
  final DateTime Function() _now;
  StreamSubscription<List<DayLog>>? _subscription;
  List<DayLog> _allLogs = const [];

  void watch() {
    _subscription ??= _repository.watchDayLogs().listen(
      (logs) {
        _allLogs = logs;
        _emitFor(state.range);
      },
      onError: (Object _) =>
          emit(state.copyWith(status: HistoryStatus.failure)),
    );
  }

  void selectRange(HistoryRange range) {
    if (state.status == HistoryStatus.ready) {
      _emitFor(range);
    } else {
      emit(state.copyWith(range: range));
    }
  }

  void _emitFor(HistoryRange range) {
    final today = _now();
    emit(
      HistoryState(
        status: HistoryStatus.ready,
        range: range,
        logs: _calculator
            .inRange(_allLogs, range: range, today: today)
            .reversed
            .toList(),
        stats: _calculator.calculate(_allLogs, range: range, today: today),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }
}
