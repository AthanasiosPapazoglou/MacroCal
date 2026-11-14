import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:macro_cal_public/app/app.dart';
import 'package:macro_cal_public/core/bloc/app_bloc_observer.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/core/database/drift_transaction_runner.dart';
import 'package:macro_cal_public/core/database/seed/ingredient_seed.dart';
import 'package:macro_cal_public/features/food_bank/data/datasources/open_food_facts_client.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/asset_reference_food_repository.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_supplement_repository.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/open_food_facts_product_lookup_repository.dart';
import 'package:macro_cal_public/features/history/data/repositories/drift_history_repository.dart';
import 'package:macro_cal_public/features/history/domain/use_cases/archive_day.dart';
import 'package:macro_cal_public/features/profile/data/repositories/drift_profile_repository.dart';
import 'package:macro_cal_public/features/settings/data/repositories/drift_settings_repository.dart';
import 'package:macro_cal_public/features/today/data/repositories/drift_activity_repository.dart';
import 'package:macro_cal_public/features/today/data/repositories/drift_food_log_repository.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  runApp(
    await createApp(
      database: AppDatabase(null, loadDefaultIngredientSeeds),
      httpClient: http.Client(),
    ),
  );
}

/// Wires the repositories and use cases on [database] into the [App].
Future<App> createApp({
  required AppDatabase database,
  required http.Client httpClient,
}) async {
  final settingsRepository = DriftSettingsRepository(database);
  final activityRepository = DriftActivityRepository(database);
  final foodLogRepository = DriftFoodLogRepository(database);
  final historyRepository = DriftHistoryRepository(database);
  final profileRepository = DriftProfileRepository(database);
  return App(
    settingsRepository: settingsRepository,
    profileRepository: profileRepository,
    activityRepository: activityRepository,
    foodLogRepository: foodLogRepository,
    ingredientRepository: DriftIngredientRepository(database),
    recipeRepository: DriftRecipeRepository(database),
    supplementRepository: DriftSupplementRepository(database),
    productLookupRepository: OpenFoodFactsProductLookupRepository(
      OpenFoodFactsClient(httpClient),
    ),
    referenceFoodRepository: AssetReferenceFoodRepository(rootBundle),
    historyRepository: historyRepository,
    archiveDay: ArchiveDay(
      historyRepository,
      foodLogRepository,
      activityRepository,
      profileRepository,
      DriftTransactionRunner(database),
    ),
    initialLanguage: await settingsRepository.readLanguage(),
  );
}
