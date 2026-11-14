import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';

part 'nutrients.freezed.dart';

@freezed
abstract class Nutrients with _$Nutrients {
  const factory({
    @Default(0) double kcal,
    @Default(0) double proteinG,
    @Default(0) double carbsG,
    @Default(0) double sugarsG,
    @Default(0) double fatG,
    @Default(0) double saturatedG,
    @Default(0) double fiberG,
    @Default(0) double saltMg,
    @Default(Micronutrients()) Micronutrients micros,
  }) = _Nutrients;

  const new _();

  Nutrients operator +(Nutrients other) => Nutrients(
    kcal: kcal + other.kcal,
    proteinG: proteinG + other.proteinG,
    carbsG: carbsG + other.carbsG,
    sugarsG: sugarsG + other.sugarsG,
    fatG: fatG + other.fatG,
    saturatedG: saturatedG + other.saturatedG,
    fiberG: fiberG + other.fiberG,
    saltMg: saltMg + other.saltMg,
    micros: micros + other.micros,
  );

  Nutrients scaled(double factor) => Nutrients(
    kcal: kcal * factor,
    proteinG: proteinG * factor,
    carbsG: carbsG * factor,
    sugarsG: sugarsG * factor,
    fatG: fatG * factor,
    saturatedG: saturatedG * factor,
    fiberG: fiberG * factor,
    saltMg: saltMg * factor,
    micros: micros.scaled(factor),
  );
}
