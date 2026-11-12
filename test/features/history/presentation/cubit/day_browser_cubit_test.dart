import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/history/domain/entities/date_period.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_filter.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/entities/tracked_goal.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_browser_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_browser_state.dart';

import '../../../../helpers/fake_history_repository.dart';
import '../../../../helpers/sample_summary.dart';

DayLog _log(int year, int month, int day, {double kcal = 1950}) => DayLog(
  date: DateTime(year, month, day),
  summary: sampleSummary.copyWith(consumed: Nutrients(kcal: kcal)),
);

void main() {
  late FakeHistoryRepository repository;
  late DayBrowserCubit cubit;

  final octoberLate = _log(2026, 10, 30);
  final novemberMet = _log(2026, 11, 2);
  final novemberUnder = _log(2026, 11, 5, kcal: 500);
  final novemberOver = _log(2026, 11, 9, kcal: 3000);
  final december = _log(2026, 12, 1);

  setUp(() {
    repository = FakeHistoryRepository()
      ..days = [
        octoberLate,
        novemberMet,
        novemberUnder,
        novemberOver,
        december,
      ];
    cubit = DayBrowserCubit(repository, now: () => DateTime(2026, 11, 12, 9));
  });
  tearDown(() async {
    await cubit.close();
    await repository.dispose();
  });

  Future<DayBrowserState> ready() => cubit.stream.firstWhere(
    (state) => state.status == DayBrowserStatus.ready,
  );

  test('starts loading on the current month as a newest-first list', () {
    expect(cubit.state.status, DayBrowserStatus.loading);
    expect(cubit.state.period, DatePeriod.monthOf(DateTime(2026, 11)));
    expect(cubit.state.sort, DaySort.newestFirst);
    expect(cubit.state.view, DayBrowserLayout.list);
    expect(cubit.state.filter, isNull);
  });

  test('watch loads only the days of the period, newest first', () async {
    cubit.watch();
    final state = await ready();

    expect(repository.periods.single, (
      DateTime(2026, 11),
      DateTime(2026, 11, 30),
    ));
    expect(state.periodDays, [novemberMet, novemberUnder, novemberOver]);
    expect(state.days, [novemberOver, novemberUnder, novemberMet]);
  });

  test('showPrevious and showNext move by one month', () async {
    cubit.watch();
    await ready();

    cubit.showPrevious();
    expect(cubit.state.status, DayBrowserStatus.loading);
    expect(cubit.state.periodDays, isEmpty);
    expect((await ready()).days, [octoberLate]);

    cubit
      ..showNext()
      ..showNext();
    expect((await ready()).days, [december]);
    expect(cubit.state.period, DatePeriod.monthOf(DateTime(2026, 12)));
  });

  test('selectPeriod with a custom range spans months', () async {
    cubit
      ..watch()
      ..selectPeriod(
        DatePeriod.between(DateTime(2026, 10, 25), DateTime(2026, 11, 3)),
      );

    final state = await cubit.stream.firstWhere(
      (state) => state.periodDays.length == 2,
    );

    expect(state.days, [novemberMet, octoberLate]);
  });

  test('selecting the current period does not query again', () async {
    cubit.watch();
    await ready();

    cubit.selectPeriod(DatePeriod.monthOf(DateTime(2026, 11, 20)));

    expect(repository.periods, hasLength(1));
  });

  test('selectPeriod before watch does not query', () {
    cubit.selectPeriod(DatePeriod.yearOf(DateTime(2026)));

    expect(cubit.state.period.kind, DatePeriodKind.year);
    expect(repository.periods, isEmpty);
  });

  test('filter keeps the matching days and can be cleared', () async {
    cubit.watch();
    await ready();

    cubit.selectFilter(
      const DayFilter(goal: TrackedGoal.energy, outcome: DayOutcome.under),
    );
    expect(cubit.state.days, [novemberUnder]);
    expect(cubit.state.matches(novemberOver), isFalse);
    expect(cubit.state.periodDays, hasLength(3));

    cubit.selectFilter(
      const DayFilter(goal: TrackedGoal.energy, outcome: DayOutcome.over),
    );
    expect(cubit.state.days, [novemberOver]);

    cubit.selectFilter(null);
    expect(cubit.state.days, hasLength(3));
  });

  test('sort and view change without querying again', () async {
    cubit.watch();
    await ready();

    cubit
      ..selectSort(DaySort.oldestFirst)
      ..selectView(DayBrowserLayout.calendar);

    expect(cubit.state.days, [novemberMet, novemberUnder, novemberOver]);
    expect(cubit.state.view, DayBrowserLayout.calendar);
    expect(repository.periods, hasLength(1));
  });

  test('monthGroups follows the sort order', () async {
    cubit
      ..watch()
      ..selectPeriod(DatePeriod.yearOf(DateTime(2026)));
    await cubit.stream.firstWhere((state) => state.periodDays.length == 5);

    expect(
      cubit.state.monthGroups.map((group) => (group.$1, group.$2.length)),
      [
        (DateTime(2026, 12), 1),
        (DateTime(2026, 11), 3),
        (DateTime(2026, 10), 1),
      ],
    );

    cubit.selectSort(DaySort.oldestFirst);
    expect(cubit.state.monthGroups.first.$1, DateTime(2026, 10));
  });

  test('new days in the period show up while watching', () async {
    cubit.watch();
    await ready();

    repository.update([...repository.days, _log(2026, 11, 11)]);
    final state = await cubit.stream.first;

    expect(state.days.first.date, DateTime(2026, 11, 11));
  });

  test('watch emits failure when the stream errors', () async {
    cubit.watch();
    await ready();

    repository.fail(Exception('db'));

    expect((await cubit.stream.first).status, DayBrowserStatus.failure);
  });
}
