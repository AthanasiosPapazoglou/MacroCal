import 'package:drift/drift.dart';

@DataClassName('SupplementRow')
class SupplementsTable extends Table {
  @override
  String get tableName => 'supplements';

  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get unit => text()();
}
