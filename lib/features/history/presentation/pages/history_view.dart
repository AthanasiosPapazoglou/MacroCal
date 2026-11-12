import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/core/assets/app_assets.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/empty_state.dart';
import 'package:macro_cal_public/core/widgets/loader.dart';
import 'package:macro_cal_public/core/widgets/major_page_app_bar.dart';
import 'package:macro_cal_public/features/history/domain/entities/tracked_goal.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/history_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/history_state.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/calories_chart.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/day_log_tile.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/goal_adherence_bar.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/history_range_selector.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/history_summary.dart';
import 'package:macro_cal_public/features/history/presentation/widgets/macro_split_chart.dart';
import 'package:macro_cal_public/features/settings/presentation/widgets/settings_drawer.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/section_header.dart';

class HistoryView extends StatelessWidget {
  const new({super.key});

  static const latestDays = 5;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: MajorPageAppBar(title: l10n.historicalPageTitle),
      endDrawer: const SettingsDrawer(),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (context, state) => switch (state.status) {
          HistoryStatus.loading => const Loader(),
          HistoryStatus.failure => EmptyState(
            image: AppImages.historical,
            title: l10n.historyPageLoadFailed,
          ),
          HistoryStatus.ready => ListView(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 56),
            children: [
              HistoryRangeSelector(
                range: state.range,
                onChanged: context.read<HistoryCubit>().selectRange,
              ),
              const SizedBox(height: 16),
              if (state.logs.isEmpty)
                EmptyState(
                  image: AppImages.historical,
                  title: l10n.historyPageEmptyTitle,
                  subtitle: l10n.historyPageEmptySubtitle,
                )
              else ...[
                HistorySummary(stats: state.stats),
                SectionHeader(l10n.historyPageCaloriesChart),
                CaloriesChart(
                  logs: state.logs,
                  averageGoal: state.stats.averageAdjustedKcal,
                ),
                if (MacroSplitChart.hasData(state.stats.averageConsumed)) ...[
                  SectionHeader(l10n.historyPageMacroSplit),
                  MacroSplitChart(average: state.stats.averageConsumed),
                ],
                SectionHeader(l10n.historyPageAdherence),
                for (final goal in TrackedGoal.values)
                  GoalAdherenceBar(goal: goal, stats: state.stats),
                SectionHeader(l10n.historyPageDays),
                for (final log in state.logs.take(latestDays))
                  DayLogTile(log: log),
              ],
              Center(
                child: TextButton.icon(
                  onPressed: () => context.push(AppRoutes.historyDays),
                  icon: const Icon(Icons.calendar_month_rounded),
                  label: Text(l10n.historyDaysSeeAll),
                ),
              ),
            ],
          ),
        },
      ),
    );
  }
}
