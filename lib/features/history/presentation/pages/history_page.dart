import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/assets/app_assets.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/empty_state.dart';
import 'package:macro_cal_public/core/widgets/major_page_app_bar.dart';
import 'package:macro_cal_public/features/settings/presentation/widgets/settings_drawer.dart';

class HistoryPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: MajorPageAppBar(title: l10n.historicalPageTitle),
      endDrawer: const SettingsDrawer(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: EmptyState(
          image: AppImages.historical,
          title: l10n.historyPageComingSoonTitle,
          subtitle: l10n.historyPageComingSoonSubtitle,
          subtitleStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
