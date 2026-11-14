import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
import 'package:macro_cal_public/features/today/domain/entities/supplement_entry.dart';

abstract interface class FoodLogRepository {
  /// Today's ingredients, then recipes; those without grams are left out.
  Stream<List<FoodEntry>> watchEntries();

  /// Replaces today's food with these ingredient and recipe grams.
  Future<void> replaceGrams(
    Map<int, int> gramsByIngredientId, {
    Map<int, int> gramsByRecipeId,
  });

  /// Today's supplements; those without units are left out.
  Stream<List<SupplementEntry>> watchSupplementEntries();

  /// Replaces today's supplements with these units, leaving food as it is.
  Future<void> replaceSupplementUnits(Map<int, double> unitsBySupplementId);

  /// Clears today's food and supplements.
  Future<void> clear();
}
