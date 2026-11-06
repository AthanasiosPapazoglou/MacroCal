import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/models/historical_measurement.dart';
import 'package:macro_cal_public/pages/today_overview_page.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() => Get.put(DataController()));

  test('progressPercent stays between 0 and 1 for any goal', () {
    expect(progressPercent(100, 50), 0.5);
    expect(progressPercent(100, 150), 1.0);
    expect(progressPercent(100, -20), 0.0);
    expect(progressPercent(0, 0), 0.0);
    expect(progressPercent(0, 50), 1.0);
  });

  test('measurementIndexForDate matches the same day only', () {
    dataController.historicalMeasurementsList.assignAll([
      HistoricalMeasurement(measurementDate: DateTime(2026, 10, 30, 9)),
    ]);

    expect(measurementIndexForDate(DateTime(2026, 10, 30, 21)), 0);
    expect(measurementIndexForDate(DateTime(2026, 10, 31)), -1);
  });
}
