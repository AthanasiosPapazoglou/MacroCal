import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
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

void saveOverviewData() {
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

void globalDataSave() {
  saveHistoricalMeasurementsList();
  saveIngredientsList();
  saveIngredientQuantitiesList();
  saveOverviewData();
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

void _loadDouble(String key, RxDouble target) {
  final value = GetStorage().read(key);
  if (value is num) target.value = value.toDouble();
}

void loadOverviewData() {
  _loadDouble('consumedCalories', dataController.consumedCalories);
  _loadDouble('proteinConsumed', dataController.proteinConsumed);
  _loadDouble('carbsConsumed', dataController.carbsConsumed);
  _loadDouble('fiberConsumed', dataController.fiberConsumed);
  _loadDouble('fatsConsumed', dataController.fatsConsumed);
  _loadDouble('sugarsConsumed', dataController.sugarsConsumed);
  _loadDouble('saturatedConsumed', dataController.saturatedConsumed);
  _loadDouble('sodiumConsumed', dataController.sodiumConsumed);
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
  _matchLength(dataController.ingredientQuantitiesList,
      dataController.ingredientsList.length);
  loadOverviewData();
}

bool _hasSavedData() => GetStorage().read('ingredientList') != null;

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
