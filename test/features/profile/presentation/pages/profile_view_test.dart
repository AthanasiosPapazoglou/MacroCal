import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_field.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_input.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_state.dart';
import 'package:macro_cal_public/features/profile/presentation/pages/profile_view.dart';
import 'package:macro_cal_public/features/profile/presentation/widgets/profile_field_input.dart';
import 'package:macro_cal_public/features/profile/presentation/widgets/sex_selector.dart';
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

  setUpAll(() {
    const ProfileInput fallback = (fields: {}, sex: null, birthYear: '');
    registerFallbackValue(fallback);
  });

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

    expect(find.byType(ProfileFieldInput), findsNWidgets(9));
    expect(find.byType(SexSelector), findsOneWidget);
    expect(find.text('BMR Calories'), findsOneWidget);
    expect(find.text('2100.0'), findsOneWidget);
  });

  testWidgets('save sends every field text to the cubit', (tester) async {
    await pumpView(tester);

    await tester.enterText(find.byType(TextFormField).first, '1800');
    await tester.tap(find.text('Save'));
    await tester.pump();

    final input =
        verify(() => cubit.save(captureAny())).captured.single as ProfileInput;
    expect(input.fields, hasLength(8));
    expect(input.fields[ProfileField.dailyKcal], '1800');
    expect(input.fields[ProfileField.heightCm], '184.0');
    expect(input.sex, isNull);
    expect(input.birthYear, isEmpty);
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

  testWidgets('save sends the chosen sex and the typed birth year', (
    tester,
  ) async {
    await pumpView(tester);

    await tester.ensureVisible(find.text('Female'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Female'));
    await tester.enterText(find.byType(TextFormField).last, '1990');
    await tester.tap(find.text('Save'));
    await tester.pump();

    final input =
        verify(() => cubit.save(captureAny())).captured.single as ProfileInput;
    expect(input.sex, Sex.female);
    expect(input.birthYear, '1990');
  });

  testWidgets('tapping the chosen sex again clears it', (tester) async {
    when(() => cubit.state).thenReturn(
      ready.copyWith(profile: const Profile(sex: Sex.male, birthYear: 1985)),
    );
    await pumpView(tester);
    expect(find.text('1985'), findsOneWidget);

    await tester.ensureVisible(find.text('Male'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Male'));
    await tester.tap(find.text('Save'));
    await tester.pump();

    final input =
        verify(() => cubit.save(captureAny())).captured.single as ProfileInput;
    expect(input.sex, isNull);
  });

  testWidgets('an invalid birth year shows an error and is not saved', (
    tester,
  ) async {
    await pumpView(tester);

    await tester.enterText(find.byType(TextFormField).last, '1850');
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Enter a year from 1900 to this year'), findsOneWidget);
    verifyNever(() => cubit.save(any()));
  });
}
