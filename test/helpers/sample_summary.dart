import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';

const sampleSummary = DailySummary(
  goals: NutritionGoals(dailyKcal: 1800, proteinG: 120),
  consumed: Nutrients(kcal: 90, proteinG: 6.4, sugarsG: 9, saltMg: 100),
  burnedKcal: 150,
  adjustedKcal: 1950,
  sugarLimitG: 48,
  saturatedLimitG: 17,
);
