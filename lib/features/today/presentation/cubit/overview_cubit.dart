import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_state.dart';

class OverviewCubit extends Cubit<OverviewState> {
  new(this._profileRepository) : super(const OverviewState());

  final ProfileRepository _profileRepository;
  StreamSubscription<Profile>? _profileSubscription;

  void watch() {
    _profileSubscription ??= _profileRepository.watchProfile().listen(
      (profile) => emit(
        state.copyWith(status: OverviewStatus.ready, goals: profile.goals),
      ),
      onError: (Object _) =>
          emit(state.copyWith(status: OverviewStatus.failure)),
    );
  }

  @override
  Future<void> close() async {
    await _profileSubscription?.cancel();
    await super.close();
  }
}
