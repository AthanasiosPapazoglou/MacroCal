import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/settings/domain/entities/app_language.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';

class DriftSettingsRepository implements SettingsRepository {
  new(this._database);

  static const _rowId = 1;

  final AppDatabase _database;

  @override
  Future<AppLanguage> readLanguage() async {
    final row = await _row().getSingleOrNull();
    return AppLanguage.fromCode(row?.localeCode);
  }

  @override
  Future<void> saveLanguage(AppLanguage language) => _database
      .into(_database.settings)
      .insertOnConflictUpdate(
        SettingsCompanion(
          id: const Value(_rowId),
          localeCode: Value(language.code),
        ),
      );

  @override
  Stream<bool> watchMicrocalEnabled() =>
      _row().watchSingleOrNull().map((row) => row?.microcalEnabled ?? false);

  @override
  Future<void> saveMicrocalEnabled({required bool enabled}) => _database
      .into(_database.settings)
      .insertOnConflictUpdate(
        SettingsCompanion(
          id: const Value(_rowId),
          microcalEnabled: Value(enabled),
        ),
      );

  SimpleSelectStatement<$SettingsTable, Setting> _row() =>
      _database.select(_database.settings)
        ..where((settings) => settings.id.equals(_rowId));
}
