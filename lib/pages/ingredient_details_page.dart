import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' hide Trans;
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
import 'package:macro_cal_public/miscellaneous/locale_consts.dart';

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
  final DataController dataController = Get.find();

  void rebuildPageCallback() {
    setState(() {});
  }

  /// returns the specific Ingredient that matches the given index and is used within the argument passing
  /// of MacroDisplayItem to distinguish the value of a specific macro of that ingredient
  Ingredient IngredientOfGivenIndex() =>
      dataController.ingredientsList[widget.ingredientIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleConsts.ingredientDetailsTitle.tr(),
          style: appBarStyle(),
        ),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      ),
      body: PageDismissWraper(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              IngredientNamingBorder(
                IngredientOfGivenIndex().ingridientName ?? '',
                IngredientOfGivenIndex().category ?? '',
                IngredientOfGivenIndex().referenceQuantity ?? 100.0,
              ),
              Expanded(
                child: ListView(children: [
                  MacroDisplayItem(
                    context,
                    caloriesSvgPath,
                    IngredientOfGivenIndex().calories,
                    LocaleConsts.ingredientDetailsNutrientsCalories.tr(),
                    LocaleConsts.ingredientDetailsNutrientDescriptionsCalories.tr(),
                  ),
                  MacroDisplayItem(
                    context,
                    oliveSvgPath,
                    IngredientOfGivenIndex().fats,
                    LocaleConsts.ingredientDetailsNutrientsFat.tr(),
                    LocaleConsts.ingredientDetailsNutrientDescriptionsFat.tr(),
                  ),
                  MacroDisplayItem(
                      context,
                      saturatedSvgPath,
                      IngredientOfGivenIndex().saturated,
                      LocaleConsts.ingredientDetailsNutrientsSaturated.tr(),
                      LocaleConsts.ingredientDetailsNutrientDescriptionsSaturated.tr(),
                      healthEffect: HealthEffects.hazardous),
                  MacroDisplayItem(
                    context,
                    carbsSvgPath,
                    IngredientOfGivenIndex().carbohydrates,
                    LocaleConsts.ingredientDetailsNutrientsCarbs.tr(),
                    LocaleConsts.ingredientDetailsNutrientDescriptionsCarbs.tr(),
                  ),
                  MacroDisplayItem(
                      context,
                      sugarSvgPath,
                      IngredientOfGivenIndex().sugars,
                      LocaleConsts.ingredientDetailsNutrientsSugars.tr(),
                      LocaleConsts.ingredientDetailsNutrientDescriptionsSugars.tr(),
                      healthEffect: HealthEffects.hazardous),
                  MacroDisplayItem(
                      context,
                      saladSvgPath,
                      IngredientOfGivenIndex().fiber,
                      LocaleConsts.ingredientDetailsNutrientsFiber.tr(),
                      LocaleConsts.ingredientDetailsNutrientDescriptionsFiber.tr(),
                      healthEffect: HealthEffects.benefitial),
                  MacroDisplayItem(
                      context,
                      proteinSvgPath,
                      IngredientOfGivenIndex().proteins,
                      LocaleConsts.ingredientDetailsNutrientsProtein.tr(),
                      LocaleConsts.ingredientDetailsNutrientDescriptionsProtein.tr(),
                      healthEffect: HealthEffects.benefitial),
                  MacroDisplayItem(
                      context,
                      saltSvgPath,
                      IngredientOfGivenIndex().salt,
                      LocaleConsts.ingredientDetailsNutrientsSalt.tr(),
                      LocaleConsts.ingredientDetailsNutrientDescriptionsSalt.tr(),
                      healthEffect: HealthEffects.hazardous),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: BottomSideActionBar(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding IngredientNamingBorder(
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
            Container(
              child: Text(
                ingredientName,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            heightSpacer(10),
            Text(
              '${LocaleConsts.ingredientDetailsInfoBoard.tr()} ${referenceQuantity.toInt()} gr.',
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

  Column MacroDisplayItem(BuildContext context, String svgPath,
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
          child: Container(
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
        ),
        heightSpacer(12),
      ],
    );
  }

  Row BottomSideActionBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              _showPopupDialog(context);
            },
            child: Text(
              LocaleConsts.ingredientDetailsButtonSideActionsDeleteButton.tr(),
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
                '  ${LocaleConsts.ingredientDetailsButtonSideActionsEditButton.tr()}  '))
      ],
    );
  }

  void _showPopupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(LocaleConsts.ingredientDetailsDeleteDialogTitle.tr()),
          content: Text(LocaleConsts.ingredientDetailsDeleteDialogBody.tr()),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                LocaleConsts.ingredientDetailsDeleteDialogCancel.tr(),
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
                LocaleConsts.ingredientDetailsDeleteDialogConfirm.tr(),
              ),
            ),
          ],
        );
      },
    );
  }
}
