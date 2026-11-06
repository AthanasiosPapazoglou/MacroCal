import 'package:get/get.dart';
import 'package:macro_cal_public/models/historical_measurement.dart';

class DataController extends GetxController {
  RxList<HistoricalMeasurement> historicalMeasurementsList = RxList([]);
}

final DataController dataController = Get.find();
