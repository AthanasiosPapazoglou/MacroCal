extension DateOnly on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);

  /// The date as `yyyy-MM-dd`.
  String get isoDay =>
      '${year.toString().padLeft(4, '0')}-'
      '${month.toString().padLeft(2, '0')}-'
      '${day.toString().padLeft(2, '0')}';
}

/// Parses a strict `yyyy-MM-dd` date, or returns null.
DateTime? parseIsoDay(String value) {
  final match = RegExp(r'^(\d{4})-(\d{2})-(\d{2})$').firstMatch(value);
  if (match == null) return null;
  final date = DateTime(
    int.parse(match[1]!),
    int.parse(match[2]!),
    int.parse(match[3]!),
  );
  return date.isoDay == value ? date : null;
}
