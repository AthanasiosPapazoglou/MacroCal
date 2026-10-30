import 'package:get/get.dart';
import 'package:macro_cal_public/models/activity.dart';
import 'package:macro_cal_public/models/historical_measurement.dart';
import 'package:macro_cal_public/models/ingredient.dart';

class DataController extends GetxController {
  RxBool isUserLogedIn = true.obs;

  RxList<Ingredient> ingredientsList = RxList<Ingredient>([]);

  RxList<int> ingredientQuantitiesList = RxList<int>([]);

  RxList<Activity> activitiesList = RxList([
    Activity(
      activityName: 'Walking',
      caloryConsumptionPerUnit: 50,
      metricDescription: 'Kilometers',
      isMetricBasedOnDuration: false,
    ),
  ]);

  RxList<int> activitiyVolumesList = RxList([0]);

  RxList<HistoricalMeasurement> historicalMeasurementsList = RxList([]);

  RxDouble adjustedCalories = 0.0.obs;
  RxDouble dailyCalories = 2100.0.obs;
  RxDouble dailyProteins = 100.0.obs;
  RxDouble dailyCarbs = 175.0.obs;
  RxDouble dailyFats = 78.0.obs;
  RxDouble dailyFiber = 35.0.obs;
  RxDouble sugarsLimit = 10.0.obs;
  RxDouble saturatedLimit = 8.0.obs;
  RxDouble sodiumLimit = 5800.0.obs;
  RxDouble consumedCalories = 0.0.obs;
  RxDouble proteinConsumed = 0.0.obs;
  RxDouble carbsConsumed = 0.0.obs;
  RxDouble fiberConsumed = 0.0.obs;
  RxDouble fatsConsumed = 0.0.obs;
  RxDouble sugarsConsumed = 0.0.obs;
  RxDouble saturatedConsumed = 0.0.obs;
  RxDouble sodiumConsumed = 0.0.obs;

  RxDouble bodyWeight = 94.0.obs;
  RxDouble bodyHeight = 184.0.obs;
}

final DataController dataController = Get.find();
