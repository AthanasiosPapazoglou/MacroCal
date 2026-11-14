import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';

part 'profile.freezed.dart';

@freezed
abstract class Profile with _$Profile {
  const factory({
    @Default(NutritionGoals()) NutritionGoals goals,
    @Default(94) double weightKg,
    @Default(184) double heightCm,
    Sex? sex,
    int? birthYear,
  }) = _Profile;

  const new _();

  /// Age in the year of [date], counted from the birth year alone.
  int? ageOn(DateTime date) {
    final year = birthYear;
    return year == null ? null : date.year - year;
  }
}
