import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/reference_intake.dart';
import 'package:macro_cal_public/features/microcal/presentation/cubit/microcal_cubit.dart';
import 'package:macro_cal_public/features/microcal/presentation/cubit/microcal_state.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
import 'package:macro_cal_public/features/today/domain/entities/supplement_entry.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/sample_summary.dart';
import '../../../../helpers/sample_supplements.dart';

class _MockProfileRepository extends Mock implements ProfileRepository;

class _MockFoodLogRepository extends Mock implements FoodLogRepository;

class _MockHistoryRepository extends Mock implements HistoryRepository;

class _MockSettingsRepository extends Mock implements SettingsRepository;

void main() {
  late StreamController<Profile> profiles;
  late StreamController<List<FoodEntry>> food;
  late StreamController<List<SupplementEntry>> supplements;
  late StreamController<List<DayLog>> dayLogs;
  late StreamController<bool> enabled;
  late MicroCalCubit cubit;

  const lentils = Ingredient(
    id: 1,
    name: 'Lentils',
    per100g: Nutrients(
      kcal: 116,
      micros: Micronutrients(amounts: {Micronutrient.iron: 3}),
    ),
  );
  const adult = Profile(sex: Sex.female, birthYear: 1990);

  DayLog dayLog(DateTime date, {double? iron}) => DayLog(
    date: date,
    summary: sampleSummary,
    micros: iron == null
        ? null
        : MicroIntake(
            food: Micronutrients(amounts: {Micronutrient.iron: iron}),
            coverage: const {Micronutrient.iron: 1},
          ),
  );

  setUp(() {
    profiles = StreamController<Profile>.broadcast();
    food = StreamController<List<FoodEntry>>.broadcast();
    supplements = StreamController<List<SupplementEntry>>.broadcast();
    dayLogs = StreamController<List<DayLog>>.broadcast();
    enabled = StreamController<bool>.broadcast();
    final profileRepository = _MockProfileRepository();
    final foodLogRepository = _MockFoodLogRepository();
    final historyRepository = _MockHistoryRepository();
    final settingsRepository = _MockSettingsRepository();
    when(profileRepository.watchProfile).thenAnswer((_) => profiles.stream);
    when(foodLogRepository.watchEntries).thenAnswer((_) => food.stream);
    when(foodLogRepository.watchSupplementEntries)
        .thenAnswer((_) => supplements.stream);
    when(historyRepository.watchDayLogs).thenAnswer((_) => dayLogs.stream);
    when(settingsRepository.watchMicrocalEnabled)
        .thenAnswer((_) => enabled.stream);
    cubit = MicroCalCubit(
      profileRepository,
      foodLogRepository,
      historyRepository,
      settingsRepository,
      now: () => DateTime(2026, 11, 15, 20),
    );
  });
  tearDown(() async {
    await cubit.close();
    await profiles.close();
    await food.close();
    await supplements.close();
    await dayLogs.close();
    await enabled.close();
  });

  void addAll({
    Profile profile = adult,
    List<FoodEntry> foodEntries = const [],
    List<SupplementEntry> supplementEntries = const [],
    List<DayLog> logs = const [],
  }) {
    profiles.add(profile);
    food.add(foodEntries);
    supplements.add(supplementEntries);
    dayLogs.add(logs);
    enabled.add(true);
  }

  test('is ready only once every source has a value', () async {
    final emitted = expectLater(
      cubit.stream.map((state) => (state.status, state.enabled)),
      emits((MicroCalStatus.ready, true)),
    );

    cubit.watch();
    expect(cubit.state.status, MicroCalStatus.loading);
    addAll();

    await emitted;
    expect(cubit.state.references?[Micronutrient.iron]?.target, 16);
    expect(
      cubit.state.references?[Micronutrient.iron]?.source,
      ReferenceSource.efsa,
    );
    expect((cubit.state.sex, cubit.state.age), (Sex.female, 36));
  });

  test('averages the last 7 days with data, today included', () async {
    final emitted = expectLater(
      cubit.stream.map((state) => (state.weekDays, state.week)),
      emits((
        3,
        const MicroIntake(
          food: Micronutrients(amounts: {Micronutrient.iron: 6}),
          coverage: {Micronutrient.iron: 1},
        ),
      )),
    );

    cubit.watch();
    addAll(
      foodEntries: const [IngredientEntry(ingredient: lentils, grams: 200)],
      logs: [
        dayLog(DateTime(2026, 11, 14), iron: 4),
        dayLog(DateTime(2026, 11, 13)),
        dayLog(DateTime(2026, 11, 9), iron: 8),
        dayLog(DateTime(2026, 11, 8), iron: 100),
      ],
    );

    await emitted;
    expect(cubit.state.today.food[Micronutrient.iron], 6);
  });

  test("an archived today replaces today's log in the week", () async {
    final emitted = expectLater(
      cubit.stream.map((state) => (state.weekDays, state.week.total(.iron))),
      emits((1, 2.0)),
    );

    cubit.watch();
    addAll(
      foodEntries: const [IngredientEntry(ingredient: lentils, grams: 200)],
      logs: [dayLog(DateTime(2026, 11, 15), iron: 2)],
    );

    await emitted;
  });

  test('has no references under 18', () async {
    final emitted = expectLater(
      cubit.stream.map((state) => (state.age, state.references)),
      emits((17, null)),
    );

    cubit.watch();
    addAll(profile: const Profile(sex: Sex.male, birthYear: 2009));

    await emitted;
  });

  test('selectPeriod switches the intake shown', () async {
    cubit.watch();
    addAll(
      supplementEntries: const [
        SupplementEntry(supplement: sampleVitaminD, units: 2),
      ],
      logs: [dayLog(DateTime(2026, 11, 14), iron: 4)],
    );
    await pumpEventQueue();
    expect(cubit.state.intake.total(Micronutrient.vitaminD), 10);

    cubit.selectPeriod(MicroCalPeriod.today);

    expect(cubit.state.intake.total(Micronutrient.vitaminD), 20);
  });

  test("contributorsOf lists today's entries for a nutrient", () async {
    cubit.watch();
    addAll(
      foodEntries: const [IngredientEntry(ingredient: lentils, grams: 100)],
    );
    await pumpEventQueue();

    expect(cubit.contributorsOf(Micronutrient.iron), [
      (name: 'Lentils', amount: 3.0, isSupplement: false),
    ]);
  });

  test('a failing source emits failure', () async {
    final emitted = expectLater(
      cubit.stream.map((state) => state.status),
      emits(MicroCalStatus.failure),
    );

    cubit.watch();
    dayLogs.addError(Exception('db'));

    await emitted;
  });
}
