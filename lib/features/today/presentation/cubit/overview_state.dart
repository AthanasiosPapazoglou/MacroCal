import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';

part 'overview_state.freezed.dart';

enum OverviewStatus { loading, ready, failure }

@freezed
abstract class OverviewState with _$OverviewState {
  const factory({
    @Default(OverviewStatus.loading) OverviewStatus status,
    @Default(NutritionGoals()) NutritionGoals goals,
  }) = _OverviewState;
}
