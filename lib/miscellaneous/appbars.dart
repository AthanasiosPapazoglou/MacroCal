import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macro_cal_public/components/language_switch.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/themes/app_themes.dart';

class MajorPageAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  const MajorPageAppBar({
    super.key,
    required this.title,
  });

  @override
  State<MajorPageAppBar> createState() => _MajorPageAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MajorPageAppBarState extends State<MajorPageAppBar> {
  final DataController dataController = Get.find();
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.settings_rounded),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}

class SettingsDrawer extends StatelessWidget {
  const SettingsDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = EasyLocalization.of(context)!.currentLocale;
    final label = locale == const Locale('en', 'US') ? 'Language' : 'Γλώσσα';

    return Drawer(
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                const LanguageSwitch(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
