import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

final DataController dataController = Get.find();

resetActivityVolumesList() {
  for (int i = 0; i < dataController.activitiyVolumesList.length; i++) {
    dataController.activitiyVolumesList[i] = 0;
  }
}

calculateAdjustedCalories() {
  double adjustedCalories = dataController.dailyCalories.value;
  for (int i = 0; i < dataController.activitiyVolumesList.length; i++) {
    adjustedCalories = adjustedCalories +
        (dataController.activitiesList[i].caloryConsumptionPerUnit! *
            dataController.activitiyVolumesList[i]);
  }
  dataController.adjustedCalories.value = adjustedCalories;
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

registerHistoricalMeasurement(DateTime selectedDate) {
  HistoricalMeasurement newMeasurement = HistoricalMeasurement(
      measurementDate: selectedDate,
      historicalMeasurementNutritionalData:
          HistoricalMeasurementNutritionalData(
        adjustedCalories: dataController.adjustedCalories.value,
        dailyProteins: dataController.dailyProteins.value,
        dailyFiber: dataController.dailyFiber.value,
        sugarsLimit: dataController.sugarsLimit.value,
        saturatedLimit: dataController.saturatedLimit.value,
        sodiumLimit: dataController.sodiumLimit.value,
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
