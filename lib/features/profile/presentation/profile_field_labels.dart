import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_field.dart';

extension ProfileFieldLabels on ProfileField {
  String label(AppLocalizations l10n) => switch (this) {
    ProfileField.dailyKcal => l10n.profilePageLabels0,
    ProfileField.proteinG => l10n.profilePageLabels1,
    ProfileField.fiberG => l10n.profilePageLabels2,
    ProfileField.sugarLimitPct => l10n.profilePageLabels3,
    ProfileField.saturatedLimitPct => l10n.profilePageLabels4,
    ProfileField.saltLimitMg => l10n.profilePageLabels5,
    ProfileField.weightKg => l10n.profilePageLabels6,
    ProfileField.heightCm => l10n.profilePageLabels7,
  };
}

extension SexLabels on Sex {
  String label(AppLocalizations l10n) => switch (this) {
    Sex.male => l10n.profilePageSexMale,
    Sex.female => l10n.profilePageSexFemale,
  };
}
