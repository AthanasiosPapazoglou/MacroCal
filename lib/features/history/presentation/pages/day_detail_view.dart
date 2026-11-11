import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:macro_cal_public/core/assets/app_assets.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/empty_state.dart';
import 'package:macro_cal_public/core/widgets/swipe_back_detector.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_detail_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_detail_state.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/summary_breakdown.dart';

class DayDetailView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final cubit = context.watch<DayDetailCubit>();
    final state = cubit.state;
    final log = state.log;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          DateFormat('EEEE dd/MM/yyyy', locale).format(cubit.date),
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SwipeBackDetector(
        child: switch (state.status) {
          DayDetailStatus.loading => const SizedBox.shrink(),
          DayDetailStatus.notFound || DayDetailStatus.failure => EmptyState(
            image: AppImages.historical,
            title: l10n.historyDayNotFound,
          ),
          DayDetailStatus.ready => ListView(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
            children: [
              SummaryBreakdown(summary: log!.summary),
              Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  l10n.historyDayBurned(log.summary.burnedKcal.round()),
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        },
      ),
    );
  }
}
