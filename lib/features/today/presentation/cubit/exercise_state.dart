import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity_entry.dart';

part 'exercise_state.freezed.dart';

enum ExerciseStatus { loading, ready, saving, saved, failure }

@freezed
abstract class ExerciseState with _$ExerciseState {
  const factory({
    @Default(ExerciseStatus.loading) ExerciseStatus status,
    @Default(<ActivityEntry>[]) List<ActivityEntry> entries,
  }) = _ExerciseState;
}
