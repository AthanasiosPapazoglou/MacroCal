import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_range.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/history_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/history_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_summary.dart';

class _MockHistoryRepository extends Mock implements HistoryRepository;

void main() {
  late StreamController<List<DayLog>> logs;
  late HistoryRepository repository;
  late HistoryCubit cubit;

  final older = DayLog(date: DateTime(2026, 10, 20), summary: sampleSummary);
  final yesterday = DayLog(
    date: DateTime(2026, 11, 10),
    summary: sampleSummary,
  );
  final today = DayLog(date: DateTime(2026, 11, 11), summary: sampleSummary);

  setUp(() {
    logs = StreamController<List<DayLog>>.broadcast();
    repository = _MockHistoryRepository();
    when(() => repository.watchDayLogs()).thenAnswer((_) => logs.stream);
    cubit = HistoryCubit(repository, now: () => DateTime(2026, 11, 11, 20));
  });
  tearDown(() async {
    await cubit.close();
    await logs.close();
  });

  test('starts loading on the week range', () {
    expect(cubit.state, const HistoryState());
    expect(cubit.state.range, HistoryRange.week);
  });

  test('watch emits the range days newest first with their stats', () async {
    final emitted = expectLater(
      cubit.stream,
      emits(
        isA<HistoryState>()
            .having((state) => state.status, 'status', HistoryStatus.ready)
            .having((state) => state.logs, 'logs', [today, yesterday])
            .having((state) => state.stats.daysLogged, 'days', 2)
            .having((state) => state.stats.currentStreak, 'streak', 2),
      ),
    );

    cubit.watch();
    logs.add([older, yesterday, today]);

    await emitted;
  });

  test('selectRange recalculates for the new range', () async {
    cubit.watch();
    logs.add([older, yesterday, today]);
    await cubit.stream.first;

    cubit.selectRange(HistoryRange.month);

    expect(cubit.state.range, HistoryRange.month);
    expect(cubit.state.logs, [today, yesterday, older]);
    expect(cubit.state.stats.daysLogged, 3);
  });

  test('selectRange before the first load only keeps the range', () {
    cubit.selectRange(HistoryRange.all);

    expect(cubit.state.status, HistoryStatus.loading);
    expect(cubit.state.range, HistoryRange.all);
  });

  test('watch keeps the selected range when new logs arrive', () async {
    cubit
      ..watch()
      ..selectRange(HistoryRange.all);
    final emitted = expectLater(
      cubit.stream.map((state) => (state.range, state.logs.length)),
      emits((HistoryRange.all, 1)),
    );

    logs.add([older]);

    await emitted;
  });

  test('watch subscribes only once', () {
    cubit
      ..watch()
      ..watch();

    verify(() => repository.watchDayLogs()).called(1);
  });

  test('watch emits failure when the stream errors', () async {
    final emitted = expectLater(
      cubit.stream.map((state) => state.status),
      emits(HistoryStatus.failure),
    );

    cubit.watch();
    logs.addError(Exception('db'));

    await emitted;
  });
}
