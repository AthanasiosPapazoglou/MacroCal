import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/models/activity.dart';
import 'package:macro_cal_public/models/historical_measurement.dart';
import 'package:macro_cal_public/models/ingredient.dart';
import 'package:macro_cal_public/pages/today_overview_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => Get.put(DataController()));

  test('default ingredients asset loads 28 complete ingredients', () async {
    final List<dynamic> data = jsonDecode(
        await rootBundle.loadString('assets/data/default_ingredients.json'));
    final ingredients = Ingredient.listFromJson(data);
    expect(ingredients.length, 28);
    expect(
        ingredients.every((i) =>
            i.ingridientName != null && i.calories != null && i.salt != null),
        isTrue);
  });

  test('progressPercent stays between 0 and 1 for any goal', () {
    expect(progressPercent(100, 50), 0.5);
    expect(progressPercent(100, 150), 1.0);
    expect(progressPercent(100, -20), 0.0);
    expect(progressPercent(0, 0), 0.0);
    expect(progressPercent(0, 50), 1.0);
  });

  test('populateConsumptionVariables sums nutrients by quantity', () {
    dataController.ingredientsList.assignAll([
      Ingredient(
          calories: 45,
          proteins: 3.2,
          carbohydrates: 4.5,
          sugars: 4.5,
          fats: 1.5,
          saturated: 1,
          fiber: 0,
          salt: 50),
      Ingredient(
          calories: 100,
          proteins: 15,
          carbohydrates: 5.4,
          sugars: 1.2,
          fats: 1,
          saturated: 0.4,
          fiber: 0,
          salt: 2400),
    ]);
    dataController.ingredientQuantitiesList.assignAll([200, 50]);

    populateConsumptionVariables();

    expect(dataController.consumedCalories.value, closeTo(140, 1e-9));
    expect(dataController.proteinConsumed.value, closeTo(13.9, 1e-9));
    expect(dataController.sodiumConsumed.value, closeTo(1300, 1e-9));
  });

  test('calculateAdjustedCalories adds calories burned by exercise', () {
    dataController.dailyCalories.value = 2000;
    dataController.activitiesList
        .assignAll([Activity(caloryConsumptionPerUnit: 50)]);
    dataController.activitiyVolumesList.assignAll([3]);

    calculateAdjustedCalories();

    expect(dataController.adjustedCalories.value, 2150);
  });

  test('measurementIndexForDate matches the same day only', () {
    dataController.historicalMeasurementsList.assignAll(
        [HistoricalMeasurement(measurementDate: DateTime(2026, 10, 30, 9))]);

    expect(measurementIndexForDate(DateTime(2026, 10, 30, 21)), 0);
    expect(measurementIndexForDate(DateTime(2026, 10, 31)), -1);
  });
}
