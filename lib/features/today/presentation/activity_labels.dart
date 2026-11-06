import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity.dart';

extension ActivityLabels on Activity {
  String localizedName(AppLocalizations l10n) => switch (presetKey) {
    'walking' => l10n.activityWalking,
    _ => name,
  };

  String localizedUnit(AppLocalizations l10n) => switch (presetKey) {
    'walking' => l10n.activityKilometers,
    _ => unitLabel,
  };
}
