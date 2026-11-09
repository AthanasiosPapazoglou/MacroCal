import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/exercise_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/pages/exercise_view.dart';

class ExercisePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = ExerciseCubit(context.read<ActivityRepository>());
        unawaited(cubit.load());
        return cubit;
      },
      child: const ExerciseView(),
    );
  }
}
