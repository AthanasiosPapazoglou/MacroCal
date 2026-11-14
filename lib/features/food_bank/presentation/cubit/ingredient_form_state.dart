import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_field.dart';

part 'ingredient_form_state.freezed.dart';

enum IngredientFormStatus {
  loading,
  ready,
  lookingUp,
  invalid,
  saving,
  saved,
  failure,
}

enum LookupOutcome { found, notFound }

@freezed
abstract class IngredientFormState with _$IngredientFormState {
  const factory({
    @Default(IngredientFormStatus.loading) IngredientFormStatus status,
    @Default(<IngredientField, String>{}) Map<IngredientField, String> values,
    @Default(<IngredientField, String>{})
    Map<IngredientField, String> scannedValues,
    @Default(<Micronutrient, String>{}) Map<Micronutrient, String> microValues,
    @Default(<Micronutrient, String>{})
    Map<Micronutrient, String> scannedMicroValues,
    @Default(false) bool showMicros,
    LookupOutcome? lookupOutcome,
  }) = _IngredientFormState;
}
