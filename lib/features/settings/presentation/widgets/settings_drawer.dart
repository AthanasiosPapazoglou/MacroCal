import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/settings/presentation/widgets/language_switch.dart';
import 'package:macro_cal_public/features/settings/presentation/widgets/microcal_tracking_switch.dart';

class SettingsDrawer extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  context.l10n.settingsPageLanguage,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                const LanguageSwitch(),
                const SizedBox(height: 32),
                const MicrocalTrackingSwitch(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
