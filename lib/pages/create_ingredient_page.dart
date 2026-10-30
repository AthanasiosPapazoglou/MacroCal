import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:macro_cal_public/components/barcode_scanner.dart';
import 'package:macro_cal_public/miscellaneous/snackbars.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/models/ingredient.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart' as storage;
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:http/http.dart' as http;
import 'package:macro_cal_public/miscellaneous/locale_consts.dart';

class CreateOrEditIngredientPage extends StatefulWidget {
  const CreateOrEditIngredientPage(
      {super.key,
      required this.rebuildIngredientsPage,
      required this.rebuildIngredientsDetailsPage,
      required this.isEdit,
      this.itemIndex});

  final Function rebuildIngredientsPage;
  final Function rebuildIngredientsDetailsPage;
  final bool isEdit;
  final int? itemIndex;

  @override
  State<CreateOrEditIngredientPage> createState() =>
      _CreateOrEditIngredientPageState();
}

class _CreateOrEditIngredientPageState
    extends State<CreateOrEditIngredientPage> {
  final _formKey = GlobalKey<FormState>();
  final List<FocusNode> _focusNodes =
      List<FocusNode>.generate(11, (index) => FocusNode());
  final List<TextEditingController> _textControllers =
      List<TextEditingController>.generate(
          11, (index) => TextEditingController());

  Map<String, dynamic> resultData = {};

  Future<Map<String, dynamic>?> fetchProductData(String barcode) async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://world.openfoodfacts.org/api/v2/product/${Uri.encodeComponent(barcode)}'),
      );
      if (response.statusCode != 200) return null;
      final Map<String, dynamic> data = json.decode(response.body);
      return (data['status'] == 1 && data['product'] is Map) ? data : null;
    } catch (_) {
      return null;
    }
  }

  Future<void> scanProduct() async {
    final String? barcode = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const BarcodeScannerPage()),
    );
    if (barcode == null || !mounted) return;

    final Map<String, dynamic>? data = await fetchProductData(barcode);
    if (!mounted) return;
    if (data == null) {
      showErrorSnackBar(context);
      return;
    }
    resultData = data;
    assignDataFromScan();
    showSuccessSnackBar(context);
  }

  void assignDataFromScan() {
    setState(() {
      _textControllers[1].text = getProductName();
      _textControllers[3].text = getValueOfMetric('energy-kcal_100g');
      _textControllers[4].text = getValueOfMetric('fat_100g');
      _textControllers[5].text = getValueOfMetric('saturated-fat_100g');
      _textControllers[6].text = getValueOfMetric('carbohydrates_100g');
      _textControllers[7].text = getValueOfMetric('sugars_100g');
      _textControllers[8].text = getValueOfMetric('fiber_100g');
      _textControllers[9].text = getValueOfMetric('proteins_100g');
      _textControllers[10].text = getValueOfMetric('sodium_100g');
    });
  }

  String getValueOfMetric(String metricJsonKey) =>
      '${resultData['product']['nutriments']?[metricJsonKey] ?? '0.0'}';

  String getProductName() => '${resultData['product']['product_name'] ?? ''}';

  void prePopulateTextfields() {
    if (widget.isEdit) {
      _textControllers[0].text = dataController
          .ingredientsList[widget.itemIndex!].referenceQuantity!
          .toString();
      _textControllers[1].text =
          dataController.ingredientsList[widget.itemIndex!].ingridientName!;
      _textControllers[2].text =
          dataController.ingredientsList[widget.itemIndex!].category!;
      _textControllers[3].text =
          dataController.ingredientsList[widget.itemIndex!].calories.toString();
      _textControllers[4].text =
          dataController.ingredientsList[widget.itemIndex!].fats.toString();
      _textControllers[5].text = dataController
          .ingredientsList[widget.itemIndex!].saturated
          .toString();
      _textControllers[6].text = dataController
          .ingredientsList[widget.itemIndex!].carbohydrates
          .toString();
      _textControllers[7].text =
          dataController.ingredientsList[widget.itemIndex!].sugars.toString();
      _textControllers[8].text =
          dataController.ingredientsList[widget.itemIndex!].fiber.toString();
      _textControllers[9].text =
          dataController.ingredientsList[widget.itemIndex!].proteins.toString();
      _textControllers[10].text =
          (dataController.ingredientsList[widget.itemIndex!].salt! * 0.001)
              .toString();
    }
  }

  dynamic textfieldValidatedValue(bool isNumeric, int controllerIndex) {
    RegExp numericRegex = RegExp(r'^[0-9]*(\.[0-9]*)?$');

    if (isNumeric) {
      return (numericRegex.hasMatch(_textControllers[controllerIndex].text) &&
              _textControllers[controllerIndex].text != '')
          ? (controllerIndex != 10)
              ? double.tryParse(_textControllers[controllerIndex].text)
              : (double.tryParse(_textControllers[controllerIndex].text)! *
                  1000)
          : 0.0;
    } else {
      if (controllerIndex == 1 &&
          (_textControllers[controllerIndex].text == '')) {
        return 'ERROR UNAMED PRODUCT';
      } else if (controllerIndex == 2 &&
          _textControllers[controllerIndex].text == '') {
        return 'Uncategorised';
      } else {
        return _textControllers[controllerIndex].text;
      }
    }
  }

  void saveIngredientChanges() {
    if (widget.isEdit) {
      dataController.ingredientsList[widget.itemIndex!].referenceQuantity =
          textfieldValidatedValue(true, 0);
      dataController.ingredientsList[widget.itemIndex!].ingridientName =
          textfieldValidatedValue(false, 1);
      dataController.ingredientsList[widget.itemIndex!].category =
          textfieldValidatedValue(false, 2);
      dataController.ingredientsList[widget.itemIndex!].calories =
          textfieldValidatedValue(true, 3);
      dataController.ingredientsList[widget.itemIndex!].fats =
          textfieldValidatedValue(true, 4);
      dataController.ingredientsList[widget.itemIndex!].saturated =
          textfieldValidatedValue(true, 5);
      dataController.ingredientsList[widget.itemIndex!].carbohydrates =
          textfieldValidatedValue(true, 6);
      dataController.ingredientsList[widget.itemIndex!].sugars =
          textfieldValidatedValue(true, 7);
      dataController.ingredientsList[widget.itemIndex!].fiber =
          textfieldValidatedValue(true, 8);
      dataController.ingredientsList[widget.itemIndex!].proteins =
          textfieldValidatedValue(true, 9);
      dataController.ingredientsList[widget.itemIndex!].salt =
          textfieldValidatedValue(true, 10);
    } else {
      dataController.ingredientsList.add(
        Ingredient(
          referenceQuantity: textfieldValidatedValue(true, 0),
          ingridientName: textfieldValidatedValue(false, 1),
          category: textfieldValidatedValue(false, 2),
          calories: textfieldValidatedValue(true, 3),
          fats: textfieldValidatedValue(true, 4),
          saturated: textfieldValidatedValue(true, 5),
          carbohydrates: textfieldValidatedValue(true, 6),
          sugars: textfieldValidatedValue(true, 7),
          fiber: textfieldValidatedValue(true, 8),
          proteins: textfieldValidatedValue(true, 9),
          salt: textfieldValidatedValue(true, 10),
        ),
      );
      dataController.ingredientQuantitiesList.add(0);
    }
  }

  @override
  void initState() {
    _textControllers[0].text = '100';
    _textControllers[2].text = 'Uncategorised';
    prePopulateTextfields();
    super.initState();
  }

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    for (var controller in _textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEdit
              ? LocaleConsts.ingredientsPageTitlesEdit.tr()
              : LocaleConsts.ingredientsPageTitlesAdd.tr(),
          style: appBarStyle(),
        ),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
        actions: [
          if (!widget.isEdit)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ElevatedButton(
                  onPressed: scanProduct,
                  child: const Icon(Icons.qr_code_scanner_rounded)),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            MacronutrientScrollableForm(),
            SaveButton(context)
          ],
        ),
      ),
    );
  }

  Expanded MacronutrientScrollableForm() {
    return Expanded(
      child: Form(
        key: _formKey,
        child: ListView.builder(
          itemCount: 11,
          itemBuilder: (context, index) {
            return TextfieldItem(index);
          },
        ),
      ),
    );
  }

  Widget TextfieldItem(int index) {
    const borderRadius = BorderRadius.all(Radius.circular(12));
    final borderSide = BorderSide(color: Colors.green.shade500, width: 1.5);

    const textfieldLabels = [
      LocaleConsts.ingredientsPageLabels0,
      LocaleConsts.ingredientsPageLabels1,
      LocaleConsts.ingredientsPageLabels2,
      LocaleConsts.ingredientsPageLabels3,
      LocaleConsts.ingredientsPageLabels4,
      LocaleConsts.ingredientsPageLabels5,
      LocaleConsts.ingredientsPageLabels6,
      LocaleConsts.ingredientsPageLabels7,
      LocaleConsts.ingredientsPageLabels8,
      LocaleConsts.ingredientsPageLabels9,
      LocaleConsts.ingredientsPageLabels10,
    ];

    const textfieldHints = [
      LocaleConsts.ingredientsPageHints0,
      LocaleConsts.ingredientsPageHints1,
      LocaleConsts.ingredientsPageHints2,
      LocaleConsts.ingredientsPageHints3,
      LocaleConsts.ingredientsPageHints4,
      LocaleConsts.ingredientsPageHints5,
      LocaleConsts.ingredientsPageHints6,
      LocaleConsts.ingredientsPageHints7,
      LocaleConsts.ingredientsPageHints8,
      LocaleConsts.ingredientsPageHints9,
      LocaleConsts.ingredientsPageHints10,
    ];

    return Column(
      children: [
        heightSpacer(12),
        TextFormField(
          keyboardType:
              (index != 1 && index != 2) ? TextInputType.number : null,
          controller: _textControllers[index],
          focusNode: _focusNodes[index],
          onFieldSubmitted: (value) {
            if (index < _focusNodes.length - 1) {
              _focusNodes[index + 1].requestFocus();
            } else {
              _formKey.currentState!.validate();
            }
          },
          decoration: InputDecoration(
            floatingLabelAlignment: FloatingLabelAlignment.center,
            labelText: textfieldLabels[index].tr(),
            hintText: textfieldHints[index].tr(),
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: borderSide,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: borderSide.copyWith(width: 2.5),
            ),
            border: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: borderSide,
            ),
          ),
        ),
        heightSpacer(12),
      ],
    );
  }

  Padding SaveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ElevatedButton(
        onPressed: () {
          saveIngredientChanges();
          widget.rebuildIngredientsPage();
          widget.rebuildIngredientsDetailsPage();
          populateConsumptionVariables();
          dataController.update();
          storage.globalDataSave();
          Navigator.pop(context);
        },
        child:
            Text(LocaleConsts.ingredientsPageBottomSideActionsSaveButton.tr()),
      ),
    );
  }

  void showSuccessSnackBar(BuildContext context) {
    final snackBar = kProductFoundSnackbar;
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorSnackBar(BuildContext context) {
    final snackBar = kNoProductFoundSnackbar;
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
