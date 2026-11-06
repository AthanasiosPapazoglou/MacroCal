import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';

part 'overview_state.freezed.dart';

enum OverviewStatus { loading, ready, failure }

@freezed
abstract class OverviewState with _$OverviewState {
  const factory({
    required DailySummary summary,
    @Default(OverviewStatus.loading) OverviewStatus status,
  }) = _OverviewState;
}
