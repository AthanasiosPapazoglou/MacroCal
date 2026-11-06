import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';

part 'food_entry.freezed.dart';

@freezed
abstract class FoodEntry with _$FoodEntry {
  const factory({required Ingredient ingredient, required int grams}) =
      _FoodEntry;
}
