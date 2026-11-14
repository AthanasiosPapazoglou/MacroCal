import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';

/// Whether micronutrients are tracked; null until the setting is read.
class MicrocalTrackingCubit extends Cubit<bool?> {
  new(this._repository) : super(null);

  final SettingsRepository _repository;
  StreamSubscription<bool>? _subscription;

  void watch() {
    _subscription ??= _repository.watchMicrocalEnabled().listen(
      emit,
      onError: (Object _) {},
    );
  }

  Future<void> setEnabled({required bool enabled}) async {
    emit(enabled);
    try {
      await _repository.saveMicrocalEnabled(enabled: enabled);
    } on Exception {
      if (!isClosed) emit(!enabled);
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();
    await super.close();
  }
}
