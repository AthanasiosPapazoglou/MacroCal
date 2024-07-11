import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macro_cal_public/models/historical_measurement.dart';
import '../controllers/data_controller.dart';

//! Spacing/Responsiveness
double navTabsImageSize = 30;

SizedBox heightSpacer(double space) {
  return SizedBox(
    height: space,
  );
}

TextStyle appBarStyle() =>
    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

final DataController dataController = Get.find();

//! Excercise Functionalities
/// Resets the values of excercise volume for all Activities
resetActivityVolumesList() {
  for (int i = 0; i < dataController.activitiyVolumesList.length; i++) {
    dataController.activitiyVolumesList[i] = 0;
  }
}

///helper function for calculateAdjustedCalories()
equilibriateCalories() =>
    dataController.adjustedCalories.value = dataController.dailyCalories.value;

/// Increases the burned calories for the day based on the volume of excercise been done for they day.
calculateAdjustedCalories() {
  equilibriateCalories();
  for (int i = 0; i < dataController.activitiyVolumesList.length; i++) {
    dataController.adjustedCalories.value =
        dataController.adjustedCalories.value +
            (dataController.activitiesList[i].caloryConsumptionPerUnit! *
                dataController.activitiyVolumesList[i]);
  }
}

//! Consumption Functionalities
/// Resets the values of quantity consumption for all Ingredients
resetIngredientQuantitiesList() {
  for (int i = 0; i < dataController.ingredientQuantitiesList.length; i++) {
    dataController.ingredientQuantitiesList[i] = 0;
  }
}

/// Helper function for populateConsumptionVariables()
resetConsumptionVariables() {
  dataController.consumedCalories.value = 0;
  dataController.proteinConsumed.value = 0;
  dataController.carbsConsumed.value = 0;
  dataController.sugarsConsumed.value = 0;
  dataController.fatsConsumed.value = 0;
  dataController.saturatedConsumed.value = 0;
  dataController.fiberConsumed.value = 0;
  dataController.sodiumConsumed.value = 0;
}

/// Calculates and assigns the total consumption per macro metric (total calories/fat/carbs ... salt consumed)
populateConsumptionVariables() {
  resetConsumptionVariables();
  for (int i = 0; i < dataController.ingredientQuantitiesList.length; i++) {
    dataController.consumedCalories.value =
        (dataController.consumedCalories.value +
            dataController.ingredientsList[i].calories! *
                dataController.ingredientQuantitiesList[i] *
                0.01);
    dataController.carbsConsumed.value = (dataController.carbsConsumed.value +
        dataController.ingredientsList[i].carbohydrates! *
            dataController.ingredientQuantitiesList[i] *
            0.01);
    dataController.proteinConsumed.value =
        (dataController.proteinConsumed.value +
            dataController.ingredientsList[i].proteins! *
                dataController.ingredientQuantitiesList[i] *
                0.01);
    dataController.fatsConsumed.value = (dataController.fatsConsumed.value +
        dataController.ingredientsList[i].fats! *
            dataController.ingredientQuantitiesList[i] *
            0.01);
    dataController.fiberConsumed.value = (dataController.fiberConsumed.value +
        dataController.ingredientsList[i].fiber! *
            dataController.ingredientQuantitiesList[i] *
            0.01);
    dataController.sugarsConsumed.value = (dataController.sugarsConsumed.value +
        dataController.ingredientsList[i].sugars! *
            dataController.ingredientQuantitiesList[i] *
            0.01);
    dataController.saturatedConsumed.value =
        (dataController.saturatedConsumed.value +
            dataController.ingredientsList[i].saturated! *
                dataController.ingredientQuantitiesList[i] *
                0.01);
    dataController.sodiumConsumed.value = (dataController.sodiumConsumed.value +
        dataController.ingredientsList[i].salt! *
            dataController.ingredientQuantitiesList[i] *
            0.01);
  }
}

//! Historical Measurements Functionalities

///Checks if the selected date is populated, returns a map with two key-value pairs: "isPopulated" key has a boolean value expressing if
///the selected date is populated by a historical measurement, "index" key has an int value expressing the index where the historical measurement populating
///populating the selected date is located in the historicalMeasurementsList
Map<String, dynamic> isSelectedDatepopulatedChecker(DateTime? selectedDate) {
  for (int i = 0; i < dataController.historicalMeasurementsList.length; i++) {
    //TODO replicate error (open dateselector for archive and cancel without selecting a date) FIX IT!
    if (dataController.historicalMeasurementsList[i].measurementDate!.year ==
            selectedDate?.year &&
        dataController.historicalMeasurementsList[i].measurementDate!.month ==
            selectedDate?.month &&
        dataController.historicalMeasurementsList[i].measurementDate!.day ==
            selectedDate?.day) {
      return {"isPopulated": true, "index": i};
    }
  }
  return {"isPopulated": false, "index": -1};
}

registerHistoricalMeasurement(DateTime? selectedDate) {
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

  (isSelectedDatepopulatedChecker(selectedDate)['isPopulated'])
      ? dataController.historicalMeasurementsList[
              isSelectedDatepopulatedChecker(selectedDate)['index']] =
          newMeasurement
      : dataController.historicalMeasurementsList.add(newMeasurement);
}
