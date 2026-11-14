import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/swipe_back_detector.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_details_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_details_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/nutrient_kind.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/delete_food_dialog.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/food_header.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/micronutrient_list.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/nutrient_row.dart';

class IngredientDetailsView extends StatelessWidget {
  const new({super.key});

  Future<void> _confirmDelete(BuildContext context) async {
    final cubit = context.read<IngredientDetailsCubit>();
    final l10n = context.l10n;
    final recipeNames = cubit.state.recipeNames;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => DeleteFoodDialog(
        body: l10n.ingredientDetailsDeleteDialogBody,
        note: recipeNames.isEmpty
            ? null
            : l10n.ingredientDetailsDeleteDialogRecipes(recipeNames.join(', ')),
      ),
    );
    if (confirmed ?? false) await cubit.delete();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IngredientDetailsCubit, IngredientDetailsState>(
      listenWhen: (_, current) =>
          current.status == IngredientDetailsStatus.deleted,
      listener: (context, _) => context.pop(),
      builder: (context, state) {
        final ingredient = state.ingredient;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              context.l10n.ingredientDetailsTitle,
              style: AppTextStyles.appBarTitle,
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: ingredient == null
              ? const SizedBox.shrink()
              : SwipeBackDetector(
                  child: _details(
                    context,
                    ingredient,
                    showMicros: state.microcalEnabled,
                  ),
                ),
        );
      },
    );
  }

  Widget _details(
    BuildContext context,
    Ingredient ingredient, {
    required bool showMicros,
  }) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          FoodHeader(
            name: ingredient.name,
            referenceGrams: ingredient.referenceGrams,
          ),
          Expanded(
            child: ListView(
              children: [
                for (final kind in NutrientKind.values)
                  NutrientRow(
                    kind: kind,
                    value: kind.valueIn(ingredient.per100g),
                    onTap: () =>
                        context.push(AppRoutes.nutrient(ingredient.id, kind)),
                  ),
                if (showMicros)
                  MicronutrientList(micros: ingredient.per100g.micros),
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
                      context.push(AppRoutes.editIngredient(ingredient.id)),
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
}
