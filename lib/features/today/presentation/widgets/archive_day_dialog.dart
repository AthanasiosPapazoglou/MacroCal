import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/domain/use_cases/archive_day.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/archive_day_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/archive_day_dialog_view.dart';

class ArchiveDayDialog extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = ArchiveDayCubit(
          context.read<HistoryRepository>(),
          context.read<ArchiveDay>(),
          today: DateTime.now(),
        );
        unawaited(cubit.load());
        return cubit;
      },
      child: const ArchiveDayDialogView(),
    );
  }
}
