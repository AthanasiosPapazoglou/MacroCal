import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:macro_cal_public/miscellaneous/images.dart';
import 'package:macro_cal_public/miscellaneous/texts.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/models/ingredient.dart';
import 'package:macro_cal_public/pages/create_ingredient_page.dart';
import 'package:macro_cal_public/pages/food_metric_detail_page.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart' as storage;
import 'package:macro_cal_public/themes/app_colors.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:macro_cal_public/wrappers/dismiss_page.dart';

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
          tr('ingredient_details.title'),
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
                    tr('ingredient_details.nutrients.calories'),
                    tr('ingredient_details.nutrient_descriptions.calories'),
                  ),
                  MacroDisplayItem(
                    context,
                    oliveSvgPath,
                    IngredientOfGivenIndex().fats,
                    tr('ingredient_details.nutrients.fat'),
                    tr('ingredient_details.nutrient_descriptions.fat'),
                  ),
                  MacroDisplayItem(
                      context,
                      saturatedSvgPath,
                      IngredientOfGivenIndex().saturated,
                      tr('ingredient_details.nutrients.saturated'),
                      tr('ingredient_details.nutrient_descriptions.saturated'),
                      healthEffect: HealthEffects.hazardous),
                  MacroDisplayItem(
                    context,
                    carbsSvgPath,
                    IngredientOfGivenIndex().carbohydrates,
                    tr('ingredient_details.nutrients.carbs'),
                    tr('ingredient_details.nutrient_descriptions.carbs'),
                  ),
                  MacroDisplayItem(
                      context,
                      sugarSvgPath,
                      IngredientOfGivenIndex().sugars,
                      tr('ingredient_details.nutrients.sugars'),
                      tr('ingredient_details.nutrient_descriptions.sugars'),
                      healthEffect: HealthEffects.hazardous),
                  MacroDisplayItem(
                      context,
                      saladSvgPath,
                      IngredientOfGivenIndex().fiber,
                      tr('ingredient_details.nutrients.fiber'),
                      tr('ingredient_details.nutrient_descriptions.fiber'),
                      healthEffect: HealthEffects.benefitial),
                  MacroDisplayItem(
                      context,
                      proteinSvgPath,
                      IngredientOfGivenIndex().proteins,
                      tr('ingredient_details.nutrients.protein'),
                      tr('ingredient_details.nutrient_descriptions.protein'),
                      healthEffect: HealthEffects.benefitial),
                  MacroDisplayItem(
                      context,
                      saltSvgPath,
                      IngredientOfGivenIndex().salt,
                      tr('ingredient_details.nutrients.salt'),
                      tr('ingredient_details.nutrient_descriptions.salt'),
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
              '${tr('ingredient_details.info_board')} ${referenceQuantity.toInt()} gr.',
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
                    // Icon(icon),
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
              tr('ingredient_details.button_side_actions.delete_button'),
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
                '  ${tr('ingredient_details.button_side_actions.edit_button')}  '))
      ],
    );
  }

  void _showPopupDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tr('ingredient_details.delete_dialog.title')),
          content: Text(tr('ingredient_details.delete_dialog.body')),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                tr('ingredient_details.delete_dialog.cancel'),
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
                tr('ingredient_details.delete_dialog.confirm'),
              ),
            ),
          ],
        );
      },
    );
  }
}
