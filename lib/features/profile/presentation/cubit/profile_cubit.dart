import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_field.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_input.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  new(this._repository, {this._now = DateTime.now})
    : super(const ProfileState());

  final ProfileRepository _repository;
  final DateTime Function() _now;

  Future<void> load() async {
    try {
      final profile = await _repository.watchProfile().first;
      emit(ProfileState(status: ProfileStatus.ready, profile: profile));
    } on Exception {
      emit(state.copyWith(status: ProfileStatus.failure));
    }
  }

  Future<void> save(ProfileInput input) async {
    var profile = state.profile;
    for (final MapEntry(key: field, value: text) in input.fields.entries) {
      final value = ProfileField.parse(text);
      if (value == null) {
        emit(state.copyWith(status: ProfileStatus.invalid));
        return;
      }
      profile = field.write(profile, value);
    }
    if (!BirthYear.isValid(input.birthYear, currentYear: _now().year)) {
      emit(state.copyWith(status: ProfileStatus.invalid));
      return;
    }
    profile = profile.copyWith(
      sex: input.sex,
      birthYear: BirthYear.parse(input.birthYear),
    );

    emit(state.copyWith(status: ProfileStatus.saving, profile: profile));
    try {
      await _repository.saveProfile(profile);
      emit(state.copyWith(status: ProfileStatus.saved));
    } on Exception {
      emit(state.copyWith(status: ProfileStatus.failure));
    }
  }
}
