import 'dart:async';

import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
import 'package:macro_cal_public/features/today/domain/entities/supplement_entry.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';

class DriftFoodLogRepository implements FoodLogRepository {
  new(this._database);

  final AppDatabase _database;

  @override
  Stream<List<FoodEntry>> watchEntries() {
    final controller = StreamController<List<FoodEntry>>();
    final subscriptions = <StreamSubscription<void>>[];
    List<IngredientEntry>? ingredientEntries;
    List<RecipeEntry>? recipeEntries;

    void emitWhenBothArrived() {
      final ingredients = ingredientEntries;
      final recipes = recipeEntries;
      if (ingredients != null && recipes != null) {
        controller.add([...ingredients, ...recipes]);
      }
    }

    controller
      ..onListen = () {
        subscriptions.addAll([
          _watchIngredientEntries().listen((entries) {
            ingredientEntries = entries;
            emitWhenBothArrived();
          }, onError: controller.addError),
          _watchRecipeEntries().listen((entries) {
            recipeEntries = entries;
            emitWhenBothArrived();
          }, onError: controller.addError),
        ]);
      }
      ..onCancel = () => Future.wait([
        for (final subscription in subscriptions) subscription.cancel(),
      ]);
    return controller.stream;
  }

  @override
  Future<void> replaceGrams(
    Map<int, int> gramsByIngredientId, {
    Map<int, int> gramsByRecipeId = const {},
  }) => _database.transaction(() async {
    await _deleteAll();
    await _database.batch(
      (batch) => batch
        ..insertAll(_database.foodEntriesTable, [
          for (final MapEntry(key: ingredientId, value: grams)
              in gramsByIngredientId.entries)
            if (grams > 0)
              FoodEntriesTableCompanion.insert(
                ingredientId: ingredientId,
                grams: grams,
              ),
        ])
        ..insertAll(_database.recipeEntriesTable, [
          for (final MapEntry(key: recipeId, value: grams)
              in gramsByRecipeId.entries)
            if (grams > 0)
              RecipeEntriesTableCompanion.insert(
                recipeId: recipeId,
                grams: grams,
              ),
        ]),
    );
  });

  @override
  Stream<List<SupplementEntry>> watchSupplementEntries() {
    final entries = _database.supplementEntriesTable;
    final supplements = _database.supplementsTable;
    final micros = _database.supplementMicronutrientsTable;
    final query = _database.select(entries).join([
      innerJoin(supplements, supplements.id.equalsExp(entries.supplementId)),
      leftOuterJoin(micros, micros.supplementId.equalsExp(supplements.id)),
    ])..orderBy([OrderingTerm.asc(supplements.id)]);

    return query.watch().map((rows) {
      final byEntry =
          <SupplementEntryRow, (SupplementRow, Map<Micronutrient, double>)>{};
      for (final row in rows) {
        final (_, amounts) = byEntry.putIfAbsent(
          row.readTable(entries),
          () => (row.readTable(supplements), {}),
        );
        if (row.readTableOrNull(micros) case final micro?) {
          _addStored(amounts, micro.nutrient, micro.amount);
        }
      }
      return [
        for (final MapEntry(key: entry, value: (supplement, amounts))
            in byEntry.entries)
          if (SupplementUnit.values.asNameMap()[supplement.unit]
              case final unit?)
            SupplementEntry(
              supplement: Supplement(
                id: supplement.id,
                name: supplement.name,
                unit: unit,
                microsPerUnit: Micronutrients(amounts: amounts),
              ),
              units: entry.units,
            ),
      ];
    });
  }

  @override
  Future<void> replaceSupplementUnits(Map<int, double> unitsBySupplementId) =>
      _database.transaction(() async {
        await _database.delete(_database.supplementEntriesTable).go();
        await _database.batch(
          (batch) => batch.insertAll(_database.supplementEntriesTable, [
            for (final MapEntry(key: supplementId, value: units)
                in unitsBySupplementId.entries)
              if (units > 0)
                SupplementEntriesTableCompanion.insert(
                  supplementId: supplementId,
                  units: units,
                ),
          ]),
        );
      });

  @override
  Future<void> clear() => _database.transaction(() async {
    await _deleteAll();
    await _database.delete(_database.supplementEntriesTable).go();
  });

  Future<void> _deleteAll() async {
    await _database.delete(_database.foodEntriesTable).go();
    await _database.delete(_database.recipeEntriesTable).go();
  }

  Stream<List<IngredientEntry>> _watchIngredientEntries() {
    final entries = _database.foodEntriesTable;
    final ingredients = _database.ingredientsTable;
    final micros = _database.ingredientMicronutrientsTable;
    final query = _database.select(entries).join([
      innerJoin(ingredients, ingredients.id.equalsExp(entries.ingredientId)),
      leftOuterJoin(micros, micros.ingredientId.equalsExp(ingredients.id)),
    ])..orderBy([OrderingTerm.asc(ingredients.id)]);

    return query.watch().map((rows) {
      final byEntry = <FoodEntryRow, _Ingredient>{};
      for (final row in rows) {
        final (_, amounts) = byEntry.putIfAbsent(
          row.readTable(entries),
          () => (row.readTable(ingredients), {}),
        );
        if (row.readTableOrNull(micros) case final micro?) {
          _addStored(amounts, micro.nutrient, micro.amount);
        }
      }
      return [
        for (final MapEntry(key: entry, value: ingredient) in byEntry.entries)
          IngredientEntry(
            ingredient: _toIngredient(ingredient),
            grams: entry.grams,
          ),
      ];
    });
  }

  Stream<List<RecipeEntry>> _watchRecipeEntries() {
    final entries = _database.recipeEntriesTable;
    final recipes = _database.recipesTable;
    final items = _database.recipeIngredientsTable;
    final ingredients = _database.ingredientsTable;
    final micros = _database.ingredientMicronutrientsTable;
    final query = _database.select(entries).join([
      innerJoin(recipes, recipes.id.equalsExp(entries.recipeId)),
      leftOuterJoin(items, items.recipeId.equalsExp(recipes.id)),
      leftOuterJoin(ingredients, ingredients.id.equalsExp(items.ingredientId)),
      leftOuterJoin(micros, micros.ingredientId.equalsExp(ingredients.id)),
    ])..orderBy([OrderingTerm.asc(recipes.id), OrderingTerm.asc(items.id)]);

    return query.watch().map((rows) {
      final byEntry =
          <
            RecipeEntryRow,
            (RecipeRow, Map<RecipeIngredientRow, _Ingredient>)
          >{};
      for (final row in rows) {
        final (_, recipeItems) = byEntry.putIfAbsent(
          row.readTable(entries),
          () => (row.readTable(recipes), {}),
        );
        final item = row.readTableOrNull(items);
        if (item == null) continue;
        final (_, amounts) = recipeItems.putIfAbsent(
          item,
          () => (row.readTable(ingredients), {}),
        );
        if (row.readTableOrNull(micros) case final micro?) {
          _addStored(amounts, micro.nutrient, micro.amount);
        }
      }
      return [
        for (final MapEntry(key: entry, value: (recipe, recipeItems))
            in byEntry.entries)
          RecipeEntry(
            recipe: Recipe(
              id: recipe.id,
              name: recipe.name,
              finalWeightGrams: recipe.finalWeightG,
              ingredients: [
                for (final MapEntry(key: item, value: ingredient)
                    in recipeItems.entries)
                  RecipeIngredient(
                    ingredient: _toIngredient(ingredient),
                    grams: item.grams,
                  ),
              ],
            ),
            grams: entry.grams,
          ),
      ];
    });
  }

  void _addStored(
    Map<Micronutrient, double> amounts,
    String nutrient,
    double amount,
  ) {
    final key = Micronutrient.values.asNameMap()[nutrient];
    if (key != null) amounts[key] = amount;
  }

  Ingredient _toIngredient(_Ingredient ingredient) {
    final (row, amounts) = ingredient;
    return Ingredient(
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
        micros: Micronutrients(amounts: amounts),
      ),
    );
  }
}

typedef _Ingredient = (IngredientRow, Map<Micronutrient, double>);
