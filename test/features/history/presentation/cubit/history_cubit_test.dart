import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_range.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/history_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/history_state.dart';

import '../../../../helpers/fake_history_repository.dart';
import '../../../../helpers/sample_summary.dart';

void main() {
  late FakeHistoryRepository repository;
  late HistoryCubit cubit;

  DayLog log(int month, int day) =>
      DayLog(date: DateTime(2026, month, day), summary: sampleSummary);

  final older = log(10, 20);
  final yesterday = log(11, 10);
  final today = log(11, 11);

  setUp(() {
    repository = FakeHistoryRepository()
      ..days = [log(1, 5), older, yesterday, today];
    cubit = HistoryCubit(repository, now: () => DateTime(2026, 11, 11, 20));
  });
  tearDown(() async {
    await cubit.close();
    await repository.dispose();
  });

  Future<HistoryState> ready() =>
      cubit.stream.firstWhere((state) => state.status == HistoryStatus.ready);

  test('starts loading on the week range', () {
    expect(cubit.state, const HistoryState());
    expect(cubit.state.range, HistoryRange.week);
  });

  test('watch asks for the streak window and the week only', () async {
    cubit.watch();
    final state = await ready();

    expect(repository.periods, [
      (DateTime(2025, 10, 8), null),
      (DateTime(2026, 11, 5), null),
    ]);
    expect(state.logs, [today, yesterday]);
    expect(state.stats.daysLogged, 2);
    expect(state.stats.currentStreak, 2);
  });

  test('selectRange queries the new range and recalculates', () async {
    cubit.watch();
    await ready();

    cubit.selectRange(HistoryRange.month);
    expect(cubit.state.range, HistoryRange.month);
    final state = await ready();

    expect(repository.periods.last, (DateTime(2026, 10, 13), null));
    expect(state.logs, [today, yesterday, older]);
    expect(state.stats.daysLogged, 3);
  });

  test('the all range asks for every day', () async {
    cubit
      ..watch()
      ..selectRange(HistoryRange.all);
    final state = await cubit.stream.firstWhere(
      (state) => state.logs.length == 4,
    );

    expect(repository.periods.last, (null, null));
    expect(state.stats.daysLogged, 4);
  });

  test('selectRange before watch only keeps the range', () {
    cubit.selectRange(HistoryRange.all);

    expect(cubit.state.status, HistoryStatus.loading);
    expect(cubit.state.range, HistoryRange.all);
    expect(repository.periods, isEmpty);
  });

  test('selecting the current range does not query again', () async {
    cubit.watch();
    await ready();

    cubit.selectRange(HistoryRange.week);

    expect(repository.periods, hasLength(2));
  });

  test('watch keeps the selected range when days change', () async {
    cubit
      ..watch()
      ..selectRange(HistoryRange.all);
    await cubit.stream.firstWhere((state) => state.logs.length == 4);

    repository.update([older]);
    final state = await cubit.stream.firstWhere(
      (state) => state.logs.length == 1,
    );

    expect(state.range, HistoryRange.all);
    expect(state.stats.currentStreak, 0);
  });

  test('watch subscribes only once', () {
    cubit
      ..watch()
      ..watch();

    expect(repository.periods, hasLength(2));
  });

  test('watch emits failure when a stream errors', () async {
    cubit.watch();
    await ready();

    repository.fail(Exception('db'));

    expect((await cubit.stream.first).status, HistoryStatus.failure);
  });
}
