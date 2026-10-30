import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/models/activity.dart';
import 'package:macro_cal_public/models/historical_measurement.dart';
import 'package:macro_cal_public/models/ingredient.dart';

void saveHistoricalMeasurementsList() {
  final dataAsString = jsonEncode(HistoricalMeasurement.listToJson(
      dataController.historicalMeasurementsList));
  GetStorage().write('historicalMeasurementList', dataAsString);
}

void saveIngredientsList() {
  final dataAsString =
      jsonEncode(Ingredient.listToJson(dataController.ingredientsList));
  GetStorage().write('ingredientList', dataAsString);
}

void saveIngredientQuantitiesList() {
  final dataAsString =
      dataController.ingredientQuantitiesList.toList().toString();
  GetStorage().write('ingredientQuantitiesList', dataAsString);
}

void saveActivitiesList() {
  final dataAsString =
      jsonEncode(Activity.listToJson(dataController.activitiesList));
  GetStorage().write('activityList', dataAsString);
}

void saveActivityVolumesList() {
  final dataAsString = dataController.activitiyVolumesList.toList().toString();
  GetStorage().write('activitiyVolumesList', dataAsString);
}

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

void globalDataSave() {
  saveHistoricalMeasurementsList();
  saveIngredientsList();
  saveIngredientQuantitiesList();
  saveActivitiesList();
  saveActivityVolumesList();
  saveOverviewData();
  saveProfileData();
}

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

void _loadDouble(String key, RxDouble target) {
  final value = GetStorage().read(key);
  if (value is num) target.value = value.toDouble();
}

void loadOverviewData() {
  _loadDouble('adjustedCalories', dataController.adjustedCalories);
  _loadDouble('dailyCalories', dataController.dailyCalories);
  _loadDouble('dailyProteins', dataController.dailyProteins);
  _loadDouble('dailyCarbs', dataController.dailyCarbs);
  _loadDouble('dailyFats', dataController.dailyFats);
  _loadDouble('dailyFiber', dataController.dailyFiber);
  _loadDouble('sugarsLimit', dataController.sugarsLimit);
  _loadDouble('saturatedLimit', dataController.saturatedLimit);
  _loadDouble('sodiumLimit', dataController.sodiumLimit);
  _loadDouble('consumedCalories', dataController.consumedCalories);
  _loadDouble('proteinConsumed', dataController.proteinConsumed);
  _loadDouble('carbsConsumed', dataController.carbsConsumed);
  _loadDouble('fiberConsumed', dataController.fiberConsumed);
  _loadDouble('fatsConsumed', dataController.fatsConsumed);
  _loadDouble('sugarsConsumed', dataController.sugarsConsumed);
  _loadDouble('saturatedConsumed', dataController.saturatedConsumed);
  _loadDouble('sodiumConsumed', dataController.sodiumConsumed);
}

void loadProfileData() {
  _loadDouble('adjustedCalories', dataController.adjustedCalories);
  _loadDouble('dailyCalories', dataController.dailyCalories);
  _loadDouble('dailyProteins', dataController.dailyProteins);
  _loadDouble('sugarsLimit', dataController.sugarsLimit);
  _loadDouble('saturatedLimit', dataController.saturatedLimit);
  _loadDouble('sodiumLimit', dataController.sodiumLimit);
  _loadDouble('bodyWeight', dataController.bodyWeight);
  _loadDouble('bodyHeight', dataController.bodyHeight);
}

void _matchLength(RxList<int> values, int length) {
  if (values.length > length) {
    values.removeRange(length, values.length);
  } else if (values.length < length) {
    values.addAll(List.filled(length - values.length, 0));
  }
}

globalDataLoad() {
  loadHistoricalMeasurementsList();
  loadIngredientsList();
  loadIngredientsQuantitiesList();
  loadActivitiesList();
  loadActivitiyVolumesList();
  _matchLength(dataController.ingredientQuantitiesList,
      dataController.ingredientsList.length);
  _matchLength(dataController.activitiyVolumesList,
      dataController.activitiesList.length);
  loadOverviewData();
  loadProfileData();
}

bool _hasSavedData() =>
    GetStorage().read('ingredientList') != null &&
    GetStorage().read('activityList') != null;

Future<void> loadDefaultIngredients() async {
  if (_hasSavedData()) return;
  final List<dynamic> dataList = jsonDecode(
      await rootBundle.loadString('assets/data/default_ingredients.json'));
  dataController.ingredientsList =
      RxList<Ingredient>.from(Ingredient.listFromJson(dataList));
  dataController.ingredientQuantitiesList = RxList<int>.filled(
      dataController.ingredientsList.length, 0,
      growable: true);
}

firstOrLaterGlobalLoad() {
  if (_hasSavedData()) globalDataLoad();
}
