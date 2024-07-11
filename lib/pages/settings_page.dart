import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:macro_cal_public/components/language_switch.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/themes/app_themes.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('settings_page.title'),
          style: appBarStyle(),
        ),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      ),
      body: const Center(
        child: LanguageSwitch(),
      ),
    );
  }
}
