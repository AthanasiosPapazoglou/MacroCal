class Activity {
  String? activityName;
  int? caloryConsumptionPerUnit;
  String? metricDescription;
  bool? isMetricBasedOnDuration;

  Activity({
    this.activityName,
    this.caloryConsumptionPerUnit,
    this.metricDescription,
    this.isMetricBasedOnDuration,
  });

  Activity.fromJson(Map<String, dynamic> json) {
    activityName = json['activityName'];
    caloryConsumptionPerUnit = json['caloryConsumptionPerUnit'];
    metricDescription = json['metricDescription'];
    isMetricBasedOnDuration = json['isMetricBasedOnDuration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['activityName'] = activityName;
    data['caloryConsumptionPerUnit'] = caloryConsumptionPerUnit;
    data['metricDescription'] = metricDescription;
    data['isMetricBasedOnDuration'] = isMetricBasedOnDuration;
    return data;
  }

  static List<Map<String, dynamic>> listToJson(List<Activity> activities) {
    return activities.map((activity) => activity.toJson()).toList();
  }

  static List<Activity> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => Activity.fromJson(json)).toList();
  }
}
