import 'package:drift/drift.dart';

@DataClassName('RecipeRow')
class RecipesTable extends Table {
  @override
  String get tableName => 'recipes';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get finalWeightG => integer().nullable()();
}
