import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';

abstract interface class IngredientRepository {
  Stream<List<Ingredient>> watchIngredients();

  Stream<Ingredient?> watchIngredient(int id);

  Future<int> addIngredient({
    required String name,
    required Nutrients per100g,
    String? category,
    double referenceGrams,
  });

  Future<void> updateIngredient(Ingredient ingredient);

  Future<void> deleteIngredient(int id);
}
