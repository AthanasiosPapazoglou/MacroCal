import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_detail_state.dart';

class DayDetailCubit extends Cubit<DayDetailState> {
  new(this._repository, this.date) : super(const DayDetailState());

  final HistoryRepository _repository;
  final DateTime date;
  StreamSubscription<DayLog?>? _subscription;

  void watch() {
    _subscription ??= _repository.watchDayLog(date).listen(
      (log) {
        if (state.status == DayDetailStatus.deleted) return;
        emit(
          DayDetailState(
            status: log == null
                ? DayDetailStatus.notFound
                : DayDetailStatus.ready,
            log: log,
          ),
        );
      },
      onError: (Object _) =>
          emit(state.copyWith(status: DayDetailStatus.failure)),
    );
  }

  Future<void> delete() async {
    try {
      await _repository.deleteDayLog(date);
      emit(state.copyWith(status: DayDetailStatus.deleted));
    } on Exception {
      emit(state.copyWith(status: DayDetailStatus.failure));
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }
}
