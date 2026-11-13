import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/data/mappers/ingredient_row_mapper.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';

class DriftIngredientRepository implements IngredientRepository {
  new(this._database);

  final AppDatabase _database;

  @override
  Stream<List<Ingredient>> watchIngredients() {
    final query = _database.select(_database.ingredientsTable)
      ..orderBy([(ingredient) => OrderingTerm.asc(ingredient.id)]);
    return query.watch().map(
      (rows) => [for (final row in rows) row.toIngredient()],
    );
  }

  @override
  Stream<Ingredient?> watchIngredient(int id) {
    final query = _database.select(_database.ingredientsTable)
      ..where((ingredient) => ingredient.id.equals(id));
    return query.watchSingleOrNull().map((row) => row?.toIngredient());
  }

  @override
  Future<int> addIngredient({
    required String name,
    required Nutrients per100g,
    String? category,
    double referenceGrams = 100,
  }) => _database
      .into(_database.ingredientsTable)
      .insert(
        IngredientsTableCompanion.insert(
          name: name,
          category: Value(category),
          referenceG: Value(referenceGrams),
          kcal: per100g.kcal,
          proteinG: per100g.proteinG,
          carbsG: per100g.carbsG,
          sugarsG: per100g.sugarsG,
          fatG: per100g.fatG,
          saturatedG: per100g.saturatedG,
          fiberG: per100g.fiberG,
          saltMg: per100g.saltMg,
        ),
      );

  @override
  Future<void> updateIngredient(Ingredient ingredient) => _database
      .update(_database.ingredientsTable)
      .replace(
        IngredientRow(
          id: ingredient.id,
          name: ingredient.name,
          category: ingredient.category,
          referenceG: ingredient.referenceGrams,
          kcal: ingredient.per100g.kcal,
          proteinG: ingredient.per100g.proteinG,
          carbsG: ingredient.per100g.carbsG,
          sugarsG: ingredient.per100g.sugarsG,
          fatG: ingredient.per100g.fatG,
          saturatedG: ingredient.per100g.saturatedG,
          fiberG: ingredient.per100g.fiberG,
          saltMg: ingredient.per100g.saltMg,
        ),
      );

  @override
  Future<void> deleteIngredient(int id) => (_database.delete(
    _database.ingredientsTable,
  )..where((ingredient) => ingredient.id.equals(id))).go();
}
