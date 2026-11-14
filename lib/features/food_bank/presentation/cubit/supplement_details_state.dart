import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';

part 'supplement_details_state.freezed.dart';

enum SupplementDetailsStatus { loading, ready, notFound, deleted, failure }

@freezed
abstract class SupplementDetailsState with _$SupplementDetailsState {
  const factory({
    @Default(SupplementDetailsStatus.loading) SupplementDetailsStatus status,
    Supplement? supplement,
  }) = _SupplementDetailsState;
}
