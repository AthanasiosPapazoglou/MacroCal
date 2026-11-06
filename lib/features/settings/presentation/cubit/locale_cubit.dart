import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/settings/domain/entities/app_language.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';

class LocaleCubit extends Cubit<AppLanguage> {
  new(this._repository, AppLanguage initialLanguage) : super(initialLanguage);

  final SettingsRepository _repository;

  Future<void> select(AppLanguage language) async {
    if (language == state) return;
    emit(language);
    await _repository.saveLanguage(language);
  }
}
