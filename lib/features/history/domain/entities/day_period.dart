import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/core/domain/date_only.dart';

part 'day_period.freezed.dart';

enum DayPeriodKind { month, year, range }

/// Whole days from [from] to [to], both included.
@freezed
abstract class DayPeriod with _$DayPeriod {
  const factory({
    required DayPeriodKind kind,
    required DateTime from,
    required DateTime to,
  }) = _DayPeriod;

  const new _();

  factory monthOf(DateTime date) => DayPeriod(
    kind: DayPeriodKind.month,
    from: DateTime(date.year, date.month),
    to: DateTime(date.year, date.month + 1, 0),
  );

  factory yearOf(DateTime date) => DayPeriod(
    kind: DayPeriodKind.year,
    from: DateTime(date.year),
    to: DateTime(date.year, 12, 31),
  );

  factory between(DateTime first, DateTime last) {
    final a = first.dateOnly;
    final b = last.dateOnly;
    return DayPeriod(
      kind: DayPeriodKind.range,
      from: a.isAfter(b) ? b : a,
      to: a.isAfter(b) ? a : b,
    );
  }

  int get dayCount =>
      DateTime.utc(
        to.year,
        to.month,
        to.day,
      ).difference(DateTime.utc(from.year, from.month, from.day)).inDays +
      1;

  bool contains(DateTime date) {
    final day = date.dateOnly;
    return !day.isBefore(from) && !day.isAfter(to);
  }

  /// The same kind of period [steps] later, or earlier when negative.
  DayPeriod shifted(int steps) => switch (kind) {
    DayPeriodKind.month => DayPeriod.monthOf(
      DateTime(from.year, from.month + steps),
    ),
    DayPeriodKind.year => DayPeriod.yearOf(DateTime(from.year + steps)),
    DayPeriodKind.range => DayPeriod.between(
      DateTime(from.year, from.month, from.day + steps * dayCount),
      DateTime(to.year, to.month, to.day + steps * dayCount),
    ),
  };
}
