import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_field.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockProfileRepository extends Mock implements ProfileRepository;

void main() {
  late ProfileRepository repository;
  late ProfileCubit cubit;

  const stored = Profile(weightKg: 70);
  const validInput = {
    ProfileField.dailyKcal: '1800',
    ProfileField.proteinG: '120',
    ProfileField.fiberG: '30',
    ProfileField.sugarLimitPct: '5',
    ProfileField.saturatedLimitPct: '6',
    ProfileField.saltLimitMg: '5000',
    ProfileField.weightKg: '80,5',
    ProfileField.heightCm: '175',
  };
  const saved = Profile(
    goals: NutritionGoals(
      dailyKcal: 1800,
      proteinG: 120,
      fiberG: 30,
      sugarLimitPct: 5,
      saturatedLimitPct: 6,
      saltLimitMg: 5000,
    ),
    weightKg: 80.5,
    heightCm: 175,
  );

  setUpAll(() => registerFallbackValue(const Profile()));

  setUp(() {
    repository = _MockProfileRepository();
    when(() => repository.watchProfile())
        .thenAnswer((_) => Stream.value(stored));
    when(() => repository.saveProfile(any())).thenAnswer((_) async {});
    cubit = ProfileCubit(repository);
  });
  tearDown(() => cubit.close());

  test('starts loading with the default profile', () {
    expect(cubit.state, const ProfileState());
  });

  test('load emits the stored profile', () async {
    await cubit.load();

    expect(
      cubit.state,
      const ProfileState(status: ProfileStatus.ready, profile: stored),
    );
  });

  test('load emits failure when the repository throws', () async {
    when(() => repository.watchProfile())
        .thenAnswer((_) => Stream.error(Exception('db')));

    await cubit.load();

    expect(cubit.state.status, ProfileStatus.failure);
  });

  test('save parses every field, stores the profile and emits saved', () async {
    await cubit.load();
    final emitted = expectLater(
      cubit.stream,
      emitsInOrder([
        const ProfileState(status: ProfileStatus.saving, profile: saved),
        const ProfileState(status: ProfileStatus.saved, profile: saved),
      ]),
    );

    await cubit.save(validInput);
    await emitted;

    verify(() => repository.saveProfile(saved)).called(1);
  });

  test('save rejects invalid input without storing it', () async {
    await cubit.load();

    await cubit.save({...validInput, ProfileField.proteinG: '-5'});

    expect(
      cubit.state,
      const ProfileState(status: ProfileStatus.invalid, profile: stored),
    );
    verifyNever(() => repository.saveProfile(any()));
  });

  test('save emits failure when storing throws', () async {
    when(() => repository.saveProfile(any())).thenThrow(Exception('db'));
    await cubit.load();

    await cubit.save(validInput);

    expect(cubit.state.status, ProfileStatus.failure);
  });
}
