import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_detail_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/pages/day_detail_view.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';

class DayDetailPage extends StatelessWidget {
  const new({required this.date, super.key});

  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DayDetailCubit(
        context.read<HistoryRepository>(),
        context.read<SettingsRepository>(),
        date,
      )..watch(),
      child: const DayDetailView(),
    );
  }
}
