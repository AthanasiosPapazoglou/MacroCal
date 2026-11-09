import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/consumption_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/pages/consumption_view.dart';

class ConsumptionPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = ConsumptionCubit(
          context.read<IngredientRepository>(),
          context.read<FoodLogRepository>(),
        );
        unawaited(cubit.load());
        return cubit;
      },
      child: const ConsumptionView(),
    );
  }
}
