import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/recipe_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_details_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/pages/recipe_details_view.dart';

class RecipeDetailsPage extends StatelessWidget {
  const new({required this.recipeId, super.key});

  final int recipeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecipeDetailsCubit(context.read<RecipeRepository>(), recipeId)
            ..watch(),
      child: const RecipeDetailsView(),
    );
  }
}
