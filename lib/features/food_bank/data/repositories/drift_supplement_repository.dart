import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/food_bank/data/mappers/micronutrient_rows.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/supplement_repository.dart';

class DriftSupplementRepository implements SupplementRepository {
  new(this._database);

  final AppDatabase _database;

  @override
  Stream<List<Supplement>> watchSupplements() => _watch();

  @override
  Stream<Supplement?> watchSupplement(int id) =>
      _watch(id: id).map((supplements) => supplements.firstOrNull);

  @override
  Future<int> addSupplement({
    required String name,
    required SupplementUnit unit,
    Micronutrients microsPerUnit = const Micronutrients(),
  }) => _database.transaction(() async {
    final id = await _database
        .into(_database.supplementsTable)
        .insert(SupplementsTableCompanion.insert(name: name, unit: unit.name));
    await _insertMicros(id, microsPerUnit);
    return id;
  });

  @override
  Future<void> updateSupplement(Supplement supplement) =>
      _database.transaction(() async {
        await _database
            .update(_database.supplementsTable)
            .replace(
              SupplementRow(
                id: supplement.id,
                name: supplement.name,
                unit: supplement.unit.name,
              ),
            );
        await (_database.delete(
          _database.supplementMicronutrientsTable,
        )..where((micro) => micro.supplementId.equals(supplement.id))).go();
        await _insertMicros(supplement.id, supplement.microsPerUnit);
      });

  @override
  Future<void> deleteSupplement(int id) => (_database.delete(
    _database.supplementsTable,
  )..where((supplement) => supplement.id.equals(id))).go();

  Stream<List<Supplement>> _watch({int? id}) {
    final supplements = _database.supplementsTable;
    final micros = _database.supplementMicronutrientsTable;
    final query = _database.select(supplements).join([
      leftOuterJoin(micros, micros.supplementId.equalsExp(supplements.id)),
    ])..orderBy([OrderingTerm.asc(supplements.id)]);
    if (id != null) query.where(supplements.id.equals(id));

    return query.watch().map((rows) {
      final amountsBySupplement = <SupplementRow, Map<Micronutrient, double>>{};
      for (final row in rows) {
        final amounts = amountsBySupplement.putIfAbsent(
          row.readTable(supplements),
          () => {},
        );
        if (row.readTableOrNull(micros) case final micro?) {
          amounts.addStored(micro.nutrient, micro.amount);
        }
      }
      return [
        for (final MapEntry(key: supplement, value: amounts)
            in amountsBySupplement.entries)
          if (SupplementUnit.values.asNameMap()[supplement.unit]
              case final unit?)
            Supplement(
              id: supplement.id,
              name: supplement.name,
              unit: unit,
              microsPerUnit: Micronutrients(amounts: amounts),
            ),
      ];
    });
  }

  Future<void> _insertMicros(int supplementId, Micronutrients micros) =>
      _database.batch(
        (batch) => batch.insertAll(_database.supplementMicronutrientsTable, [
          for (final MapEntry(key: nutrient, value: amount)
              in micros.amounts.entries)
            SupplementMicronutrientsTableCompanion.insert(
              supplementId: supplementId,
              nutrient: nutrient.name,
              amount: amount,
            ),
        ]),
      );
}
