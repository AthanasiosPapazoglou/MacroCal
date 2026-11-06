import 'package:freezed_annotation/freezed_annotation.dart';

part 'nutrition_goals.freezed.dart';

@freezed
abstract class NutritionGoals with _$NutritionGoals {
  const factory({
    @Default(2100) double dailyKcal,
    @Default(100) double proteinG,
    @Default(35) double fiberG,
    @Default(10) double sugarLimitPct,
    @Default(8) double saturatedLimitPct,
    @Default(5800) double saltLimitMg,
  }) = _NutritionGoals;
}
