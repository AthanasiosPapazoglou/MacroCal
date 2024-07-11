import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/pages/settings_page.dart';
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
        IconButton(
          icon: const Icon(Icons.settings_rounded),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
        ),
        const SizedBox(
          width: 16,
        )
      ],
    );
  }
}
