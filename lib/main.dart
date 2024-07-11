import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/pages/main_page.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:get_storage/get_storage.dart';
import 'package:easy_localization/easy_localization.dart';

// late List<CameraDescription> cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();

  Intl.defaultLocale = /*'el_GR';*/ 'en_US';

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en', 'US'), Locale('el', 'GR')],
        path: 'assets/translations',
        startLocale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        /*Locale('el', 'GR'),*/
        child: const MacroCal()),
  );
}

class MacroCal extends StatefulWidget with WidgetsBindingObserver {
  const MacroCal({super.key});

  @override
  State<MacroCal> createState() => _MacroCalState();
}

class _MacroCalState extends State<MacroCal> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    firstOrLaterGlobalLoad();
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      globalDataSave();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
      darkTheme: AppThemes.darkTheme,
      home: const DefaultTabController(
        length: 4,
        animationDuration: Duration(milliseconds: 300),
        child: MainPage(),
      ),
      initialBinding: BindingsBuilder(() {
        Get.put<DataController>(DataController());
      }),
    );
  }
}
