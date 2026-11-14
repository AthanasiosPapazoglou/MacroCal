import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';

part 'supplement.freezed.dart';

enum SupplementUnit { tablet, capsule, drop, ml, scoop }

@freezed
abstract class Supplement with _$Supplement {
  const factory({
    required int id,
    required String name,
    required SupplementUnit unit,
    @Default(Micronutrients()) Micronutrients microsPerUnit,
  }) = _Supplement;
}
