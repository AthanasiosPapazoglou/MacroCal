import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';

extension StoredMicronutrients on Map<Micronutrient, double> {
  /// Adds a stored amount, skipping nutrient names this version doesn't know.
  void addStored(String nutrient, double amount) {
    final key = Micronutrient.values.asNameMap()[nutrient];
    if (key != null) this[key] = amount;
  }
}
