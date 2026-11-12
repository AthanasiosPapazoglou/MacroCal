import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/domain/use_cases/archive_day.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/archive_day_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/archive_day_state.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_summary.dart';

class _MockHistoryRepository extends Mock implements HistoryRepository;

class _MockArchiveDay extends Mock implements ArchiveDay;

void main() {
  late HistoryRepository history;
  late ArchiveDay archiveDay;
  late ArchiveDayCubit cubit;

  setUpAll(() {
    registerFallbackValue(DateTime(2000));
    registerFallbackValue(sampleSummary);
  });

  setUp(() {
    history = _MockHistoryRepository();
    archiveDay = _MockArchiveDay();
    when(() => history.hasLogFor(any())).thenAnswer((_) async => false);
    when(
      () => archiveDay(
        date: any(named: 'date'),
        summary: any(named: 'summary'),
      ),
    ).thenAnswer((_) async {});
    cubit = ArchiveDayCubit(
      history,
      archiveDay,
      today: DateTime(2026, 11, 7, 14, 30),
    );
  });
  tearDown(() => cubit.close());

  test('starts on today without the time', () {
    expect(cubit.state.selectedDate, DateTime(2026, 11, 7));
    expect(cubit.state.status, ArchiveDayStatus.checking);
  });

  test('load checks whether today is already archived', () async {
    when(() => history.hasLogFor(DateTime(2026, 11, 7)))
        .thenAnswer((_) async => true);

    await cubit.load();

    expect(cubit.state.status, ArchiveDayStatus.ready);
    expect(cubit.state.isDateTaken, isTrue);
  });

  test('selectDate moves to the picked day and rechecks it', () async {
    await cubit.selectDate(DateTime(2026, 11, 1, 8));

    expect(cubit.state.selectedDate, DateTime(2026, 11));
    expect(cubit.state.isDateTaken, isFalse);
    verify(() => history.hasLogFor(DateTime(2026, 11))).called(1);
  });

  test('archive stores the summary for the selected day', () async {
    await cubit.load();

    await cubit.archive(sampleSummary);

    expect(cubit.state.status, ArchiveDayStatus.archived);
    verify(
      () => archiveDay(date: DateTime(2026, 11, 7), summary: sampleSummary),
    ).called(1);
  });

  test('archive finishing after close does not emit', () async {
    final done = Completer<void>();
    when(
      () => archiveDay(
        date: any(named: 'date'),
        summary: any(named: 'summary'),
      ),
    ).thenAnswer((_) => done.future);

    final archiving = cubit.archive(sampleSummary);
    await cubit.close();
    done.complete();

    await expectLater(archiving, completes);
    expect(cubit.state.status, ArchiveDayStatus.archiving);
  });

  test('archive emits failure when the use case throws', () async {
    when(
      () => archiveDay(
        date: any(named: 'date'),
        summary: any(named: 'summary'),
      ),
    ).thenThrow(Exception('db'));
    await cubit.load();

    await cubit.archive(sampleSummary);

    expect(cubit.state.status, ArchiveDayStatus.failure);
  });
}
