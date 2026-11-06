import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_details_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_details_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/nutrient_kind.dart';
import 'package:macro_cal_public/miscellaneous/enums.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/themes/app_colors.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:macro_cal_public/wrappers/dismiss_page.dart';

class IngredientDetailsPage extends StatelessWidget {
  const IngredientDetailsPage({required this.ingredientId, super.key});

  final int ingredientId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IngredientDetailsCubit(
        context.read<IngredientRepository>(),
        ingredientId,
      )..watch(),
      child: BlocConsumer<IngredientDetailsCubit, IngredientDetailsState>(
        listenWhen: (_, current) =>
            current.status == IngredientDetailsStatus.deleted,
        listener: (context, _) => context.pop(),
        builder: (context, state) {
          final ingredient = state.ingredient;
          return Scaffold(
            appBar: AppBar(
              title: Text(
                context.l10n.ingredientDetailsTitle,
                style: appBarStyle(),
              ),
              backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
            ),
            body: ingredient == null
                ? const SizedBox.shrink()
                : PageDismissWraper(child: _details(context, ingredient)),
          );
        },
      ),
    );
  }

  Widget _details(BuildContext context, Ingredient ingredient) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _namingBorder(context, ingredient),
          Expanded(
            child: ListView(
              children: [
                for (final kind in NutrientKind.values)
                  _nutrientItem(context, kind, kind.valueIn(ingredient.per100g)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: _bottomSideActionBar(context),
          ),
        ],
      ),
    );
  }

  Padding _namingBorder(BuildContext context, Ingredient ingredient) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 12),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
          border: Border.all(color: AppThemes.darkTheme.primaryColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            heightSpacer(10),
            Text(
              ingredient.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            heightSpacer(10),
            Text(
              '${context.l10n.ingredientDetailsInfoBoard} '
              '${ingredient.referenceGrams.toInt()} '
              '${context.l10n.unitGramsShort}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade300,
              ),
            ),
            heightSpacer(10),
          ],
        ),
      ),
    );
  }

  Column _nutrientItem(BuildContext context, NutrientKind kind, double value) {
    final color = switch (kind.healthEffect) {
      HealthEffects.hazardous => Colors.red.shade300,
      HealthEffects.benefitial => Colors.green.shade300,
      HealthEffects.neutral => null,
    };
    return Column(
      children: [
        heightSpacer(12),
        GestureDetector(
          onTap: () => context.push(AppRoutes.nutrient(ingredientId, kind)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Hero(
                    tag: 'ICON${kind.svgPath}',
                    child: SvgPicture.asset(kind.svgPath, width: 40, height: 40),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    kind.title(context.l10n),
                    style: TextStyle(
                      color: color,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                value.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
        heightSpacer(12),
      ],
    );
  }

  Row _bottomSideActionBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => _showDeleteDialog(context),
          child: Text(
            context.l10n.ingredientDetailsButtonSideActionsDeleteButton,
            style: const TextStyle(color: AppColors.redAccent),
          ),
        ),
        const SizedBox(width: 24),
        ElevatedButton(
          onPressed: () => context.push(AppRoutes.editIngredient(ingredientId)),
          child: Text(
            '  ${context.l10n.ingredientDetailsButtonSideActionsEditButton}  ',
          ),
        ),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context) {
    final cubit = context.read<IngredientDetailsCubit>();
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(dialogContext.l10n.ingredientDetailsDeleteDialogTitle),
        content: Text(dialogContext.l10n.ingredientDetailsDeleteDialogBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              dialogContext.l10n.ingredientDetailsDeleteDialogCancel,
              style: const TextStyle(color: AppColors.redAccent),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              cubit.delete();
            },
            child: Text(dialogContext.l10n.ingredientDetailsDeleteDialogConfirm),
          ),
        ],
      ),
    );
  }
}
