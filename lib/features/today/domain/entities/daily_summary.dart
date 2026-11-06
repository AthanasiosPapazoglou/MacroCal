import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';

part 'daily_summary.freezed.dart';

@freezed
abstract class DailySummary with _$DailySummary {
  const factory({
    required NutritionGoals goals,
    required Nutrients consumed,
    required double burnedKcal,
    required double adjustedKcal,
    required double sugarLimitG,
    required double saturatedLimitG,
  }) = _DailySummary;
}
