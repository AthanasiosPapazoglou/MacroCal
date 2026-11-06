import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/models/historical_measurement.dart';
import '../controllers/data_controller.dart';

double navTabsImageSize = 30;

Image tabIcon(BuildContext context, String path) => Image.asset(
      path,
      width: navTabsImageSize,
      height: navTabsImageSize,
      cacheWidth:
          (navTabsImageSize * MediaQuery.devicePixelRatioOf(context)).round(),
    );

SizedBox heightSpacer(double space) {
  return SizedBox(
    height: space,
  );
}

TextStyle appBarStyle() =>
    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

String translateDefaultText(AppLocalizations l10n, String text) => switch (text) {
      'Walking' => l10n.activityWalking,
      'Kilometers' => l10n.activityKilometers,
      'Uncategorised' => l10n.ingredientsPageUncategorised,
      _ => text,
    };

resetActivityVolumesList() {
  for (int i = 0; i < dataController.activitiyVolumesList.length; i++) {
    dataController.activitiyVolumesList[i] = 0;
  }
}

double burnedCalories() {
  double burned = 0;
  for (int i = 0; i < dataController.activitiyVolumesList.length; i++) {
    burned += dataController.activitiesList[i].caloryConsumptionPerUnit! *
        dataController.activitiyVolumesList[i];
  }
  return burned;
}

resetIngredientQuantitiesList() {
  for (int i = 0; i < dataController.ingredientQuantitiesList.length; i++) {
    dataController.ingredientQuantitiesList[i] = 0;
  }
}

populateConsumptionVariables() {
  double calories = 0, carbs = 0, proteins = 0, fats = 0;
  double fiber = 0, sugars = 0, saturated = 0, sodium = 0;
  for (int i = 0; i < dataController.ingredientQuantitiesList.length; i++) {
    final ingredient = dataController.ingredientsList[i];
    final int quantity = dataController.ingredientQuantitiesList[i];
    calories += ingredient.calories! * quantity * 0.01;
    carbs += ingredient.carbohydrates! * quantity * 0.01;
    proteins += ingredient.proteins! * quantity * 0.01;
    fats += ingredient.fats! * quantity * 0.01;
    fiber += ingredient.fiber! * quantity * 0.01;
    sugars += ingredient.sugars! * quantity * 0.01;
    saturated += ingredient.saturated! * quantity * 0.01;
    sodium += ingredient.salt! * quantity * 0.01;
  }
  dataController.consumedCalories.value = calories;
  dataController.carbsConsumed.value = carbs;
  dataController.proteinConsumed.value = proteins;
  dataController.fatsConsumed.value = fats;
  dataController.fiberConsumed.value = fiber;
  dataController.sugarsConsumed.value = sugars;
  dataController.saturatedConsumed.value = saturated;
  dataController.sodiumConsumed.value = sodium;
}

int measurementIndexForDate(DateTime date) =>
    dataController.historicalMeasurementsList.indexWhere((measurement) =>
        DateUtils.isSameDay(measurement.measurementDate, date));

registerHistoricalMeasurement(DateTime selectedDate, NutritionGoals goals) {
  HistoricalMeasurement newMeasurement = HistoricalMeasurement(
      measurementDate: selectedDate,
      historicalMeasurementNutritionalData:
          HistoricalMeasurementNutritionalData(
        adjustedCalories: goals.dailyKcal + burnedCalories(),
        dailyProteins: goals.proteinG,
        dailyFiber: goals.fiberG,
        sugarsLimit: goals.sugarLimitPct,
        saturatedLimit: goals.saturatedLimitPct,
        sodiumLimit: goals.saltLimitMg,
        consumedCalories: dataController.consumedCalories.value,
        proteinConsumed: dataController.proteinConsumed.value,
        fiberConsumed: dataController.fiberConsumed.value,
        sugarsConsumed: dataController.sugarsConsumed.value,
        saturatedConsumed: dataController.saturatedConsumed.value,
        sodiumConsumed: dataController.sodiumConsumed.value,
      ));

  final int index = measurementIndexForDate(selectedDate);
  if (index == -1) {
    dataController.historicalMeasurementsList.add(newMeasurement);
  } else {
    dataController.historicalMeasurementsList[index] = newMeasurement;
  }
}
