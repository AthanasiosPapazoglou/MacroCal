import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/microcal/presentation/cubit/microcal_cubit.dart';
import 'package:macro_cal_public/features/microcal/presentation/cubit/microcal_state.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';

/// The 7-day MicroCal summary on the overview, shown while tracking is on.
class MicroCalCard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MicroCalCubit(
        context.read<ProfileRepository>(),
        context.read<FoodLogRepository>(),
        context.read<HistoryRepository>(),
        context.read<SettingsRepository>(),
      )..watch(),
      child: const MicroCalCardView(),
    );
  }
}

class MicroCalCardView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<MicroCalCubit>().state;
    if (state.status != MicroCalStatus.ready || !state.enabled) {
      return const SizedBox.shrink();
    }
    final references = state.references;
    return Card(
      margin: const EdgeInsets.only(top: 16),
      child: ListTile(
        leading: const Icon(Icons.eco_rounded),
        title: Text(l10n.microcalTitle),
        subtitle: Text(
          references == null
              ? l10n.microcalUnderAge
              : state.weekDays == 0
              ? l10n.microcalNoWeekData
              : l10n.microcalCardAtReference(
                  state.week.countAtReference(references),
                  references.length,
                ),
        ),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () => context.push(AppRoutes.microcal),
      ),
    );
  }
}
