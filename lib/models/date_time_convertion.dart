class DateTimeConvertion {
  late DateTime? aDateTime;

  DateTimeConvertion(this.aDateTime);

  Map<String, dynamic> toJson() {
    return {
      'aDateTime': aDateTime!.toIso8601String(),
    };
  }

  factory DateTimeConvertion.fromJson(Map<String, dynamic> json) {
    return DateTimeConvertion(DateTime.parse(json['myDateTime']));
  }
}
