import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';

part 'day_detail_state.freezed.dart';

enum DayDetailStatus { loading, ready, notFound, failure }

@freezed
abstract class DayDetailState with _$DayDetailState {
  const factory({
    @Default(DayDetailStatus.loading) DayDetailStatus status,
    DayLog? log,
  }) = _DayDetailState;
}
