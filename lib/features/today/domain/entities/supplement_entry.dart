import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';

part 'supplement_entry.freezed.dart';

/// Units of a supplement taken today.
@freezed
abstract class SupplementEntry with _$SupplementEntry {
  const factory({required Supplement supplement, required double units}) =
      _SupplementEntry;

  const new _();

  Micronutrients get micros => supplement.microsPerUnit.scaled(units);
}
