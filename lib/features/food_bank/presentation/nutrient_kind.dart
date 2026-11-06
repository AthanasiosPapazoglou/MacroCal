import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/miscellaneous/enums.dart';
import 'package:macro_cal_public/miscellaneous/images.dart';

enum NutrientKind {
  calories,
  fat,
  saturated,
  carbs,
  sugars,
  fiber,
  protein,
  salt;

  String get svgPath => switch (this) {
    calories => caloriesSvgPath,
    fat => oliveSvgPath,
    saturated => saturatedSvgPath,
    carbs => carbsSvgPath,
    sugars => sugarSvgPath,
    fiber => saladSvgPath,
    protein => proteinSvgPath,
    salt => saltSvgPath,
  };

  HealthEffects get healthEffect => switch (this) {
    saturated || sugars || salt => HealthEffects.hazardous,
    fiber || protein => HealthEffects.benefitial,
    calories || fat || carbs => HealthEffects.neutral,
  };

  double valueIn(Nutrients nutrients) => switch (this) {
    calories => nutrients.kcal,
    fat => nutrients.fatG,
    saturated => nutrients.saturatedG,
    carbs => nutrients.carbsG,
    sugars => nutrients.sugarsG,
    fiber => nutrients.fiberG,
    protein => nutrients.proteinG,
    salt => nutrients.saltMg,
  };

  String title(AppLocalizations l10n) => switch (this) {
    calories => l10n.ingredientDetailsNutrientsCalories,
    fat => l10n.ingredientDetailsNutrientsFat,
    saturated => l10n.ingredientDetailsNutrientsSaturated,
    carbs => l10n.ingredientDetailsNutrientsCarbs,
    sugars => l10n.ingredientDetailsNutrientsSugars,
    fiber => l10n.ingredientDetailsNutrientsFiber,
    protein => l10n.ingredientDetailsNutrientsProtein,
    salt => l10n.ingredientDetailsNutrientsSalt,
  };

  String description(AppLocalizations l10n) => switch (this) {
    calories => l10n.ingredientDetailsNutrientDescriptionsCalories,
    fat => l10n.ingredientDetailsNutrientDescriptionsFat,
    saturated => l10n.ingredientDetailsNutrientDescriptionsSaturated,
    carbs => l10n.ingredientDetailsNutrientDescriptionsCarbs,
    sugars => l10n.ingredientDetailsNutrientDescriptionsSugars,
    fiber => l10n.ingredientDetailsNutrientDescriptionsFiber,
    protein => l10n.ingredientDetailsNutrientDescriptionsProtein,
    salt => l10n.ingredientDetailsNutrientDescriptionsSalt,
  };
}
