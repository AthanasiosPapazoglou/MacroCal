import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';

extension SupplementUnitLabels on SupplementUnit {
  String title(AppLocalizations l10n) => switch (this) {
    SupplementUnit.tablet => l10n.supplementUnitTablet,
    SupplementUnit.capsule => l10n.supplementUnitCapsule,
    SupplementUnit.drop => l10n.supplementUnitDrop,
    SupplementUnit.ml => l10n.supplementUnitMl,
    SupplementUnit.scoop => l10n.supplementUnitScoop,
  };

  /// The lowercase plural shown next to a logged amount.
  String plural(AppLocalizations l10n) => switch (this) {
    SupplementUnit.tablet => l10n.supplementUnitsTablet,
    SupplementUnit.capsule => l10n.supplementUnitsCapsule,
    SupplementUnit.drop => l10n.supplementUnitsDrop,
    SupplementUnit.ml => l10n.supplementUnitsMl,
    SupplementUnit.scoop => l10n.supplementUnitsScoop,
  };
}
