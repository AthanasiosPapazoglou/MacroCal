import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';

abstract interface class ProfileRepository {
  Stream<Profile> watchProfile();

  Future<void> saveProfile(Profile profile);
}
