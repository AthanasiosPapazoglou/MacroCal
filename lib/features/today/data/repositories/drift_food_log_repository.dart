import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';

class DriftFoodLogRepository implements FoodLogRepository {
  new(this._database);

  final AppDatabase _database;

  @override
  Stream<List<FoodEntry>> watchEntries() {
    final entries = _database.foodEntriesTable;
    final ingredients = _database.ingredientsTable;
    final query = _database.select(entries).join([
      innerJoin(ingredients, ingredients.id.equalsExp(entries.ingredientId)),
    ])..orderBy([OrderingTerm.asc(ingredients.id)]);

    return query.watch().map(
      (rows) => [
        for (final row in rows)
          FoodEntry(
            ingredient: _ingredientFromRow(row.readTable(ingredients)),
            grams: row.readTable(entries).grams,
          ),
      ],
    );
  }

  @override
  Future<void> replaceGrams(Map<int, int> gramsByIngredientId) =>
      _database.transaction(() async {
        await _database.delete(_database.foodEntriesTable).go();
        await _database.batch(
          (batch) => batch.insertAll(_database.foodEntriesTable, [
            for (final MapEntry(key: ingredientId, value: grams)
                in gramsByIngredientId.entries)
              if (grams > 0)
                FoodEntriesTableCompanion.insert(
                  ingredientId: ingredientId,
                  grams: grams,
                ),
          ]),
        );
      });

  @override
  Future<void> clear() => _database.delete(_database.foodEntriesTable).go();

  Ingredient _ingredientFromRow(IngredientRow row) => Ingredient(
    id: row.id,
    name: row.name,
    category: row.category,
    referenceGrams: row.referenceG,
    per100g: Nutrients(
      kcal: row.kcal,
      proteinG: row.proteinG,
      carbsG: row.carbsG,
      sugarsG: row.sugarsG,
      fatG: row.fatG,
      saturatedG: row.saturatedG,
      fiberG: row.fiberG,
      saltMg: row.saltMg,
    ),
  );
}
