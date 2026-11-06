import 'package:flutter/material.dart';
import 'package:macro_cal_public/components/language_switch.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.settingsPageTitle,
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
