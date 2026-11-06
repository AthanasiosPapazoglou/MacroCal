import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';

part 'ingredient.freezed.dart';

@freezed
abstract class Ingredient with _$Ingredient {
  const factory({
    required int id,
    required String name,
    required Nutrients per100g,
    String? category,
    @Default(100) double referenceGrams,
  }) = _Ingredient;
}
