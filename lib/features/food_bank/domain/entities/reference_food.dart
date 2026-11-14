import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';

part 'reference_food.freezed.dart';

/// A generic food from the bundled composition table, per 100 g.
@freezed
abstract class ReferenceFood with _$ReferenceFood {
  const factory({
    required int code,
    required String nameEn,
    required String nameEl,
    required Nutrients per100g,
  }) = _ReferenceFood;
}
