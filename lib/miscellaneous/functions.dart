import 'package:flutter/material.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';
import 'package:macro_cal_public/models/historical_measurement.dart';
import '../controllers/data_controller.dart';

double navTabsImageSize = 30;

Image tabIcon(BuildContext context, String path) => Image.asset(
      path,
      width: navTabsImageSize,
      height: navTabsImageSize,
      cacheWidth:
          (navTabsImageSize * MediaQuery.devicePixelRatioOf(context)).round(),
    );

SizedBox heightSpacer(double space) {
  return SizedBox(
    height: space,
  );
}

TextStyle appBarStyle() =>
    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold);

int measurementIndexForDate(DateTime date) =>
    dataController.historicalMeasurementsList.indexWhere((measurement) =>
        DateUtils.isSameDay(measurement.measurementDate, date));

registerHistoricalMeasurement(DateTime selectedDate, DailySummary summary) {
  HistoricalMeasurement newMeasurement = HistoricalMeasurement(
      measurementDate: selectedDate,
      historicalMeasurementNutritionalData:
          HistoricalMeasurementNutritionalData(
        adjustedCalories: summary.adjustedKcal,
        dailyProteins: summary.goals.proteinG,
        dailyFiber: summary.goals.fiberG,
        sugarsLimit: summary.goals.sugarLimitPct,
        saturatedLimit: summary.goals.saturatedLimitPct,
        sodiumLimit: summary.goals.saltLimitMg,
        consumedCalories: summary.consumed.kcal,
        proteinConsumed: summary.consumed.proteinG,
        fiberConsumed: summary.consumed.fiberG,
        sugarsConsumed: summary.consumed.sugarsG,
        saturatedConsumed: summary.consumed.saturatedG,
        sodiumConsumed: summary.consumed.saltMg,
      ));

  final int index = measurementIndexForDate(selectedDate);
  if (index == -1) {
    dataController.historicalMeasurementsList.add(newMeasurement);
  } else {
    dataController.historicalMeasurementsList[index] = newMeasurement;
  }
}
