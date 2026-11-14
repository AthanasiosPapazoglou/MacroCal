import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/reference_food_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/reference_food_picker_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/reference_food_picker_view.dart';

/// Searches the reference foods and pops the chosen one.
class ReferenceFoodPickerPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = ReferenceFoodPickerCubit(
          context.read<ReferenceFoodRepository>(),
        );
        unawaited(cubit.load());
        return cubit;
      },
      child: const ReferenceFoodPickerView(),
    );
  }
}
