import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';

part 'profile_state.freezed.dart';

enum ProfileStatus { loading, ready, invalid, saving, saved, failure }

@freezed
abstract class ProfileState with _$ProfileState {
  const factory({
    @Default(ProfileStatus.loading) ProfileStatus status,
    @Default(Profile()) Profile profile,
  }) = _ProfileState;
}
