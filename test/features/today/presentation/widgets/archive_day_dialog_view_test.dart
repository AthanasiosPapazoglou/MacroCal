import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/today/domain/entities/daily_summary.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/archive_day_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/archive_day_state.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_state.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/archive_day_dialog_view.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_summary.dart';

class _MockArchiveDayCubit extends Mock implements ArchiveDayCubit;

class _MockOverviewCubit extends Mock implements OverviewCubit;

void main() {
  late ArchiveDayCubit cubit;
  late CubitStub<ArchiveDayState> stub;
  late OverviewCubit overview;

  final ready = ArchiveDayState(
    selectedDate: DateTime(2026, 11, 9),
    status: ArchiveDayStatus.ready,
  );

  setUpAll(() => registerFallbackValue(sampleSummary));

  setUp(() {
    cubit = _MockArchiveDayCubit();
    stub = CubitStub(cubit, ready);
    when(() => cubit.archive(any())).thenAnswer((_) async {});
    overview = _MockOverviewCubit();
    CubitStub(overview, const OverviewState(summary: sampleSummary));
  });

  Future<void> openDialog(WidgetTester tester) async {
    await pumpLocalized(
      tester,
      home: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: cubit),
          BlocProvider.value(value: overview),
        ],
        child: Builder(
          builder: (context) => TextButton(
            onPressed: () => showDialog<void>(
              context: context,
              builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: cubit),
                  BlocProvider.value(value: overview),
                ],
                child: const ArchiveDayDialogView(),
              ),
            ),
            child: const Text('open'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('open'));
    await tester.pumpAndSettle();
  }

  testWidgets('shows the selected date and that it is free', (tester) async {
    await openDialog(tester);

    expect(find.text('09/11/2026'), findsOneWidget);
    expect(
      find.text('Selected Date has no previous Measurement assigned.'),
      findsOneWidget,
    );
  });

  testWidgets('warns when the date already has a log', (tester) async {
    await openDialog(tester);

    stub.emit(ready.copyWith(isDateTaken: true));
    await tester.pumpAndSettle();

    expect(find.textContaining('already exists'), findsOneWidget);
  });

  testWidgets('complete archives the current summary and closes', (
    tester,
  ) async {
    await openDialog(tester);

    await tester.tap(find.text('Complete'));
    final summary =
        verify(() => cubit.archive(captureAny())).captured.single
            as DailySummary;
    expect(summary, sampleSummary);

    stub.emit(ready.copyWith(status: ArchiveDayStatus.archived));
    await tester.pumpAndSettle();
    expect(find.text('Complete'), findsNothing);
  });

  testWidgets('cannot be dismissed while archiving', (tester) async {
    await openDialog(tester);
    stub.emit(ready.copyWith(status: ArchiveDayStatus.archiving));
    await tester.pumpAndSettle();

    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();

    expect(find.text('Complete'), findsOneWidget);
    expect(find.text('open'), findsOneWidget);
  });

  testWidgets('a late archived state does not pop the page underneath', (
    tester,
  ) async {
    await openDialog(tester);

    await tester.tapAt(const Offset(10, 10));
    await tester.pump();
    stub.emit(ready.copyWith(status: ArchiveDayStatus.archived));
    await tester.pumpAndSettle();

    expect(find.text('Complete'), findsNothing);
    expect(find.text('open'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
