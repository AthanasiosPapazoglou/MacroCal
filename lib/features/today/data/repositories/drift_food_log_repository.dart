import 'dart:async';

import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
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
  Future<void> clear() => _database.transaction(_deleteAll);

  Future<void> _deleteAll() async {
    await _database.delete(_database.foodEntriesTable).go();
    await _database.delete(_database.recipeEntriesTable).go();
  }

  Stream<List<IngredientEntry>> _watchIngredientEntries() {
    final entries = _database.foodEntriesTable;
    final ingredients = _database.ingredientsTable;
    final query = _database.select(entries).join([
      innerJoin(ingredients, ingredients.id.equalsExp(entries.ingredientId)),
    ])..orderBy([OrderingTerm.asc(ingredients.id)]);

    return query.watch().map(
      (rows) => [
        for (final row in rows)
          IngredientEntry(
            ingredient: _ingredientFromRow(row.readTable(ingredients)),
            grams: row.readTable(entries).grams,
          ),
      ],
    );
  }

  Stream<List<RecipeEntry>> _watchRecipeEntries() {
    final entries = _database.recipeEntriesTable;
    final recipes = _database.recipesTable;
    final items = _database.recipeIngredientsTable;
    final ingredients = _database.ingredientsTable;
    final query = _database.select(entries).join([
      innerJoin(recipes, recipes.id.equalsExp(entries.recipeId)),
      leftOuterJoin(items, items.recipeId.equalsExp(recipes.id)),
      leftOuterJoin(ingredients, ingredients.id.equalsExp(items.ingredientId)),
    ])..orderBy([OrderingTerm.asc(recipes.id), OrderingTerm.asc(items.id)]);

    return query.watch().map((rows) {
      final byEntry = <RecipeEntryRow, (RecipeRow, List<RecipeIngredient>)>{};
      for (final row in rows) {
        final (_, recipeIngredients) = byEntry.putIfAbsent(
          row.readTable(entries),
          () => (row.readTable(recipes), []),
        );
        final item = row.readTableOrNull(items);
        if (item != null) {
          recipeIngredients.add(
            RecipeIngredient(
              ingredient: _ingredientFromRow(row.readTable(ingredients)),
              grams: item.grams,
            ),
          );
        }
      }
      return [
        for (final MapEntry(key: entry, value: (recipe, recipeIngredients))
            in byEntry.entries)
          RecipeEntry(
            recipe: Recipe(
              id: recipe.id,
              name: recipe.name,
              finalWeightGrams: recipe.finalWeightG,
              ingredients: recipeIngredients,
            ),
            grams: entry.grams,
          ),
      ];
    });
  }

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
