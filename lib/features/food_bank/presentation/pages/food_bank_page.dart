import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/supplement_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/food_bank_view.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';

class FoodBankPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FoodBankCubit(
        context.read<IngredientRepository>(),
        context.read<RecipeRepository>(),
        context.read<SupplementRepository>(),
        context.read<SettingsRepository>(),
      )..watch(),
      child: const FoodBankView(),
    );
  }
}
