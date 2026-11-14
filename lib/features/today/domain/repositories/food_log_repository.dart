import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';

abstract interface class FoodLogRepository {
  /// Today's ingredients, then recipes; those without grams are left out.
  Stream<List<FoodEntry>> watchEntries();

  /// Replaces today's whole log with these ingredient and recipe grams.
  Future<void> replaceGrams(
    Map<int, int> gramsByIngredientId, {
    Map<int, int> gramsByRecipeId,
  });

  Future<void> clear();
}
