import 'package:macro_cal_public/features/food_bank/domain/entities/reference_food.dart';

abstract interface class ReferenceFoodRepository {
  Future<List<ReferenceFood>> loadAll();
}
