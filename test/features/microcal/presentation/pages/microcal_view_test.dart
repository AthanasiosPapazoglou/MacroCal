import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/widgets/loader.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/microcal/domain/services/reference_intakes.dart';
import 'package:macro_cal_public/features/microcal/presentation/cubit/microcal_cubit.dart';
import 'package:macro_cal_public/features/microcal/presentation/cubit/microcal_state.dart';
import 'package:macro_cal_public/features/microcal/presentation/pages/microcal_view.dart';
import 'package:macro_cal_public/features/microcal/presentation/widgets/micro_nutrient_bar.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/cubit_stub.dart';
import '../../../../helpers/pump_localized.dart';

class _MockMicroCalCubit extends Mock implements MicroCalCubit;

void main() {
  late MicroCalCubit cubit;
  late CubitStub<MicroCalState> stub;

  final ready = MicroCalState(
    status: MicroCalStatus.ready,
    enabled: true,
    sex: Sex.female,
    age: 36,
    weekDays: 2,
    references: const ReferenceIntakes().forPerson(
      energyKcal: 2000,
      sex: Sex.female,
      age: 36,
    ),
    today: const MicroIntake(
      supplements: Micronutrients(amounts: {Micronutrient.zinc: 30}),
    ),
    week: const MicroIntake(
      food: Micronutrients(amounts: {Micronutrient.iron: 8}),
      coverage: {Micronutrient.iron: 0.5},
    ),
  );

  setUpAll(() => registerFallbackValue(Micronutrient.iron));
  setUp(() {
    cubit = _MockMicroCalCubit();
    stub = CubitStub(cubit, ready);
    when(() => cubit.contributorsOf(any()))
        .thenReturn(const [(name: 'Lentils', amount: 6, isSupplement: false)]);
  });

  Future<void> pumpView(WidgetTester tester) => pumpLocalized(
    tester,
    home: BlocProvider.value(value: cubit, child: const MicroCalView()),
  );

  testWidgets('shows a loader while loading', (tester) async {
    stub.emit(const MicroCalState());
    await pumpLocalized(
      tester,
      home: BlocProvider.value(value: cubit, child: const MicroCalView()),
      settle: false,
    );

    expect(find.byType(Loader), findsOneWidget);
  });

  testWidgets('says it is not available under 18', (tester) async {
    stub.emit(const MicroCalState(status: MicroCalStatus.ready, age: 17));
    await pumpView(tester);

    expect(find.textContaining('available under 18'), findsOneWidget);
    expect(find.byType(MicroNutrientBar), findsNothing);
  });

  testWidgets('shows the 7-day bars against EFSA references', (tester) async {
    await pumpView(tester);

    expect(find.text('Reference intakes: EFSA, women aged 36'), findsOneWidget);
    expect(find.text('Based on 2 of 7 days'), findsOneWidget);
    expect(find.text('Vitamins'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('8 mg / 16 mg  50%'), 200);
    expect(find.text('Food with data: 50%'), findsOneWidget);
    await tester.scrollUntilVisible(find.text('Iodine *'), 200);
  });

  testWidgets('names the EU label values while sex is missing', (tester) async {
    stub.emit(
      ready.copyWith(
        sex: null,
        references: const ReferenceIntakes().forPerson(energyKcal: 2000),
      ),
    );
    await pumpView(tester);

    expect(find.textContaining('EU label values'), findsOneWidget);
  });

  testWidgets('the period switch selects today', (tester) async {
    await pumpView(tester);

    await tester.tap(find.text('Today'));

    verify(() => cubit.selectPeriod(MicroCalPeriod.today)).called(1);
  });

  testWidgets('states an upper level above the limit', (tester) async {
    stub.emit(ready.copyWith(period: MicroCalPeriod.today));
    await pumpView(tester);

    await tester.scrollUntilVisible(
      find.text('Above the tolerable upper intake level set by EFSA'),
      200,
    );

    expect(
      find.text('Above the tolerable upper intake level set by EFSA'),
      findsOneWidget,
    );
  });

  testWidgets('a nutrient opens its description and contributors', (
    tester,
  ) async {
    await pumpView(tester);

    await tester.ensureVisible(find.text('Iron'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Iron'));
    await tester.pumpAndSettle();

    expect(find.textContaining('Heme iron'), findsOneWidget);
    expect(find.text('Reference intake: 16 mg (EFSA)'), findsOneWidget);
    expect(
      find.text('Tolerable upper intake level: 45 mg (NASEM)'),
      findsOneWidget,
    );
    expect(find.text('Lentils'), findsOneWidget);
    expect(find.text('6 mg'), findsOneWidget);
    verify(() => cubit.contributorsOf(Micronutrient.iron)).called(1);
  });
}
