import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:macro_cal_public/app/app.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/core/bloc/app_bloc_observer.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/settings/data/repositories/drift_settings_repository.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  final database = AppDatabase();
  final settingsRepository = DriftSettingsRepository(database);
  final initialLanguage = await settingsRepository.readLanguage();

  await GetStorage.init();
  Get.put(DataController());
  await loadDefaultIngredients();
  firstOrLaterGlobalLoad();
  AppLifecycleListener(onPause: globalDataSave);

  runApp(
    App(
      settingsRepository: settingsRepository,
      initialLanguage: initialLanguage,
    ),
  );
}
