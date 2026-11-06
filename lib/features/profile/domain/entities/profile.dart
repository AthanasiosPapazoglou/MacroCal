import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  const factory({
    @Default(NutritionGoals()) NutritionGoals goals,
    @Default(94) double weightKg,
    @Default(184) double heightCm,
  }) = _Profile;
}
