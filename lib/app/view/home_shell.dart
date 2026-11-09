import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/core/assets/app_assets.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/tab_icon.dart';

class HomeShell extends StatelessWidget {
  const new({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: [
          NavigationDestination(
            icon: const TabIcon(AppImages.today),
            label: l10n.tabBarOverview,
          ),
          NavigationDestination(
            icon: const TabIcon(AppImages.foods),
            label: l10n.tabBarFoodBank,
          ),
          NavigationDestination(
            icon: const TabIcon(AppImages.historical),
            label: l10n.tabBarHistorical,
          ),
          NavigationDestination(
            icon: const TabIcon(AppImages.profile),
            label: l10n.tabBarProfile,
          ),
        ],
      ),
    );
  }
}
