import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_detail_state.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';

class DayDetailCubit extends Cubit<DayDetailState> {
  new(this._repository, this._settingsRepository, this.date)
    : super(const DayDetailState());

  final HistoryRepository _repository;
  final SettingsRepository _settingsRepository;
  final DateTime date;
  StreamSubscription<DayLog?>? _subscription;
  StreamSubscription<bool>? _settingsSubscription;
  bool _microcalEnabled = false;

  void watch() {
    _settingsSubscription ??= _settingsRepository.watchMicrocalEnabled().listen(
      (enabled) {
        _microcalEnabled = enabled;
        if (state.status == DayDetailStatus.deleted) return;
        emit(state.copyWith(microcalEnabled: enabled));
      },
      onError: (Object _) {},
    );
    _subscription ??= _repository.watchDayLog(date).listen(
      (log) {
        if (state.status == DayDetailStatus.deleted) return;
        emit(
          DayDetailState(
            status: log == null
                ? DayDetailStatus.notFound
                : DayDetailStatus.ready,
            log: log,
            microcalEnabled: _microcalEnabled,
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
    await _settingsSubscription?.cancel();
    await super.close();
  }
}
