import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/domain/date_only.dart';

void main() {
  test('isoDay pads the parts and drops the time', () {
    expect(DateTime(2026, 3, 7, 22, 15).isoDay, '2026-03-07');
  });

  test('parseIsoDay reads a strict date', () {
    expect(parseIsoDay('2026-11-10'), DateTime(2026, 11, 10));
  });

  for (final value in ['abc', '2026-1-10', '2026-13-01', '2026-02-30', '']) {
    test('parseIsoDay rejects "$value"', () {
      expect(parseIsoDay(value), isNull);
    });
  }
}
