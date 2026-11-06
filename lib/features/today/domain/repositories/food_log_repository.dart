import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';

abstract interface class FoodLogRepository {
  /// Today's logged ingredients; ingredients without grams are left out.
  Stream<List<FoodEntry>> watchEntries();

  Future<void> replaceGrams(Map<int, int> gramsByIngredientId);

  Future<void> clear();
}
