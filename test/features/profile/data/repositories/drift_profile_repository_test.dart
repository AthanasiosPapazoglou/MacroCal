import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/profile/data/repositories/drift_profile_repository.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';

import '../../../../helpers/test_database.dart';

void main() {
  late AppDatabase database;
  late DriftProfileRepository repository;

  const customProfile = Profile(
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

  setUp(() {
    database = createTestDatabase();
    repository = DriftProfileRepository(database);
  });
  tearDown(() => database.close());

  test('emits the default profile when nothing is saved', () async {
    expect(await repository.watchProfile().first, const Profile());
  });

  test('round-trips every saved field', () async {
    await repository.saveProfile(customProfile);

    expect(await repository.watchProfile().first, customProfile);
  });

  test('emits again when the profile is saved', () async {
    final emitted = expectLater(
      repository.watchProfile(),
      emitsInOrder([const Profile(), customProfile]),
    );
    await repository.watchProfile().first;
    await repository.saveProfile(customProfile);

    await emitted;
  });

  test('keeps a single profile row', () async {
    await repository.saveProfile(customProfile);
    await repository.saveProfile(const Profile());

    expect(await database.select(database.profileTable).get(), hasLength(1));
    expect(await repository.watchProfile().first, const Profile());
  });
}
