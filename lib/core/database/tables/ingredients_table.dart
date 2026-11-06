import 'package:drift/drift.dart';

@DataClassName('IngredientRow')
class IngredientsTable extends Table {
  @override
  String get tableName => 'ingredients';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get category => text().nullable()();
  RealColumn get referenceG => real().withDefault(const Constant(100))();
  RealColumn get kcal => real()();
  RealColumn get proteinG => real()();
  RealColumn get carbsG => real()();
  RealColumn get sugarsG => real()();
  RealColumn get fatG => real()();
  RealColumn get saturatedG => real()();
  RealColumn get fiberG => real()();
  RealColumn get saltMg => real()();
}
