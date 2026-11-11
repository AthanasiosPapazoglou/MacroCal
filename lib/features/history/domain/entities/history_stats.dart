import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/history/domain/entities/tracked_goal.dart';

part 'history_stats.freezed.dart';

@freezed
abstract class HistoryStats with _$HistoryStats {
  const factory({
    @Default(0) int daysLogged,
    @Default(Nutrients()) Nutrients averageConsumed,
    @Default(0) double averageAdjustedKcal,
    @Default(0) double averageBurnedKcal,
    @Default({}) Map<TrackedGoal, int> daysMet,
    @Default(0) int currentStreak,
  }) = _HistoryStats;

  const new _();

  double adherence(TrackedGoal goal) =>
      daysLogged == 0 ? 0 : (daysMet[goal] ?? 0) / daysLogged;
}
