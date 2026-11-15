import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/microcal/domain/services/reference_intakes.dart';
import 'package:macro_cal_public/features/microcal/presentation/cubit/microcal_cubit.dart';
import 'package:macro_cal_public/features/microcal/presentation/cubit/microcal_state.dart';
import 'package:macro_cal_public/features/microcal/presentation/widgets/microcal_card.dart';
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
    weekDays: 3,
    references: const ReferenceIntakes().forPerson(energyKcal: 2000),
    week: const MicroIntake(
      food: Micronutrients(
        amounts: {Micronutrient.iron: 20, Micronutrient.zinc: 1},
      ),
    ),
  );

  setUp(() {
    cubit = _MockMicroCalCubit();
    stub = CubitStub(cubit, ready);
  });

  Future<void> pumpCard(WidgetTester tester) => pumpLocalized(
    tester,
    router: GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (_, _) => Scaffold(
            body: BlocProvider.value(
              value: cubit,
              child: const MicroCalCardView(),
            ),
          ),
        ),
        GoRoute(
          path: AppRoutes.microcal,
          builder: (_, _) => const Text('microcal screen'),
        ),
      ],
    ),
  );

  testWidgets('counts the nutrients at reference and opens the page', (
    tester,
  ) async {
    await pumpCard(tester);

    expect(find.text('1 of 21 at reference (7-day)'), findsOneWidget);

    await tester.tap(find.byType(ListTile));
    await tester.pumpAndSettle();

    expect(find.text('microcal screen'), findsOneWidget);
  });

  testWidgets('says when the week has no data', (tester) async {
    stub.emit(ready.copyWith(weekDays: 0, week: const MicroIntake()));
    await pumpCard(tester);

    expect(
      find.text('No micronutrient data in the last 7 days'),
      findsOneWidget,
    );
  });

  testWidgets('is hidden while tracking is off', (tester) async {
    stub.emit(ready.copyWith(enabled: false));
    await pumpCard(tester);

    expect(find.byType(Card), findsNothing);
  });
}
