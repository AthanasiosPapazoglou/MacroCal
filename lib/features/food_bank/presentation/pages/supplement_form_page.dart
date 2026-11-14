import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/supplement_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/supplement_form_view.dart';

class SupplementFormPage extends StatelessWidget {
  const new({this.supplementId, super.key});

  final int? supplementId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = SupplementFormCubit(
          context.read<SupplementRepository>(),
          supplementId: supplementId,
        );
        unawaited(cubit.load());
        return cubit;
      },
      child: const SupplementFormView(),
    );
  }
}
