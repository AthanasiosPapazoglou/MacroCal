import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_detail_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_detail_state.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_summary.dart';

class _MockHistoryRepository extends Mock implements HistoryRepository;

class _MockSettingsRepository extends Mock implements SettingsRepository;

void main() {
  final date = DateTime(2026, 11, 10);
  final log = DayLog(date: date, summary: sampleSummary);
  late StreamController<DayLog?> logs;
  late StreamController<bool> enabled;
  late HistoryRepository repository;
  late DayDetailCubit cubit;

  setUp(() {
    logs = StreamController<DayLog?>.broadcast();
    enabled = StreamController<bool>.broadcast();
    repository = _MockHistoryRepository();
    final settings = _MockSettingsRepository();
    when(() => repository.watchDayLog(date)).thenAnswer((_) => logs.stream);
    when(settings.watchMicrocalEnabled).thenAnswer((_) => enabled.stream);
    cubit = DayDetailCubit(repository, settings, date);
  });
  tearDown(() async {
    await cubit.close();
    await logs.close();
    await enabled.close();
  });

  test('starts loading', () {
    expect(cubit.state, const DayDetailState());
  });

  test('watch emits the log, then not found when it disappears', () async {
    final emitted = expectLater(
      cubit.stream,
      emitsInOrder([
        DayDetailState(status: DayDetailStatus.ready, log: log),
        const DayDetailState(status: DayDetailStatus.notFound),
      ]),
    );

    cubit.watch();
    logs
      ..add(log)
      ..add(null);

    await emitted;
  });

  test('delete removes the day and ignores the following null', () async {
    when(() => repository.deleteDayLog(date)).thenAnswer((_) async {});
    cubit.watch();
    logs.add(log);
    await cubit.stream.first;

    await cubit.delete();
    logs.add(null);
    await pumpEventQueue();

    expect(cubit.state.status, DayDetailStatus.deleted);
    verify(() => repository.deleteDayLog(date)).called(1);
  });

  test('delete emits failure when the repository throws', () async {
    when(() => repository.deleteDayLog(date)).thenThrow(Exception('db'));

    await cubit.delete();

    expect(cubit.state.status, DayDetailStatus.failure);
  });

  test('watch subscribes only once', () {
    cubit
      ..watch()
      ..watch();

    verify(() => repository.watchDayLog(date)).called(1);
  });

  test('watch emits failure when the stream errors', () async {
    final emitted = expectLater(
      cubit.stream.map((state) => state.status),
      emits(DayDetailStatus.failure),
    );

    cubit.watch();
    logs.addError(Exception('db'));

    await emitted;
  });

  test('watch carries the tracking switch into the day', () async {
    final emitted = expectLater(
      cubit.stream,
      emitsInOrder([
        const DayDetailState(microcalEnabled: true),
        DayDetailState(
          status: DayDetailStatus.ready,
          log: log,
          microcalEnabled: true,
        ),
      ]),
    );

    cubit.watch();
    enabled.add(true);
    await pumpEventQueue();
    logs.add(log);

    await emitted;
  });
}
