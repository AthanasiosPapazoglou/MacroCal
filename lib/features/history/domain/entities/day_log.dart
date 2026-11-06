import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';

part 'day_log.freezed.dart';

@freezed
abstract class DayLog with _$DayLog {
  const factory({required DateTime date, required DailySummary summary}) =
      _DayLog;
}
