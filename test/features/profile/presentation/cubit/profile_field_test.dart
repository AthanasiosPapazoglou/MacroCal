import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_field.dart';

void main() {
  group('parse', () {
    test('accepts non-negative decimals with a dot or comma', () {
      expect(ProfileField.parse('2100'), 2100);
      expect(ProfileField.parse(' 80.5 '), 80.5);
      expect(ProfileField.parse('80,5'), 80.5);
      expect(ProfileField.parse('0'), 0);
    });

    test('rejects empty, negative and non-finite input', () {
      expect(ProfileField.parse(''), isNull);
      expect(ProfileField.parse('abc'), isNull);
      expect(ProfileField.parse('-1'), isNull);
      expect(ProfileField.parse('Infinity'), isNull);
      expect(ProfileField.parse('NaN'), isNull);
    });
  });

  test('each field writes the value it reads', () {
    for (final field in ProfileField.values) {
      final updated = field.write(const Profile(), 12.5);

      expect(field.read(updated), 12.5, reason: field.name);
      for (final other in ProfileField.values.where((f) => f != field)) {
        expect(
          other.read(updated),
          other.read(const Profile()),
          reason: '${field.name} changed ${other.name}',
        );
      }
    }
  });
}
