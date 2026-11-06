import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockProfileRepository extends Mock implements ProfileRepository;

void main() {
  late StreamController<Profile> profiles;
  late ProfileRepository repository;
  late OverviewCubit cubit;

  setUp(() {
    profiles = StreamController<Profile>.broadcast();
    repository = _MockProfileRepository();
    when(() => repository.watchProfile()).thenAnswer((_) => profiles.stream);
    cubit = OverviewCubit(repository);
  });
  tearDown(() async {
    await cubit.close();
    await profiles.close();
  });

  test('starts loading with the default goals', () {
    expect(cubit.state, const OverviewState());
  });

  test('watch follows every profile change', () async {
    const updated = NutritionGoals(dailyKcal: 1800);
    final emitted = expectLater(
      cubit.stream,
      emitsInOrder([
        const OverviewState(status: OverviewStatus.ready),
        const OverviewState(status: OverviewStatus.ready, goals: updated),
      ]),
    );

    cubit.watch();
    profiles
      ..add(const Profile())
      ..add(const Profile(goals: updated));

    await emitted;
  });

  test('watch subscribes only once', () {
    cubit
      ..watch()
      ..watch();

    verify(() => repository.watchProfile()).called(1);
  });

  test('watch emits failure when the stream errors', () async {
    final emitted = expectLater(
      cubit.stream,
      emits(const OverviewState(status: OverviewStatus.failure)),
    );

    cubit.watch();
    profiles.addError(Exception('db'));

    await emitted;
  });
}
