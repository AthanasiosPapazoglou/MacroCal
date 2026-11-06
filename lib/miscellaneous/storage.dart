import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/models/historical_measurement.dart';

void globalDataSave() {
  final dataAsString = jsonEncode(HistoricalMeasurement.listToJson(
      dataController.historicalMeasurementsList));
  GetStorage().write('historicalMeasurementList', dataAsString);
}

void globalDataLoad() {
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
