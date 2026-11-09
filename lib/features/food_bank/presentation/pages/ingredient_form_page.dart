import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/product_lookup_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/ingredient_form_view.dart';

class IngredientFormPage extends StatelessWidget {
  const new({this.ingredientId, super.key});

  final int? ingredientId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = IngredientFormCubit(
          context.read<IngredientRepository>(),
          context.read<ProductLookupRepository>(),
          ingredientId: ingredientId,
        );
        unawaited(cubit.load());
        return cubit;
      },
      child: const IngredientFormView(),
    );
  }
}
