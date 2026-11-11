import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_detail_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_detail_state.dart';
import 'package:macro_cal_public/features/history/presentation/pages/day_detail_view.dart';
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

  testWidgets('says when the day is not archived', (tester) async {
    await pumpView(
      tester,
      const DayDetailState(status: DayDetailStatus.notFound),
    );

    expect(find.text('This day is not archived'), findsOneWidget);
    expect(find.byType(SummaryBreakdown), findsNothing);
  });
}
