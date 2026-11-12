import 'dart:async';

import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:mocktail/mocktail.dart';

/// Serves [days] through [watchDayLogs], filtered by period like the database.
class FakeHistoryRepository extends Fake implements HistoryRepository {
  final _changes = StreamController<void>.broadcast();
  final periods = <(DateTime?, DateTime?)>[];
  List<DayLog> days = const [];
  Object? error;

  void update(List<DayLog> next) {
    days = next;
    _changes.add(null);
  }

  void fail(Object next) {
    error = next;
    _changes.add(null);
  }

  @override
  Stream<List<DayLog>> watchDayLogs({DateTime? from, DateTime? to}) {
    periods.add((from, to));
    return Stream.multi((controller) {
      void push() {
        if (error case final error?) return controller.addError(error);
        controller.add([
          for (final log in days)
            if ((from == null || !log.date.isBefore(from)) &&
                (to == null || !log.date.isAfter(to)))
              log,
        ]);
      }

      push();
      final subscription = _changes.stream.listen((_) => push());
      controller.onCancel = subscription.cancel;
    });
  }

  Future<void> dispose() => _changes.close();
}
