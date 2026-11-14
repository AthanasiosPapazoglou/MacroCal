import 'package:macro_cal_public/features/settings/domain/entities/app_language.dart';

abstract interface class SettingsRepository {
  Future<AppLanguage> readLanguage();

  Future<void> saveLanguage(AppLanguage language);

  Stream<bool> watchMicrocalEnabled();

  Future<void> saveMicrocalEnabled({required bool enabled});
}
