import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/app/app.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/product_lookup_repository.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/domain/use_cases/archive_day.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/settings/domain/entities/app_language.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';
import 'package:mocktail/mocktail.dart';

import 'sample_ingredients.dart';

class MockSettingsRepository extends Mock implements SettingsRepository;

class MockProfileRepository extends Mock implements ProfileRepository;

class MockActivityRepository extends Mock implements ActivityRepository;

class MockFoodLogRepository extends Mock implements FoodLogRepository;

class MockIngredientRepository extends Mock implements IngredientRepository;

class MockProductLookupRepository extends Mock
    implements ProductLookupRepository;

class MockHistoryRepository extends Mock implements HistoryRepository;

class MockArchiveDay extends Mock implements ArchiveDay;

/// Pumps the whole app on mocks holding [sampleMilk] and [sampleBread].
Future<void> pumpApp(WidgetTester tester) async {
  final profile = MockProfileRepository();
  final activities = MockActivityRepository();
  final foodLog = MockFoodLogRepository();
  final ingredients = MockIngredientRepository();
  final history = MockHistoryRepository();

  tester.view
    ..physicalSize = const Size(1179, 2556)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);

  when(profile.watchProfile).thenAnswer((_) => Stream.value(const Profile()));
  when(activities.watchEntries).thenAnswer((_) => Stream.value(const []));
  when(foodLog.watchEntries).thenAnswer((_) => Stream.value(const []));
  when(ingredients.watchIngredients)
      .thenAnswer((_) => Stream.value(const [sampleMilk, sampleBread]));
  when(() => ingredients.watchIngredient(any())).thenAnswer(
    (invocation) => Stream.value(
      const {
        1: sampleMilk,
        2: sampleBread,
      }[invocation.positionalArguments.single as int],
    ),
  );
  when(() => history.hasLogFor(any())).thenAnswer((_) async => false);

  await tester.pumpWidget(
    App(
      settingsRepository: MockSettingsRepository(),
      profileRepository: profile,
      activityRepository: activities,
      foodLogRepository: foodLog,
      ingredientRepository: ingredients,
      productLookupRepository: MockProductLookupRepository(),
      historyRepository: history,
      archiveDay: MockArchiveDay(),
      initialLanguage: AppLanguage.english,
    ),
  );
  await tester.pumpAndSettle();
}
