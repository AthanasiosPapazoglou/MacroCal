import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/reference_intake.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';

part 'microcal_state.freezed.dart';

enum MicroCalStatus { loading, ready, failure }

enum MicroCalPeriod { today, week }

/// [references] is null under the minimum age; [weekDays] counts the days of
/// the last 7 that have micronutrient data.
@freezed
abstract class MicroCalState with _$MicroCalState {
  const factory({
    @Default(MicroCalStatus.loading) MicroCalStatus status,
    @Default(MicroCalPeriod.week) MicroCalPeriod period,
    @Default(false) bool enabled,
    @Default(MicroIntake()) MicroIntake today,
    @Default(MicroIntake()) MicroIntake week,
    @Default(0) int weekDays,
    Sex? sex,
    int? age,
    Map<Micronutrient, ReferenceIntake>? references,
  }) = _MicroCalState;

  const new _();

  MicroIntake get intake => switch (period) {
    MicroCalPeriod.today => today,
    MicroCalPeriod.week => week,
  };
}
