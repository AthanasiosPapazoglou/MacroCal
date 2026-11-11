import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/history_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/pages/history_view.dart';

class HistoryPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HistoryCubit(context.read<HistoryRepository>())..watch(),
      child: const HistoryView(),
    );
  }
}
