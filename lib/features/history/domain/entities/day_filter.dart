import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/history/domain/entities/tracked_goal.dart';

part 'day_filter.freezed.dart';

/// met: rated good; under: missed below the target; over: missed above it.
enum DayOutcome { met, under, over }

enum DaySort { newestFirst, oldestFirst }

@freezed
abstract class DayFilter with _$DayFilter {
  const factory({required TrackedGoal goal, required DayOutcome outcome}) =
      _DayFilter;
}
