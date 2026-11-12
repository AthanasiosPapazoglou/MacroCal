import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/history/domain/entities/date_period.dart';

void main() {
  group('monthOf', () {
    test('covers the whole month', () {
      final period = DatePeriod.monthOf(DateTime(2026, 11, 12, 18));

      expect(period.kind, DatePeriodKind.month);
      expect(period.from, DateTime(2026, 11));
      expect(period.to, DateTime(2026, 11, 30));
      expect(period.dayCount, 30);
    });

    test('knows February in leap and common years', () {
      expect(
        DatePeriod.monthOf(DateTime(2028, 2, 3)).to,
        DateTime(2028, 2, 29),
      );
      expect(DatePeriod.monthOf(DateTime(2026, 2, 3)).dayCount, 28);
    });

    test('shifts across the year boundary', () {
      final december = DatePeriod.monthOf(DateTime(2026, 12, 5));

      expect(december.shifted(1), DatePeriod.monthOf(DateTime(2027)));
      expect(DatePeriod.monthOf(DateTime(2027)).shifted(-1), december);
    });
  });

  test('yearOf covers the calendar year and shifts by years', () {
    final year = DatePeriod.yearOf(DateTime(2026, 7, 4));

    expect(year.from, DateTime(2026));
    expect(year.to, DateTime(2026, 12, 31));
    expect(year.dayCount, 365);
    expect(year.shifted(-2), DatePeriod.yearOf(DateTime(2024)));
    expect(year.shifted(-2).dayCount, 366);
  });

  group('between', () {
    test('orders the ends and drops the time', () {
      final period = DatePeriod.between(
        DateTime(2026, 11, 10, 22),
        DateTime(2026, 11, 3, 7),
      );

      expect(period.kind, DatePeriodKind.range);
      expect(period.from, DateTime(2026, 11, 3));
      expect(period.to, DateTime(2026, 11, 10));
      expect(period.dayCount, 8);
    });

    test('shifts by its own length', () {
      final period = DatePeriod.between(
        DateTime(2026, 11, 3),
        DateTime(2026, 11, 10),
      );

      expect(
        period.shifted(-1),
        DatePeriod.between(DateTime(2026, 10, 26), DateTime(2026, 11, 2)),
      );
    });

    test('counts days across a daylight saving change', () {
      expect(
        DatePeriod.between(
          DateTime(2026, 3, 28),
          DateTime(2026, 3, 30),
        ).dayCount,
        3,
      );
    });
  });

  test('contains includes both ends at any time of day', () {
    final period = DatePeriod.monthOf(DateTime(2026, 11));

    expect(period.contains(DateTime(2026, 11, 1, 0, 1)), isTrue);
    expect(period.contains(DateTime(2026, 11, 30, 23, 59)), isTrue);
    expect(period.contains(DateTime(2026, 12)), isFalse);
    expect(period.contains(DateTime(2026, 10, 31, 23)), isFalse);
  });
}
