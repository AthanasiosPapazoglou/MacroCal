import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  new(this._repository) : super(const ExerciseState());

  final ActivityRepository _repository;

  Future<void> load() async {
    try {
      final entries = await _repository.watchEntries().first;
      emit(ExerciseState(status: ExerciseStatus.ready, entries: entries));
    } on Exception {
      emit(state.copyWith(status: ExerciseStatus.failure));
    }
  }

  void updateAmount(int activityId, int amount) => emit(
    state.copyWith(
      entries: [
        for (final entry in state.entries)
          if (entry.activity.id == activityId)
            entry.copyWith(amount: amount)
          else
            entry,
      ],
    ),
  );

  Future<void> save() async {
    emit(state.copyWith(status: ExerciseStatus.saving));
    try {
      await _repository.replaceAmounts({
        for (final entry in state.entries) entry.activity.id: entry.amount,
      });
      emit(state.copyWith(status: ExerciseStatus.saved));
    } on Exception {
      emit(state.copyWith(status: ExerciseStatus.failure));
    }
  }

  Future<void> reset() async {
    try {
      await _repository.resetAmounts();
      emit(
        state.copyWith(
          status: ExerciseStatus.ready,
          entries: [
            for (final entry in state.entries) entry.copyWith(amount: 0),
          ],
        ),
      );
    } on Exception {
      emit(state.copyWith(status: ExerciseStatus.failure));
    }
  }
}
