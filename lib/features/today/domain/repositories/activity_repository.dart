import 'package:macro_cal_public/features/today/domain/entities/activity_entry.dart';

abstract interface class ActivityRepository {
  /// Every activity with today's amount, 0 when nothing is logged.
  Stream<List<ActivityEntry>> watchEntries();

  Future<void> replaceAmounts(Map<int, int> amountsByActivityId);

  Future<void> resetAmounts();
}
