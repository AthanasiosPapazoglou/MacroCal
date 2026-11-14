import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';

extension IngredientRowMapper on IngredientRow {
  Ingredient toIngredient([Micronutrients micros = const Micronutrients()]) =>
      Ingredient(
        id: id,
        name: name,
        category: category,
        referenceGrams: referenceG,
        per100g: Nutrients(
          kcal: kcal,
          proteinG: proteinG,
          carbsG: carbsG,
          sugarsG: sugarsG,
          fatG: fatG,
          saturatedG: saturatedG,
          fiberG: fiberG,
          saltMg: saltMg,
          micros: micros,
        ),
      );
}
