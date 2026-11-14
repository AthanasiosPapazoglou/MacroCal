import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';

abstract interface class SupplementRepository {
  Stream<List<Supplement>> watchSupplements();

  Stream<Supplement?> watchSupplement(int id);

  Future<int> addSupplement({
    required String name,
    required SupplementUnit unit,
    Micronutrients microsPerUnit,
  });

  Future<void> updateSupplement(Supplement supplement);

  Future<void> deleteSupplement(int id);
}
