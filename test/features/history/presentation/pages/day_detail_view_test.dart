import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_detail_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_detail_state.dart';
import 'package:macro_cal_public/features/history/presentation/pages/day_detail_view.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/summary_breakdown.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';
import '../../../../helpers/sample_summary.dart';

class _MockDayDetailCubit extends Mock implements DayDetailCubit;

void main() {
  final date = DateTime(2026, 11, 10);
  late DayDetailCubit cubit;

  setUp(() {
    cubit = _MockDayDetailCubit();
    when(() => cubit.date).thenReturn(date);
  });

  Future<void> pumpView(WidgetTester tester, DayDetailState state) {
    CubitStub(cubit, state);
    return pumpLocalized(
      tester,
      home: BlocProvider.value(value: cubit, child: const DayDetailView()),
    );
  }

  testWidgets('shows the day with its goals and burned kcal', (tester) async {
    await pumpView(
      tester,
      DayDetailState(
        status: DayDetailStatus.ready,
        log: DayLog(date: date, summary: sampleSummary),
      ),
    );

    expect(find.text('Tuesday 10/11/2026'), findsOneWidget);
    expect(find.byType(SummaryBreakdown), findsOneWidget);
    expect(find.text('Calory intake'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('Burned through activity: 150 kcal'),
      200,
    );
    expect(find.text('Burned through activity: 150 kcal'), findsOneWidget);
  });

  testWidgets('deletes the day after confirming and leaves the page', (
    tester,
  ) async {
    final stub = CubitStub(
      cubit,
      DayDetailState(
        status: DayDetailStatus.ready,
        log: DayLog(date: date, summary: sampleSummary),
      ),
    );
    when(cubit.delete).thenAnswer((_) async {
      stub.emit(const DayDetailState(status: DayDetailStatus.deleted));
    });
    await pumpLocalized(
      tester,
      router: GoRouter(
        initialLocation: '/day',
        routes: [
          GoRoute(
            path: '/',
            builder: (_, _) => const Text('history'),
            routes: [
              GoRoute(
                path: 'day',
                builder: (_, _) => BlocProvider.value(
                  value: cubit,
                  child: const DayDetailView(),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    await tester.tap(find.byTooltip('Delete day'));
    await tester.pumpAndSettle();
    expect(find.text('Delete this day?'), findsOneWidget);
    await tester.tap(find.text('Cancel'));
    await tester.pumpAndSettle();
    verifyNever(cubit.delete);

    await tester.tap(find.byTooltip('Delete day'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Delete'));
    await tester.pumpAndSettle();

    verify(cubit.delete).called(1);
    expect(find.text('history'), findsOneWidget);
  });

  testWidgets('says when the day is not archived', (tester) async {
    await pumpView(
      tester,
      const DayDetailState(status: DayDetailStatus.notFound),
    );

    expect(find.text('This day is not archived'), findsOneWidget);
    expect(find.byType(SummaryBreakdown), findsNothing);
    expect(find.byTooltip('Delete day'), findsNothing);
  });

  group('micronutrients', () {
    final microLog = DayLog(
      date: date,
      summary: sampleSummary,
      sex: Sex.female,
      age: 30,
      micros: const MicroIntake(
        food: Micronutrients(amounts: {Micronutrient.iron: 8}),
        coverage: {Micronutrient.iron: 1},
      ),
    );

    testWidgets('are hidden while tracking is off', (tester) async {
      await pumpView(
        tester,
        DayDetailState(status: DayDetailStatus.ready, log: microLog),
      );

      expect(find.text('Micronutrients', skipOffstage: false), findsNothing);
    });

    testWidgets("show the day's bars against that day's references", (
      tester,
    ) async {
      await pumpView(
        tester,
        DayDetailState(
          status: DayDetailStatus.ready,
          log: microLog,
          microcalEnabled: true,
        ),
      );

      await tester.scrollUntilVisible(
        find.text('Reference intakes: EFSA, women aged 30'),
        200,
      );
      expect(find.textContaining('Low coverage'), findsOneWidget);
      await tester.scrollUntilVisible(find.text('8 mg / 16 mg  50%'), 200);
      expect(find.text('8 mg / 16 mg  50%'), findsOneWidget);
    });

    testWidgets('say when the day has no data', (tester) async {
      await pumpView(
        tester,
        DayDetailState(
          status: DayDetailStatus.ready,
          log: DayLog(date: date, summary: sampleSummary),
          microcalEnabled: true,
        ),
      );

      await tester.scrollUntilVisible(
        find.text('No micronutrient data for this day'),
        200,
      );
      expect(find.text('No micronutrient data for this day'), findsOneWidget);
    });
  });
}
