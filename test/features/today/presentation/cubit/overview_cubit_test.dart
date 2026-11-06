import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity_entry.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockProfileRepository extends Mock implements ProfileRepository;

class _MockActivityRepository extends Mock implements ActivityRepository;

void main() {
  late StreamController<Profile> profiles;
  late StreamController<List<ActivityEntry>> activities;
  late ProfileRepository profileRepository;
  late ActivityRepository activityRepository;
  late OverviewCubit cubit;

  const walking = Activity(
    id: 1,
    name: 'Walking',
    kcalPerUnit: 50,
    unitLabel: 'Kilometers',
  );

  setUp(() {
    profiles = StreamController<Profile>.broadcast();
    activities = StreamController<List<ActivityEntry>>.broadcast();
    profileRepository = _MockProfileRepository();
    activityRepository = _MockActivityRepository();
    when(() => profileRepository.watchProfile())
        .thenAnswer((_) => profiles.stream);
    when(() => activityRepository.watchEntries())
        .thenAnswer((_) => activities.stream);
    cubit = OverviewCubit(profileRepository, activityRepository);
  });
  tearDown(() async {
    await cubit.close();
    await profiles.close();
    await activities.close();
  });

  test('starts loading with a summary of the default goals', () {
    expect(cubit.state.status, OverviewStatus.loading);
    expect(cubit.state.summary.goals, const NutritionGoals());
    expect(cubit.state.summary.adjustedKcal, 2100);
  });

  test('watch combines goals and logged activities', () async {
    final emitted = expectLater(
      cubit.stream.map((state) => (state.status, state.summary.adjustedKcal)),
      emitsInOrder([
        (OverviewStatus.ready, 1800.0),
        (OverviewStatus.ready, 1950.0),
        (OverviewStatus.ready, 2150.0),
      ]),
    );

    cubit.watch();
    profiles.add(const Profile(goals: NutritionGoals(dailyKcal: 1800)));
    activities.add(const [ActivityEntry(activity: walking, amount: 3)]);
    profiles.add(const Profile(goals: NutritionGoals(dailyKcal: 2000)));

    await emitted;
  });

  test('watch subscribes only once', () {
    cubit
      ..watch()
      ..watch();

    verify(() => profileRepository.watchProfile()).called(1);
    verify(() => activityRepository.watchEntries()).called(1);
  });

  test('watch emits failure when a stream errors', () async {
    final emitted = expectLater(
      cubit.stream.map((state) => state.status),
      emits(OverviewStatus.failure),
    );

    cubit.watch();
    activities.addError(Exception('db'));

    await emitted;
  });
}
