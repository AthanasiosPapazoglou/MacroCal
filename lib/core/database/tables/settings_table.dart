import 'package:drift/drift.dart';

class Settings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get localeCode => text().nullable()();
  BoolColumn get microcalEnabled =>
      boolean().withDefault(const Constant(false))();
}
