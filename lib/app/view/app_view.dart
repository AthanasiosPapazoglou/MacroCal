import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/settings/presentation/cubit/locale_cubit.dart';
import 'package:macro_cal_public/pages/main_page.dart';
import 'package:macro_cal_public/themes/app_themes.dart';

class AppView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final language = context.watch<LocaleCubit>().state;
    return MaterialApp(
      locale: Locale(language.code),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      theme: AppThemes.darkTheme,
      darkTheme: AppThemes.darkTheme,
      home: const DefaultTabController(
        length: 4,
        animationDuration: Duration(milliseconds: 300),
        child: MainPage(),
      ),
    );
  }
}
