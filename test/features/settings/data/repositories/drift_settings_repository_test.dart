import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/settings/data/repositories/drift_settings_repository.dart';
import 'package:macro_cal_public/features/settings/domain/entities/app_language.dart';

import '../../../../helpers/test_database.dart';

void main() {
  late AppDatabase database;
  late DriftSettingsRepository repository;

  setUp(() {
    database = createTestDatabase();
    repository = DriftSettingsRepository(database);
  });
  tearDown(() => database.close());

  test('defaults to English when nothing is saved', () async {
    expect(await repository.readLanguage(), AppLanguage.english);
  });

  test('reads back the saved language', () async {
    await repository.saveLanguage(AppLanguage.greek);

    expect(await repository.readLanguage(), AppLanguage.greek);
  });

  test('keeps a single settings row when saving again', () async {
    await repository.saveLanguage(AppLanguage.greek);
    await repository.saveLanguage(AppLanguage.english);

    final rows = await database.select(database.settings).get();
    expect(rows, hasLength(1));
    expect(await repository.readLanguage(), AppLanguage.english);
  });

  test('MicroCal tracking is off until switched on', () async {
    expect(await repository.watchMicrocalEnabled().first, isFalse);

    await repository.saveMicrocalEnabled(enabled: true);
    await repository.saveLanguage(AppLanguage.greek);

    expect(await repository.watchMicrocalEnabled().first, isTrue);
    expect(await repository.readLanguage(), AppLanguage.greek);
  });
}
