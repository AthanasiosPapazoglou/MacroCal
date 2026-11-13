import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/recipe_form_view.dart';

class RecipeFormPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = RecipeFormCubit(
          context.read<RecipeRepository>(),
          context.read<IngredientRepository>(),
        );
        unawaited(cubit.load());
        return cubit;
      },
      child: const RecipeFormView(),
    );
  }
}
