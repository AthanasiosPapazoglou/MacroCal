import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_field.dart';

extension IngredientFieldLabels on IngredientField {
  String label(AppLocalizations l10n) => switch (this) {
    IngredientField.referenceGrams => l10n.ingredientsPageLabels0,
    IngredientField.name => l10n.ingredientsPageLabels1,
    IngredientField.category => l10n.ingredientsPageLabels2,
    IngredientField.kcal => l10n.ingredientsPageLabels3,
    IngredientField.fatG => l10n.ingredientsPageLabels4,
    IngredientField.saturatedG => l10n.ingredientsPageLabels5,
    IngredientField.carbsG => l10n.ingredientsPageLabels6,
    IngredientField.sugarsG => l10n.ingredientsPageLabels7,
    IngredientField.fiberG => l10n.ingredientsPageLabels8,
    IngredientField.proteinG => l10n.ingredientsPageLabels9,
    IngredientField.saltG => l10n.ingredientsPageLabels10,
  };

  String hint(AppLocalizations l10n) => switch (this) {
    IngredientField.referenceGrams => l10n.ingredientsPageHints0,
    IngredientField.name => l10n.ingredientsPageHints1,
    IngredientField.category => l10n.ingredientsPageHints2,
    IngredientField.kcal => l10n.ingredientsPageHints3,
    IngredientField.fatG => l10n.ingredientsPageHints4,
    IngredientField.saturatedG => l10n.ingredientsPageHints5,
    IngredientField.carbsG => l10n.ingredientsPageHints6,
    IngredientField.sugarsG => l10n.ingredientsPageHints7,
    IngredientField.fiberG => l10n.ingredientsPageHints8,
    IngredientField.proteinG => l10n.ingredientsPageHints9,
    IngredientField.saltG => l10n.ingredientsPageHints10,
  };
}
