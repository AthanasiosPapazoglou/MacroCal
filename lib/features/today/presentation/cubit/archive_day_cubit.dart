import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/core/domain/date_only.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/domain/use_cases/archive_day.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/archive_day_state.dart';

class ArchiveDayCubit extends Cubit<ArchiveDayState> {
  new(this._history, this._archiveDay, {required DateTime today})
    : super(ArchiveDayState(selectedDate: today.dateOnly));

  final HistoryRepository _history;
  final ArchiveDay _archiveDay;

  Future<void> load() => selectDate(state.selectedDate);

  Future<void> selectDate(DateTime date) async {
    emit(
      state.copyWith(
        selectedDate: date.dateOnly,
        status: ArchiveDayStatus.checking,
      ),
    );
    try {
      final isTaken = await _history.hasLogFor(date.dateOnly);
      emit(
        state.copyWith(isDateTaken: isTaken, status: ArchiveDayStatus.ready),
      );
    } on Exception {
      emit(state.copyWith(status: ArchiveDayStatus.failure));
    }
  }

  Future<void> archive(DailySummary summary) async {
    emit(state.copyWith(status: ArchiveDayStatus.archiving));
    try {
      await _archiveDay(date: state.selectedDate, summary: summary);
      emit(state.copyWith(status: ArchiveDayStatus.archived));
    } on Exception {
      emit(state.copyWith(status: ArchiveDayStatus.failure));
    }
  }
}
