import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:macro_cal_public/app/app.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/core/bloc/app_bloc_observer.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/core/database/seed/ingredient_seed.dart';
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
  final profileRepository = DriftProfileRepository(database);
  final activityRepository = DriftActivityRepository(database);
  final foodLogRepository = DriftFoodLogRepository(database);
  final initialLanguage = await settingsRepository.readLanguage();

  await GetStorage.init();
  Get.put(DataController());
  await loadDefaultIngredients();
  firstOrLaterGlobalLoad();
  AppLifecycleListener(onPause: globalDataSave);

  runApp(
    App(
      settingsRepository: settingsRepository,
      profileRepository: profileRepository,
      activityRepository: activityRepository,
      foodLogRepository: foodLogRepository,
      initialLanguage: initialLanguage,
    ),
  );
}
