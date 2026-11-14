import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/reference_food.dart';

part 'reference_food_picker_state.freezed.dart';

enum ReferenceFoodPickerStatus { loading, ready, failure }

@freezed
abstract class ReferenceFoodPickerState with _$ReferenceFoodPickerState {
  const factory({
    @Default(ReferenceFoodPickerStatus.loading)
    ReferenceFoodPickerStatus status,
    @Default('') String query,
    @Default(<ReferenceFood>[]) List<ReferenceFood> results,
  }) = _ReferenceFoodPickerState;
}
