class HistoricalMeasurement {
  DateTime? measurementDate;
  HistoricalMeasurementNutritionalData? historicalMeasurementNutritionalData;

  HistoricalMeasurement(
      {this.measurementDate, this.historicalMeasurementNutritionalData});

  HistoricalMeasurement.fromJson(Map<String, dynamic> json) {
    measurementDate = DateTime.parse(json['measurementDate']);
    historicalMeasurementNutritionalData =
        json['historicalMeasurementNutritionalData'] != null
            ? HistoricalMeasurementNutritionalData.fromJson(
                json['historicalMeasurementNutritionalData'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['measurementDate'] = measurementDate!.toIso8601String();
    if (historicalMeasurementNutritionalData != null) {
      data['historicalMeasurementNutritionalData'] =
          historicalMeasurementNutritionalData!.toJson();
    }
    return data;
  }

  static List<Map<String, dynamic>> listToJson(
      List<HistoricalMeasurement> historicalMeasurements) {
    return historicalMeasurements
        .map((historicalMeasurement) => historicalMeasurement.toJson())
        .toList();
  }

  static List<HistoricalMeasurement> listFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((json) => HistoricalMeasurement.fromJson(json))
        .toList();
  }
}

class HistoricalMeasurementNutritionalData {
  double? adjustedCalories;
  double? dailyProteins;
  double? dailyFiber;
  double? sugarsLimit;
  double? saturatedLimit;
  double? sodiumLimit;
  double? consumedCalories;
  double? proteinConsumed;
  double? fiberConsumed;
  double? sugarsConsumed;
  double? saturatedConsumed;
  double? sodiumConsumed;

  HistoricalMeasurementNutritionalData(
      {this.adjustedCalories,
      this.dailyProteins,
      this.dailyFiber,
      this.sugarsLimit,
      this.saturatedLimit,
      this.sodiumLimit,
      this.consumedCalories,
      this.proteinConsumed,
      this.fiberConsumed,
      this.sugarsConsumed,
      this.saturatedConsumed,
      this.sodiumConsumed});

  HistoricalMeasurementNutritionalData.fromJson(Map<String, dynamic> json) {
    adjustedCalories = json['adjustedCalories'];
    dailyProteins = json['dailyProteins'];
    dailyFiber = json['dailyFiber'];
    sugarsLimit = json['sugarsLimit'];
    saturatedLimit = json['saturatedLimit'];
    sodiumLimit = json['sodiumLimit'];
    consumedCalories = json['consumedCalories'];
    proteinConsumed = json['proteinConsumed'];
    fiberConsumed = json['fiberConsumed'];
    sugarsConsumed = json['sugarsConsumed'];
    saturatedConsumed = json['saturatedConsumed'];
    sodiumConsumed = json['sodiumConsumed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adjustedCalories'] = adjustedCalories;
    data['dailyProteins'] = dailyProteins;
    data['dailyFiber'] = dailyFiber;
    data['sugarsLimit'] = sugarsLimit;
    data['saturatedLimit'] = saturatedLimit;
    data['sodiumLimit'] = sodiumLimit;
    data['consumedCalories'] = consumedCalories;
    data['proteinConsumed'] = proteinConsumed;
    data['fiberConsumed'] = fiberConsumed;
    data['sugarsConsumed'] = sugarsConsumed;
    data['saturatedConsumed'] = saturatedConsumed;
    data['sodiumConsumed'] = sodiumConsumed;
    return data;
  }
}
