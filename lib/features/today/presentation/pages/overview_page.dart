import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/major_page_app_bar.dart';
import 'package:macro_cal_public/features/settings/presentation/widgets/settings_drawer.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/archive_day_dialog.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/expandable_fab.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/summary_breakdown.dart';

/// Reads the app-scoped OverviewCubit, so it needs no provider of its own.
class OverviewPage extends StatefulWidget {
  const new({super.key});

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final summary = context.watch<OverviewCubit>().state.summary;
    final date = DateFormat('dd/MM/yy').format(DateTime.now());
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: MajorPageAppBar(title: '${l10n.overviewPageTitle}:  $date'),
      endDrawer: const SettingsDrawer(),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 48),
            children: [SummaryBreakdown(summary: summary)],
          ),
          Positioned(
            left: 16,
            top: 4,
            child: IconButton(
              onPressed: () => showDialog<void>(
                context: context,
                builder: (_) => const ArchiveDayDialog(),
              ),
              icon: const Icon(Icons.save_rounded),
              style: IconButton.styleFrom(
                backgroundColor: color,
                fixedSize: const Size(50, 50),
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 4,
            child: ExpandableFab(
              actions: [
                ExpandableFabAction(
                  icon: Icons.restaurant_rounded,
                  onPressed: () => context.push(AppRoutes.consumption),
                ),
                ExpandableFabAction(
                  icon: Icons.sports_gymnastics_rounded,
                  onPressed: () => context.push(AppRoutes.exercise),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
