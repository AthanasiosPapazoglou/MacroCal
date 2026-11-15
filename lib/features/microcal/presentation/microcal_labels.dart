import 'package:intl/intl.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/presentation/micronutrient_labels.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/reference_intake.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';

/// Which reference intakes apply: EFSA for a known sex and age, else EU NRVs.
String referenceIntakesLine(AppLocalizations l10n, {Sex? sex, int? age}) =>
    switch ((sex, age)) {
      (Sex.male, final age?) => l10n.microcalReferenceEfsaMen(age),
      (Sex.female, final age?) => l10n.microcalReferenceEfsaWomen(age),
      _ => l10n.microcalReferenceNrv,
    };

extension MicronutrientDescriptions on Micronutrient {
  String about(AppLocalizations l10n) => switch (this) {
    Micronutrient.vitaminA => l10n.microcalAboutVitaminA,
    Micronutrient.vitaminD => l10n.microcalAboutVitaminD,
    Micronutrient.vitaminE => l10n.microcalAboutVitaminE,
    Micronutrient.vitaminK => l10n.microcalAboutVitaminK,
    Micronutrient.vitaminC => l10n.microcalAboutVitaminC,
    Micronutrient.thiamin => l10n.microcalAboutThiamin,
    Micronutrient.riboflavin => l10n.microcalAboutRiboflavin,
    Micronutrient.niacin => l10n.microcalAboutNiacin,
    Micronutrient.vitaminB6 => l10n.microcalAboutVitaminB6,
    Micronutrient.folate => l10n.microcalAboutFolate,
    Micronutrient.vitaminB12 => l10n.microcalAboutVitaminB12,
    Micronutrient.calcium => l10n.microcalAboutCalcium,
    Micronutrient.phosphorus => l10n.microcalAboutPhosphorus,
    Micronutrient.magnesium => l10n.microcalAboutMagnesium,
    Micronutrient.potassium => l10n.microcalAboutPotassium,
    Micronutrient.iron => l10n.microcalAboutIron,
    Micronutrient.zinc => l10n.microcalAboutZinc,
    Micronutrient.copper => l10n.microcalAboutCopper,
    Micronutrient.manganese => l10n.microcalAboutManganese,
    Micronutrient.selenium => l10n.microcalAboutSelenium,
    Micronutrient.iodine => l10n.microcalAboutIodine,
  };

  /// [amount] with up to two decimals below 10 and none from 100, and the unit.
  String formatAmount(double amount, AppLocalizations l10n) {
    final pattern = amount >= 100
        ? '0'
        : amount >= 10
        ? '0.#'
        : '0.##';
    return '${NumberFormat(pattern, l10n.localeName).format(amount)} '
        '$unitSymbol';
  }
}

extension ReferenceSourceLabels on ReferenceSource {
  String label(AppLocalizations l10n) => switch (this) {
    ReferenceSource.efsa => 'EFSA',
    ReferenceSource.nasem => 'NASEM',
    ReferenceSource.euNrv => l10n.microcalSourceEuNrv,
  };
}
