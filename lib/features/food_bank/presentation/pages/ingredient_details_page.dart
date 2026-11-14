import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_details_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/ingredient_details_view.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';

class IngredientDetailsPage extends StatelessWidget {
  const new({required this.ingredientId, super.key});

  final int ingredientId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IngredientDetailsCubit(
        context.read<IngredientRepository>(),
        context.read<RecipeRepository>(),
        context.read<SettingsRepository>(),
        ingredientId,
      )..watch(),
      child: const IngredientDetailsView(),
    );
  }
}
