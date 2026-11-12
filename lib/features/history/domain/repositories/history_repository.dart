import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';

abstract interface class HistoryRepository {
  /// Oldest first, limited to [from] and [to] inclusive when given.
  Stream<List<DayLog>> watchDayLogs({DateTime? from, DateTime? to});

  Stream<DayLog?> watchDayLog(DateTime date);

  Future<bool> hasLogFor(DateTime date);

  /// Replaces any log already saved for the same day.
  Future<void> saveDayLog(DayLog log);

  Future<void> deleteDayLog(DateTime date);
}
