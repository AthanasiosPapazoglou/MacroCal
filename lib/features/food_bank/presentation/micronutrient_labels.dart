import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';

extension MicronutrientLabels on Micronutrient {
  String title(AppLocalizations l10n) => switch (this) {
    Micronutrient.vitaminA => l10n.micronutrientVitaminA,
    Micronutrient.vitaminD => l10n.micronutrientVitaminD,
    Micronutrient.vitaminE => l10n.micronutrientVitaminE,
    Micronutrient.vitaminK => l10n.micronutrientVitaminK,
    Micronutrient.vitaminC => l10n.micronutrientVitaminC,
    Micronutrient.thiamin => l10n.micronutrientThiamin,
    Micronutrient.riboflavin => l10n.micronutrientRiboflavin,
    Micronutrient.niacin => l10n.micronutrientNiacin,
    Micronutrient.vitaminB6 => l10n.micronutrientVitaminB6,
    Micronutrient.folate => l10n.micronutrientFolate,
    Micronutrient.vitaminB12 => l10n.micronutrientVitaminB12,
    Micronutrient.calcium => l10n.micronutrientCalcium,
    Micronutrient.phosphorus => l10n.micronutrientPhosphorus,
    Micronutrient.magnesium => l10n.micronutrientMagnesium,
    Micronutrient.potassium => l10n.micronutrientPotassium,
    Micronutrient.iron => l10n.micronutrientIron,
    Micronutrient.zinc => l10n.micronutrientZinc,
    Micronutrient.copper => l10n.micronutrientCopper,
    Micronutrient.manganese => l10n.micronutrientManganese,
    Micronutrient.selenium => l10n.micronutrientSelenium,
    Micronutrient.iodine => l10n.micronutrientIodine,
  };

  String get unitSymbol => switch (unit) {
    MicronutrientUnit.mg => 'mg',
    MicronutrientUnit.ug => 'µg',
  };
}

extension MicronutrientGroupLabels on MicronutrientGroup {
  String title(AppLocalizations l10n) => switch (this) {
    MicronutrientGroup.vitamin => l10n.micronutrientGroupVitamins,
    MicronutrientGroup.mineral => l10n.micronutrientGroupMinerals,
    MicronutrientGroup.traceElement => l10n.micronutrientGroupTraceElements,
  };

  List<Micronutrient> get members =>
      Micronutrient.values.where((nutrient) => nutrient.group == this).toList();
}
