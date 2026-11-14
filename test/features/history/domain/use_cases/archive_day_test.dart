import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/core/database/drift_transaction_runner.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_supplement_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/history/data/repositories/drift_history_repository.dart';
import 'package:macro_cal_public/features/history/domain/use_cases/archive_day.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/micro_intake.dart';
import 'package:macro_cal_public/features/profile/data/repositories/drift_profile_repository.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';
import 'package:macro_cal_public/features/today/data/repositories/drift_activity_repository.dart';
import 'package:macro_cal_public/features/today/data/repositories/drift_food_log_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/ingredient_seeds.dart';
import '../../../../helpers/sample_summary.dart';
import '../../../../helpers/test_database.dart';

class _FailingActivityRepository extends Mock implements ActivityRepository;

void main() {
  late AppDatabase database;
  late DriftHistoryRepository history;
  late DriftFoodLogRepository foodLog;
  late DriftActivityRepository activities;
  late DriftProfileRepository profile;

  setUp(() async {
    database = createTestDatabase(ingredientSeeds: testIngredientSeeds);
    history = DriftHistoryRepository(database);
    foodLog = DriftFoodLogRepository(database);
    activities = DriftActivityRepository(database);
    profile = DriftProfileRepository(database);
    await foodLog.replaceGrams({1: 200, 2: 50});
    await activities.replaceAmounts({1: 3});
  });
  tearDown(() => database.close());

  test('saves the day as a date-only log and clears today', () async {
    final archiveDay = ArchiveDay(
      history,
      foodLog,
      activities,
      profile,
      DriftTransactionRunner(database),
    );

    await archiveDay(
      date: DateTime(2026, 11, 6, 23, 15),
      summary: sampleSummary,
    );

    final logs = await history.watchDayLogs().first;
    expect(logs.single.date, DateTime(2026, 11, 6));
    expect(logs.single.summary, sampleSummary);
    expect(logs.single.micros, isNull);
    expect(logs.single.age, isNull);
    expect(await foodLog.watchEntries().first, isEmpty);
    expect((await activities.watchEntries().first).single.amount, 0);
  });

  test('rolls everything back when a step fails', () async {
    final failingActivities = _FailingActivityRepository();
    when(failingActivities.resetAmounts).thenThrow(Exception('db'));
    final archiveDay = ArchiveDay(
      history,
      foodLog,
      failingActivities,
      profile,
      DriftTransactionRunner(database),
    );

    await expectLater(
      archiveDay(date: DateTime(2026, 11, 6), summary: sampleSummary),
      throwsException,
    );

    expect(await history.watchDayLogs().first, isEmpty);
    expect(await foodLog.watchEntries().first, hasLength(2));
  });

  test(
    'stores the micros, sex and age of the day and clears supplements',
    () async {
      final ingredients = DriftIngredientRepository(database);
      final [milk, bread] = await ingredients.watchIngredients().first;
      await ingredients.updateIngredient(
        bread.copyWith(
          per100g: bread.per100g.copyWith(
            micros: const Micronutrients(amounts: {Micronutrient.iron: 2.5}),
          ),
        ),
      );
      final recipeId = await DriftRecipeRepository(database).addRecipe(
        name: 'Toast',
        ingredients: [
          RecipeIngredient(ingredient: bread, grams: 100),
          RecipeIngredient(ingredient: milk, grams: 200),
        ],
      );
      final supplementId = await DriftSupplementRepository(database)
          .addSupplement(
            name: 'Vitamin D',
            unit: SupplementUnit.drop,
            microsPerUnit: const Micronutrients(
              amounts: {Micronutrient.vitaminD: 25},
            ),
          );
      await foodLog.replaceGrams({}, gramsByRecipeId: {recipeId: 150});
      await foodLog.replaceSupplementUnits({supplementId: 2});
      await profile.saveProfile(
        const Profile(sex: Sex.female, birthYear: 1990),
      );

      await ArchiveDay(
        history,
        foodLog,
        activities,
        profile,
        DriftTransactionRunner(database),
      )(date: DateTime(2026, 11, 6), summary: sampleSummary);

      final log = (await history.watchDayLog(DateTime(2026, 11, 6)).first)!;
      expect(
        log.micros,
        const MicroIntake(
          food: Micronutrients(amounts: {Micronutrient.iron: 1.25}),
          supplements: Micronutrients(amounts: {Micronutrient.vitaminD: 50}),
          coverage: {Micronutrient.iron: 1 / 3},
        ),
      );
      expect(log.sex, Sex.female);
      expect(log.age, 36);
      expect(await foodLog.watchSupplementEntries().first, isEmpty);
    },
  );
}
