import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/settings/domain/entities/app_language.dart';

void main() {
  test('fromCode matches supported codes', () {
    expect(AppLanguage.fromCode('en'), AppLanguage.english);
    expect(AppLanguage.fromCode('el'), AppLanguage.greek);
  });

  test('fromCode falls back to English', () {
    expect(AppLanguage.fromCode(null), AppLanguage.english);
    expect(AppLanguage.fromCode('de'), AppLanguage.english);
  });
}
