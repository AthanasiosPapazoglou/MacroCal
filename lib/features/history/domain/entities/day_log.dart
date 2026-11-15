import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/reference_intake.dart';
import 'package:macro_cal_public/features/microcal/domain/services/reference_intakes.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';

part 'day_log.freezed.dart';

/// An archived day; [micros] is null when the day has no micronutrient data.
@freezed
abstract class DayLog with _$DayLog {
  const factory({
    required DateTime date,
    required DailySummary summary,
    MicroIntake? micros,
    Sex? sex,
    int? age,
  }) = _DayLog;

  const new _();

  /// The reference intakes for the day's sex, age and calorie goal; null
  /// under the minimum age.
  Map<Micronutrient, ReferenceIntake>? get references =>
      const ReferenceIntakes().forPerson(
        energyKcal: summary.goals.dailyKcal,
        sex: sex,
        age: age,
      );
}
