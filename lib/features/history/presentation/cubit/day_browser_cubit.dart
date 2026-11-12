import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_filter.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_period.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_browser_state.dart';

class DayBrowserCubit extends Cubit<DayBrowserState> {
  new(this._repository, {DateTime Function() now = DateTime.now})
    : super(DayBrowserState(period: DayPeriod.monthOf(now())));

  final HistoryRepository _repository;
  StreamSubscription<List<DayLog>>? _subscription;
  bool _watching = false;

  void watch() {
    if (_watching) return;
    _watching = true;
    _watchPeriod();
  }

  void selectPeriod(DayPeriod period) {
    if (period == state.period) return;
    emit(
      state.copyWith(
        period: period,
        periodDays: const [],
        status: DayBrowserStatus.loading,
      ),
    );
    if (_watching) _watchPeriod();
  }

  void showPrevious() => selectPeriod(state.period.shifted(-1));

  void showNext() => selectPeriod(state.period.shifted(1));

  void selectFilter(DayFilter? filter) => emit(state.copyWith(filter: filter));

  void selectSort(DaySort sort) => emit(state.copyWith(sort: sort));

  void selectView(DayBrowserView view) => emit(state.copyWith(view: view));

  void _watchPeriod() {
    unawaited(_subscription?.cancel());
    final period = state.period;
    _subscription = _repository
        .watchDayLogs(from: period.from, to: period.to)
        .listen(
          (logs) => emit(
            state.copyWith(status: DayBrowserStatus.ready, periodDays: logs),
          ),
          onError: (Object _) =>
              emit(state.copyWith(status: DayBrowserStatus.failure)),
        );
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }
}
