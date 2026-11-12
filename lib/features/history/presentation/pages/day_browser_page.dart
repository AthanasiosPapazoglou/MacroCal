import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/day_browser_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/pages/day_browser_view.dart';

class DayBrowserPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DayBrowserCubit(context.read<HistoryRepository>())..watch(),
      child: const DayBrowserView(),
    );
  }
}
