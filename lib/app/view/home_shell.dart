import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/miscellaneous/images.dart';

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
            icon: tabIcon(context, todayImagePath),
            label: l10n.tabBarOverview,
          ),
          NavigationDestination(
            icon: tabIcon(context, foodsImagePath),
            label: l10n.tabBarFoodBank,
          ),
          NavigationDestination(
            icon: tabIcon(context, historicalImagePath),
            label: l10n.tabBarHistorical,
          ),
          NavigationDestination(
            icon: tabIcon(context, profileImagePath),
            label: l10n.tabBarProfile,
          ),
        ],
      ),
    );
  }
}
