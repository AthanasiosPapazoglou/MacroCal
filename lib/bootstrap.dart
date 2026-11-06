import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:macro_cal_public/app/app.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/core/bloc/app_bloc_observer.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = const AppBlocObserver();

  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  Get.put(DataController());
  await loadDefaultIngredients();
  firstOrLaterGlobalLoad();
  AppLifecycleListener(onPause: globalDataSave);

  Intl.defaultLocale = 'en_US';

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('el', 'GR')],
      path: 'assets/translations',
      startLocale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      child: const App(),
    ),
  );
}
