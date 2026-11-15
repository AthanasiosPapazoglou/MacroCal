import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/microcal/presentation/cubit/microcal_cubit.dart';
import 'package:macro_cal_public/features/microcal/presentation/pages/microcal_view.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';

class MicroCalPage extends StatelessWidget {
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
      child: const MicroCalView(),
    );
  }
}
