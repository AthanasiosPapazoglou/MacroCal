import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:macro_cal_public/miscellaneous/enums.dart';
import 'package:macro_cal_public/miscellaneous/images.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/models/ingredient.dart';
import 'package:macro_cal_public/pages/create_ingredient_page.dart';
import 'package:macro_cal_public/pages/food_metric_detail_page.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart' as storage;
import 'package:macro_cal_public/themes/app_colors.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:macro_cal_public/wrappers/dismiss_page.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

class IngredientDetailsPage extends StatefulWidget {
  final int ingredientIndex;
  final Function stateManipulationCallback;

  const IngredientDetailsPage({
    super.key,
    required this.ingredientIndex,
    required this.stateManipulationCallback,
  });

  @override
  State<IngredientDetailsPage> createState() => _IngredientDetailsPageState();
}

class _IngredientDetailsPageState extends State<IngredientDetailsPage> {
  void rebuildPageCallback() {
    setState(() {});
  }

  /// returns the specific Ingredient that matches the given index and is used within the argument passing
  /// of macroDisplayItem to distinguish the value of a specific macro of that ingredient
  Ingredient ingredientOfGivenIndex() =>
      dataController.ingredientsList[widget.ingredientIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.ingredientDetailsTitle,
          style: appBarStyle(),
        ),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      ),
      body: PageDismissWraper(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ingredientNamingBorder(
                ingredientOfGivenIndex().ingridientName ?? '',
                ingredientOfGivenIndex().category ?? '',
                ingredientOfGivenIndex().referenceQuantity ?? 100.0,
              ),
              Expanded(
                child: ListView(children: [
                  macroDisplayItem(
                    context,
                    caloriesSvgPath,
                    ingredientOfGivenIndex().calories,
                    context.l10n.ingredientDetailsNutrientsCalories,
                    context.l10n.ingredientDetailsNutrientDescriptionsCalories,
                  ),
                  macroDisplayItem(
                    context,
                    oliveSvgPath,
                    ingredientOfGivenIndex().fats,
                    context.l10n.ingredientDetailsNutrientsFat,
                    context.l10n.ingredientDetailsNutrientDescriptionsFat,
                  ),
                  macroDisplayItem(
                      context,
                      saturatedSvgPath,
                      ingredientOfGivenIndex().saturated,
                      context.l10n.ingredientDetailsNutrientsSaturated,
                      context.l10n.ingredientDetailsNutrientDescriptionsSaturated,
                      healthEffect: HealthEffects.hazardous),
                  macroDisplayItem(
                    context,
                    carbsSvgPath,
                    ingredientOfGivenIndex().carbohydrates,
                    context.l10n.ingredientDetailsNutrientsCarbs,
                    context.l10n.ingredientDetailsNutrientDescriptionsCarbs,
                  ),
                  macroDisplayItem(
                      context,
                      sugarSvgPath,
                      ingredientOfGivenIndex().sugars,
                      context.l10n.ingredientDetailsNutrientsSugars,
                      context.l10n.ingredientDetailsNutrientDescriptionsSugars,
                      healthEffect: HealthEffects.hazardous),
                  macroDisplayItem(
                      context,
                      saladSvgPath,
                      ingredientOfGivenIndex().fiber,
                      context.l10n.ingredientDetailsNutrientsFiber,
                      context.l10n.ingredientDetailsNutrientDescriptionsFiber,
                      healthEffect: HealthEffects.benefitial),
                  macroDisplayItem(
                      context,
                      proteinSvgPath,
                      ingredientOfGivenIndex().proteins,
                      context.l10n.ingredientDetailsNutrientsProtein,
                      context.l10n.ingredientDetailsNutrientDescriptionsProtein,
                      healthEffect: HealthEffects.benefitial),
                  macroDisplayItem(
                      context,
                      saltSvgPath,
                      ingredientOfGivenIndex().salt,
                      context.l10n.ingredientDetailsNutrientsSalt,
                      context.l10n.ingredientDetailsNutrientDescriptionsSalt,
                      healthEffect: HealthEffects.hazardous),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: bottomSideActionBar(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding ingredientNamingBorder(
    String ingredientName,
    String categoryName,
    double referenceQuantity,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 12.0),
      child: Container(
        width: double.maxFinite,
        decoration: BoxDecoration(
            border:
                Border.all(color: AppThemes.darkTheme.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            heightSpacer(10),
            Text(
              ingredientName,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            heightSpacer(10),
            Text(
              '${context.l10n.ingredientDetailsInfoBoard} ${referenceQuantity.toInt()} ${context.l10n.unitGramsShort}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange.shade300),
            ),
            heightSpacer(10),
          ],
        ),
      ),
    );
  }

  Column macroDisplayItem(BuildContext context, String svgPath,
      dynamic displayValue, String metricName, String metricDescription,
      {HealthEffects healthEffect = HealthEffects.neutral}) {
    return Column(
      children: [
        heightSpacer(12),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FoodMetricDetailsPage(
                  title: metricName,
                  svgPath: svgPath,
                  metricDescription: metricDescription,
                ),
              ),
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Hero(
                    tag: 'ICON$svgPath',
                    child: SvgPicture.asset(
                      svgPath,
                      width: 40,
                      height: 40,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    metricName,
                    style: TextStyle(
                        color: healthEffect == HealthEffects.hazardous
                            ? Colors.red.shade300
                            : ((healthEffect == HealthEffects.benefitial)
                                ? Colors.green.shade300
                                : null),
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                (((displayValue ?? '') is String)
                    ? (displayValue ?? '')
                    : (displayValue as double).toString()),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: healthEffect == HealthEffects.hazardous
                      ? Colors.red.shade300
                      : ((healthEffect == HealthEffects.benefitial)
                          ? Colors.green.shade300
                          : null),
                ),
              ),
            ],
          ),
        ),
        heightSpacer(12),
      ],
    );
  }

  Row bottomSideActionBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              _showPopupDialog(context);
            },
            child: Text(
              context.l10n.ingredientDetailsButtonSideActionsDeleteButton,
              style: const TextStyle(color: AppColors.redAccent),
            )),
        const SizedBox(
          width: 24,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateOrEditIngredientPage(
                    isEdit: true,
                    rebuildIngredientsDetailsPage: rebuildPageCallback,
                    rebuildIngredientsPage: widget.stateManipulationCallback,
                    itemIndex: widget.ingredientIndex,
                  ),
                ),
              );
            },
            child: Text(
                '  ${context.l10n.ingredientDetailsButtonSideActionsEditButton}  '))
      ],
    );
  }

  void _showPopupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.l10n.ingredientDetailsDeleteDialogTitle),
          content: Text(context.l10n.ingredientDetailsDeleteDialogBody),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                context.l10n.ingredientDetailsDeleteDialogCancel,
                style: const TextStyle(color: AppColors.redAccent),
              ),
            ),
            TextButton(
              onPressed: () {
                dataController.ingredientsList.removeAt(widget.ingredientIndex);
                dataController.ingredientQuantitiesList
                    .removeAt(widget.ingredientIndex);
                dataController.update();
                populateConsumptionVariables();
                widget.stateManipulationCallback();
                storage.globalDataSave();
                Navigator.of(context).pop();
                Navigator.pop(context);
              },
              child: Text(
                context.l10n.ingredientDetailsDeleteDialogConfirm,
              ),
            ),
          ],
        );
      },
    );
  }
}
