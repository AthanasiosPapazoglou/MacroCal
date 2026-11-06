import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:macro_cal_public/app/app.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/core/bloc/app_bloc_observer.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/core/database/seed/ingredient_seed.dart';
import 'package:macro_cal_public/features/food_bank/data/datasources/open_food_facts_client.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/drift_ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/open_food_facts_product_lookup_repository.dart';
import 'package:macro_cal_public/features/profile/data/repositories/drift_profile_repository.dart';
import 'package:macro_cal_public/features/settings/data/repositories/drift_settings_repository.dart';
import 'package:macro_cal_public/features/today/data/repositories/drift_activity_repository.dart';
import 'package:macro_cal_public/features/today/data/repositories/drift_food_log_repository.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  final database = AppDatabase(null, loadDefaultIngredientSeeds);
  final settingsRepository = DriftSettingsRepository(database);
  final initialLanguage = await settingsRepository.readLanguage();

  await GetStorage.init();
  Get.put(DataController());
  globalDataLoad();
  AppLifecycleListener(onPause: globalDataSave);

  runApp(
    App(
      settingsRepository: settingsRepository,
      profileRepository: DriftProfileRepository(database),
      activityRepository: DriftActivityRepository(database),
      foodLogRepository: DriftFoodLogRepository(database),
      ingredientRepository: DriftIngredientRepository(database),
      productLookupRepository: OpenFoodFactsProductLookupRepository(
        OpenFoodFactsClient(http.Client()),
      ),
      initialLanguage: initialLanguage,
    ),
  );
}
