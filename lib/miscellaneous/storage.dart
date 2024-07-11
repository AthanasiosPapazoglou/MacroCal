import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/models/activity.dart';
import 'package:macro_cal_public/models/historical_measurement.dart';
import 'package:macro_cal_public/models/ingredient.dart';

final DataController dataController = Get.put(DataController());

//! --------- SAVING DATA -------------------

/// Saves the list of Historical Measurements to the local storage
void saveHistoricalMeasurementsList() {
  final dataAsString = jsonEncode(HistoricalMeasurement.listToJson(
      dataController.historicalMeasurementsList));
  GetStorage().write('historicalMeasurementList', dataAsString);
}

/// Saves the list of Ingredients to the local storage
void saveIngredientsList() {
  final dataAsString =
      jsonEncode(Ingredient.listToJson(dataController.ingredientsList));
  GetStorage().write('ingredientList', dataAsString);
}

/// Saves the list of Ingredient Quantities to the local storage
void saveIngredientQuantitiesList() {
  final dataAsString =
      dataController.ingredientQuantitiesList.toList().toString();
  GetStorage().write('ingredientQuantitiesList', dataAsString);
}

/// Saves the list of Activities to the local storage
void saveActivitiesList() {
  final dataAsString =
      jsonEncode(Activity.listToJson(dataController.activitiesList));
  GetStorage().write('activityList', dataAsString);
}

/// Saves the list of Ingredient Quantities to the local storage
void saveActivityVolumesList() {
  final dataAsString = dataController.activitiyVolumesList.toList().toString();
  GetStorage().write('activitiyVolumesList', dataAsString);
}

/// Saves all data that appears in the Overview Page to the local storage
void saveOverviewData() {
  GetStorage().write('adjustedCalories', dataController.adjustedCalories.value);
  GetStorage().write('dailyCalories', dataController.dailyCalories.value);
  GetStorage().write('dailyProteins', dataController.dailyProteins.value);
  GetStorage().write('dailyCarbs', dataController.dailyCarbs.value);
  GetStorage().write('dailyFats', dataController.dailyFats.value);
  GetStorage().write('dailyFiber', dataController.dailyFiber.value);
  GetStorage().write('sugarsLimit', dataController.sugarsLimit.value);
  GetStorage().write('saturatedLimit', dataController.saturatedLimit.value);
  GetStorage().write('sodiumLimit', dataController.sodiumLimit.value);
  GetStorage().write('consumedCalories', dataController.consumedCalories.value);
  GetStorage().write('proteinConsumed', dataController.proteinConsumed.value);
  GetStorage().write('carbsConsumed', dataController.carbsConsumed.value);
  GetStorage().write('fiberConsumed', dataController.fiberConsumed.value);
  GetStorage().write('fatsConsumed', dataController.fatsConsumed.value);
  GetStorage().write('sugarsConsumed', dataController.sugarsConsumed.value);
  GetStorage()
      .write('saturatedConsumed', dataController.saturatedConsumed.value);
  GetStorage().write('sodiumConsumed', dataController.sodiumConsumed.value);
}

/// Saves all data that appears in the Profile Page to the local storage
void saveProfileData() {
  GetStorage().write('adjustedCalories', dataController.adjustedCalories.value);
  GetStorage().write('dailyCalories', dataController.dailyCalories.value);
  GetStorage().write('dailyProteins', dataController.dailyProteins.value);
  GetStorage().write('sugarsLimit', dataController.sugarsLimit.value);
  GetStorage().write('saturatedLimit', dataController.saturatedLimit.value);
  GetStorage().write('sodiumLimit', dataController.sodiumLimit.value);
  GetStorage().write('bodyWeight', dataController.bodyWeight.value);
  GetStorage().write('bodyHeight', dataController.bodyHeight.value);
}

/// Saves the state of all data across the App
void globalDataSave() {
  saveHistoricalMeasurementsList();
  saveIngredientsList();
  saveIngredientQuantitiesList();
  saveActivitiesList();
  saveActivityVolumesList();
  saveOverviewData();
  saveProfileData();
}

//! --------- LOADING DATA -----------------

/// Loads the list of Historical Measurements from the local storage and populates it to the corresponding GetX List
void loadHistoricalMeasurementsList() {
  final dataAsString = GetStorage().read('historicalMeasurementList');
  if (dataAsString == null) {
    dataController.historicalMeasurementsList =
        RxList<HistoricalMeasurement>([]);
  } else {
    final List<dynamic> dataList = jsonDecode(dataAsString);
    dataController.historicalMeasurementsList =
        RxList<HistoricalMeasurement>.from(
            HistoricalMeasurement.listFromJson(dataList));
  }
}

/// Loads the list of Ingredients from the local storage and populates it to the corresponding GetX List
void loadIngredientsList() {
  final dataAsString = GetStorage().read('ingredientList');
  if (dataAsString == null) {
    dataController.ingredientsList = RxList<Ingredient>([]);
  } else {
    final List<dynamic> dataList = jsonDecode(dataAsString);
    dataController.ingredientsList =
        RxList<Ingredient>.from(Ingredient.listFromJson(dataList));
  }
}

/// Loads the list of Ingredient Quantities from the local storage and populates it to the corresponding GetX List
void loadIngredientsQuantitiesList() {
  final dataAsString = GetStorage().read('ingredientQuantitiesList');
  if (dataAsString == null) {
    dataController.ingredientQuantitiesList = RxList<int>([]);
  } else {
    final List<dynamic> dataList = json.decode(dataAsString);
    dataController.ingredientQuantitiesList =
        RxList<int>.from(dataList.cast<int>());
  }
}

/// Loads the list of Activities from the local storage and populates it to the corresponding GetX List
void loadActivitiesList() {
  final dataAsString = GetStorage().read('activityList');
  if (dataAsString == null) {
    dataController.activitiesList = RxList<Activity>([]);
  } else {
    final List<dynamic> dataList = jsonDecode(dataAsString);
    dataController.activitiesList =
        RxList<Activity>.from(Activity.listFromJson(dataList));
  }
}

/// Loads the list of Activity Volumes from the local storage and populates it to the corresponding GetX List
void loadActivitiyVolumesList() {
  final dataAsString = GetStorage().read('activitiyVolumesList');
  if (dataAsString == null) {
    dataController.activitiyVolumesList = RxList<int>([]);
  } else {
    final List<dynamic> dataList = json.decode(dataAsString);
    dataController.activitiyVolumesList =
        RxList<int>.from(dataList.cast<int>());
  }
}

/// Loads all data that appears in the Overview Page and populates it to the corresponding GetX variables
void loadOverviewData() {
  dataController.adjustedCalories.value = GetStorage().read('adjustedCalories');
  dataController.dailyCalories.value = GetStorage().read('dailyCalories');
  dataController.dailyProteins.value = GetStorage().read('dailyProteins');
  dataController.dailyCarbs.value = GetStorage().read('dailyCarbs');
  dataController.dailyFats.value = GetStorage().read('dailyFats');
  dataController.dailyFiber.value = GetStorage().read('dailyFiber');
  dataController.sugarsLimit.value = GetStorage().read('sugarsLimit');
  dataController.saturatedLimit.value = GetStorage().read('saturatedLimit');
  dataController.sodiumLimit.value = GetStorage().read('sodiumLimit');
  dataController.consumedCalories.value = GetStorage().read('consumedCalories');
  dataController.proteinConsumed.value = GetStorage().read('proteinConsumed');
  dataController.carbsConsumed.value = GetStorage().read('carbsConsumed');
  dataController.fiberConsumed.value = GetStorage().read('fiberConsumed');
  dataController.fatsConsumed.value = GetStorage().read('fatsConsumed');
  dataController.sugarsConsumed.value = GetStorage().read('sugarsConsumed');
  dataController.saturatedConsumed.value =
      GetStorage().read('saturatedConsumed');
  dataController.sodiumConsumed.value = GetStorage().read('sodiumConsumed');
}

/// Loads all data that appears in the Profile Page and populates it to the corresponding GetX variables
void loadProfileData() {
  dataController.adjustedCalories.value = GetStorage().read('adjustedCalories');
  dataController.dailyCalories.value = GetStorage().read('dailyCalories');
  dataController.dailyProteins.value = GetStorage().read('dailyProteins');
  dataController.sugarsLimit.value = GetStorage().read('sugarsLimit');
  dataController.saturatedLimit.value = GetStorage().read('saturatedLimit');
  dataController.sodiumLimit.value = GetStorage().read('sodiumLimit');
  dataController.bodyWeight.value = GetStorage().read('bodyWeight');
  dataController.bodyHeight.value = GetStorage().read('bodyHeight');
}

/// Loads the state of all saved data across the App from the local Storage and populates all corresponding GetX Variables
globalDataLoad() {
  loadHistoricalMeasurementsList();
  loadIngredientsList();
  loadIngredientsQuantitiesList();
  loadActivitiesList();
  loadActivitiyVolumesList();
  loadOverviewData();
  loadProfileData();
}

//! -------------- First Time Storage Loading -----------------

firstOrLaterGlobalLoad() {
  if (GetStorage().read('ingredientList') != null &&
      GetStorage().read('activityList') != null) {
    globalDataLoad();
  }
}
