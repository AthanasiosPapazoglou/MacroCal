import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_field.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_state.dart';
import 'package:macro_cal_public/features/profile/presentation/pages/profile_view.dart';
import 'package:macro_cal_public/features/profile/presentation/widgets/profile_field_input.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pump_localized.dart';

class _MockProfileCubit extends Mock implements ProfileCubit;

void main() {
  late ProfileCubit cubit;
  late StreamController<ProfileState> states;

  const ready = ProfileState(status: ProfileStatus.ready);

  void setState(ProfileState state) {
    when(() => cubit.state).thenReturn(state);
    states.add(state);
  }

  setUpAll(() => registerFallbackValue(<ProfileField, String>{}));

  setUp(() {
    cubit = _MockProfileCubit();
    states = StreamController<ProfileState>.broadcast();
    when(() => cubit.state).thenReturn(ready);
    when(() => cubit.stream).thenAnswer((_) => states.stream);
    when(cubit.close).thenAnswer((_) async {});
    when(() => cubit.save(any())).thenAnswer((_) async {});
  });

  tearDown(() => states.close());

  Future<void> pumpView(WidgetTester tester) => pumpLocalized(
    tester,
    router: GoRouter(
      initialLocation: AppRoutes.profile,
      routes: [
        GoRoute(
          path: AppRoutes.profile,
          builder: (_, _) =>
              BlocProvider.value(value: cubit, child: const ProfileView()),
        ),
        GoRoute(
          path: AppRoutes.today,
          builder: (_, _) => const Text('today screen'),
        ),
      ],
    ),
  );

  testWidgets('shows no form while loading, then one input per field', (
    tester,
  ) async {
    when(() => cubit.state).thenReturn(const ProfileState());
    await pumpView(tester);
    expect(find.byType(ProfileFieldInput), findsNothing);

    setState(ready);
    await tester.pumpAndSettle();

    expect(find.byType(ProfileFieldInput), findsNWidgets(8));
    expect(find.text('BMR Calories'), findsOneWidget);
    expect(find.text('2100.0'), findsOneWidget);
  });

  testWidgets('save sends every field text to the cubit', (tester) async {
    await pumpView(tester);

    await tester.enterText(find.byType(TextFormField).first, '1800');
    await tester.tap(find.text('Save'));
    await tester.pump();

    final input =
        verify(() => cubit.save(captureAny())).captured.single
            as Map<ProfileField, String>;
    expect(input, hasLength(8));
    expect(input[ProfileField.dailyKcal], '1800');
    expect(input[ProfileField.heightCm], '184.0');
  });

  testWidgets('an invalid number shows an error and is not saved', (
    tester,
  ) async {
    await pumpView(tester);

    await tester.enterText(find.byType(TextFormField).first, 'abc');
    await tester.tap(find.text('Save'));
    await tester.pump();

    expect(find.text('Enter a number of 0 or more'), findsOneWidget);
    verifyNever(() => cubit.save(any()));
  });

  testWidgets('a successful save returns to the overview', (tester) async {
    await pumpView(tester);

    setState(ready.copyWith(status: ProfileStatus.saved));
    await tester.pumpAndSettle();

    expect(find.text('today screen'), findsOneWidget);
  });
}
