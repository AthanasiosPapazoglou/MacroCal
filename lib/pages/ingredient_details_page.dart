import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_cubit.dart';
import 'package:macro_cal_public/miscellaneous/enums.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/miscellaneous/images.dart';
import 'package:macro_cal_public/pages/create_ingredient_page.dart';
import 'package:macro_cal_public/pages/food_metric_detail_page.dart';
import 'package:macro_cal_public/themes/app_colors.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:macro_cal_public/wrappers/dismiss_page.dart';

class IngredientDetailsPage extends StatelessWidget {
  const IngredientDetailsPage({required this.ingredientId, super.key});

  final int ingredientId;

  @override
  Widget build(BuildContext context) {
    final ingredient = context.select(
      (FoodBankCubit cubit) => cubit.state.ingredientById(ingredientId),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.ingredientDetailsTitle, style: appBarStyle()),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      ),
      body: ingredient == null
          ? const SizedBox.shrink()
          : PageDismissWraper(child: _details(context, ingredient)),
    );
  }

  Widget _details(BuildContext context, Ingredient ingredient) {
    final per100g = ingredient.per100g;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          _namingBorder(context, ingredient),
          Expanded(
            child: ListView(
              children: [
                _macroDisplayItem(
                  context,
                  caloriesSvgPath,
                  per100g.kcal,
                  context.l10n.ingredientDetailsNutrientsCalories,
                  context.l10n.ingredientDetailsNutrientDescriptionsCalories,
                ),
                _macroDisplayItem(
                  context,
                  oliveSvgPath,
                  per100g.fatG,
                  context.l10n.ingredientDetailsNutrientsFat,
                  context.l10n.ingredientDetailsNutrientDescriptionsFat,
                ),
                _macroDisplayItem(
                  context,
                  saturatedSvgPath,
                  per100g.saturatedG,
                  context.l10n.ingredientDetailsNutrientsSaturated,
                  context.l10n.ingredientDetailsNutrientDescriptionsSaturated,
                  healthEffect: HealthEffects.hazardous,
                ),
                _macroDisplayItem(
                  context,
                  carbsSvgPath,
                  per100g.carbsG,
                  context.l10n.ingredientDetailsNutrientsCarbs,
                  context.l10n.ingredientDetailsNutrientDescriptionsCarbs,
                ),
                _macroDisplayItem(
                  context,
                  sugarSvgPath,
                  per100g.sugarsG,
                  context.l10n.ingredientDetailsNutrientsSugars,
                  context.l10n.ingredientDetailsNutrientDescriptionsSugars,
                  healthEffect: HealthEffects.hazardous,
                ),
                _macroDisplayItem(
                  context,
                  saladSvgPath,
                  per100g.fiberG,
                  context.l10n.ingredientDetailsNutrientsFiber,
                  context.l10n.ingredientDetailsNutrientDescriptionsFiber,
                  healthEffect: HealthEffects.benefitial,
                ),
                _macroDisplayItem(
                  context,
                  proteinSvgPath,
                  per100g.proteinG,
                  context.l10n.ingredientDetailsNutrientsProtein,
                  context.l10n.ingredientDetailsNutrientDescriptionsProtein,
                  healthEffect: HealthEffects.benefitial,
                ),
                _macroDisplayItem(
                  context,
                  saltSvgPath,
                  per100g.saltMg,
                  context.l10n.ingredientDetailsNutrientsSalt,
                  context.l10n.ingredientDetailsNutrientDescriptionsSalt,
                  healthEffect: HealthEffects.hazardous,
                ),
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

  Column _macroDisplayItem(
    BuildContext context,
    String svgPath,
    double value,
    String metricName,
    String metricDescription, {
    HealthEffects healthEffect = HealthEffects.neutral,
  }) {
    final color = switch (healthEffect) {
      HealthEffects.hazardous => Colors.red.shade300,
      HealthEffects.benefitial => Colors.green.shade300,
      HealthEffects.neutral => null,
    };
    return Column(
      children: [
        heightSpacer(12),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) => FoodMetricDetailsPage(
                title: metricName,
                svgPath: svgPath,
                metricDescription: metricDescription,
              ),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Hero(
                    tag: 'ICON$svgPath',
                    child: SvgPicture.asset(svgPath, width: 40, height: 40),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    metricName,
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
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (_) =>
                  CreateOrEditIngredientPage(ingredientId: ingredientId),
            ),
          ),
          child: Text(
            '  ${context.l10n.ingredientDetailsButtonSideActionsEditButton}  ',
          ),
        ),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context) {
    final cubit = context.read<FoodBankCubit>();
    final navigator = Navigator.of(context);
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
            onPressed: () async {
              await cubit.delete(ingredientId);
              navigator
                ..pop()
                ..pop();
            },
            child: Text(dialogContext.l10n.ingredientDetailsDeleteDialogConfirm),
          ),
        ],
      ),
    );
  }
}
