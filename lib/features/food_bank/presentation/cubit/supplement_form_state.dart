import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';

part 'supplement_form_state.freezed.dart';

enum SupplementFormStatus { loading, ready, invalid, saving, saved, failure }

@freezed
abstract class SupplementFormState with _$SupplementFormState {
  const factory({
    @Default(SupplementFormStatus.loading) SupplementFormStatus status,
    @Default('') String name,
    @Default(SupplementUnit.tablet) SupplementUnit unit,
    @Default(<Micronutrient, String>{}) Map<Micronutrient, String> microValues,
  }) = _SupplementFormState;
}
