import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';

enum ProfileField {
  dailyKcal,
  proteinG,
  fiberG,
  sugarLimitPct,
  saturatedLimitPct,
  saltLimitMg,
  weightKg,
  heightCm;

  double read(Profile profile) => switch (this) {
    dailyKcal => profile.goals.dailyKcal,
    proteinG => profile.goals.proteinG,
    fiberG => profile.goals.fiberG,
    sugarLimitPct => profile.goals.sugarLimitPct,
    saturatedLimitPct => profile.goals.saturatedLimitPct,
    saltLimitMg => profile.goals.saltLimitMg,
    weightKg => profile.weightKg,
    heightCm => profile.heightCm,
  };

  Profile write(Profile profile, double value) => switch (this) {
    dailyKcal => profile.copyWith.goals(dailyKcal: value),
    proteinG => profile.copyWith.goals(proteinG: value),
    fiberG => profile.copyWith.goals(fiberG: value),
    sugarLimitPct => profile.copyWith.goals(sugarLimitPct: value),
    saturatedLimitPct => profile.copyWith.goals(saturatedLimitPct: value),
    saltLimitMg => profile.copyWith.goals(saltLimitMg: value),
    weightKg => profile.copyWith(weightKg: value),
    heightCm => profile.copyWith(heightCm: value),
  };

  static double? parse(String text) {
    final value = double.tryParse(text.trim().replaceAll(',', '.'));
    return value == null || !value.isFinite || value < 0 ? null : value;
  }
}
