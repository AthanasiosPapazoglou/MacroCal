enum HistoryRange {
  week(7),
  month(30),
  all(null);

  new(this.days);

  final int? days;

  /// The first day the range includes on [today], or null when unbounded.
  DateTime? since(DateTime today) => switch (days) {
    final days? => DateTime(today.year, today.month, today.day - days + 1),
    null => null,
  };
}
