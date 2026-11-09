import 'package:flutter/material.dart';

/// App bar for the tab pages, with a button that opens the end drawer.
class MajorPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const new({required this.title, super.key});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
