import 'package:get/get.dart';
import 'package:macro_cal_public/models/historical_measurement.dart';
import 'package:macro_cal_public/models/ingredient.dart';

class DataController extends GetxController {
  RxList<Ingredient> ingredientsList = RxList<Ingredient>([]);

  RxList<int> ingredientQuantitiesList = RxList<int>([]);

  RxList<HistoricalMeasurement> historicalMeasurementsList = RxList([]);

  RxDouble consumedCalories = 0.0.obs;
  RxDouble proteinConsumed = 0.0.obs;
  RxDouble carbsConsumed = 0.0.obs;
  RxDouble fiberConsumed = 0.0.obs;
  RxDouble fatsConsumed = 0.0.obs;
  RxDouble sugarsConsumed = 0.0.obs;
  RxDouble saturatedConsumed = 0.0.obs;
  RxDouble sodiumConsumed = 0.0.obs;
}

final DataController dataController = Get.find();
