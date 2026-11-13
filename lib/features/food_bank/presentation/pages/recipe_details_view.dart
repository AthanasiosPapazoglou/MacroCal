import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/swipe_back_detector.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_details_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_details_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/nutrient_kind.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/delete_food_dialog.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/food_header.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/nutrient_row.dart';

class RecipeDetailsView extends StatelessWidget {
  const new({super.key});

  Future<void> _confirmDelete(BuildContext context) async {
    final cubit = context.read<RecipeDetailsCubit>();
    final body = context.l10n.recipeDetailsDeleteBody;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => DeleteFoodDialog(body: body),
    );
    if (confirmed ?? false) await cubit.delete();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecipeDetailsCubit, RecipeDetailsState>(
      listenWhen: (_, current) => current.status == RecipeDetailsStatus.deleted,
      listener: (context, _) => context.pop(),
      builder: (context, state) {
        final recipe = state.recipe;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              context.l10n.recipeDetailsTitle,
              style: AppTextStyles.appBarTitle,
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: recipe == null
              ? const SizedBox.shrink()
              : SwipeBackDetector(child: _details(context, recipe)),
        );
      },
    );
  }

  Widget _details(BuildContext context, Recipe recipe) {
    final l10n = context.l10n;
    final kcal = recipe.totalNutrients.kcal.round();
    final finalWeight = recipe.finalWeightGrams;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          FoodHeader(name: recipe.name, referenceGrams: 100),
          Expanded(
            child: ListView(
              children: [
                Text(
                  l10n.foodsPageIngredients,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                for (final item in recipe.ingredients)
                  _IngredientLine(
                    item: item,
                    onTap: () =>
                        context.push(AppRoutes.ingredient(item.ingredient.id)),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    finalWeight == null ||
                            finalWeight == recipe.ingredientsWeightGrams
                        ? l10n.recipeDetailsWhole(recipe.weightGrams, kcal)
                        : l10n.recipeDetailsWholeCooked(
                            finalWeight,
                            recipe.ingredientsWeightGrams,
                            kcal,
                          ),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade300,
                    ),
                  ),
                ),
                const Divider(),
                for (final kind in NutrientKind.values)
                  NutrientRow(
                    kind: kind,
                    value: _oneDecimal(kind.valueIn(recipe.per100g)),
                    onTap: () =>
                        context.push(AppRoutes.recipeNutrient(recipe.id, kind)),
                  ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _confirmDelete(context),
                  child: Text(
                    l10n.ingredientDetailsButtonSideActionsDeleteButton,
                    style: const TextStyle(color: AppColors.redAccent),
                  ),
                ),
                const SizedBox(width: 24),
                ElevatedButton(
                  onPressed: () =>
                      context.push(AppRoutes.editRecipe(recipe.id)),
                  child: Text(
                    '  ${l10n.ingredientDetailsButtonSideActionsEditButton}  ',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static double _oneDecimal(double value) => (value * 10).round() / 10;
}

class _IngredientLine extends StatelessWidget {
  const new({required this.item, required this.onTap});

  final RecipeIngredient item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Expanded(
              child: Text(
                item.ingredient.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            Text(
              '${item.grams} ${context.l10n.unitGramsShort}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.chevron_right_rounded),
          ],
        ),
      ),
    );
  }
}
