import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:macro_cal_public/components/barcode_scanner.dart';
import 'package:macro_cal_public/miscellaneous/snackbars.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/models/ingredient.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart' as storage;
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:http/http.dart' as http;

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
  //-- Textfield Variables
  final _formKey = GlobalKey<FormState>();
  final List<FocusNode> _focusNodes =
      List<FocusNode>.generate(11, (index) => FocusNode());
  final List<TextEditingController> _textControllers =
      List<TextEditingController>.generate(
          11, (index) => TextEditingController());

  //-- Barcode Variables
  String _scanBarcode = '';
  Map<String, dynamic> resultData = {};

  /// Opens Scan page and performs scanning progress
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  /// Fetches json data from OpenFoodFacts API, corresponding to the product code
  Future<Map<String, dynamic>> fetchProductData(
      BuildContext pageContext, String barcode) async {
    final response = await http.get(
      Uri.parse('https://world.openfoodfacts.org/api/v2/search?code=$barcode'),
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      (data['products'].length != 0)
          ? showSuccessSnackBar(pageContext)
          : showErrorSnackBar(pageContext);
      return data;
    } else {
      showErrorSnackBar(pageContext);
      throw Exception('Failed to fetch product data');
    }
  }

  /// Populates textfields with the data fetched from the barcode scan (if product exists in the database and was fetched successfully)
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

  /// Returns specific field value from the fetched json data
  String getValueOfMetric(String metricJsonKey) =>
      '${(resultData['products'][0]['nutriments'][metricJsonKey] == null) ? '0.0' : resultData['products'][0]['nutriments'][metricJsonKey]}';

  /// Returns the name of the product that was fetched from the scan
  String getProductName() => '${(resultData['products'][0]['product_name'])}';

  /// If the user is editing a product, it populates the textfields with the values that are assigned to the product.
  /// If the user is creating a product, it does nothing
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

  /// Validates User's textfield entry, filters and returns the result
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

  /// Saves Data when the save button is pressed
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
    final DataController dataController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isEdit
              ? tr('ingredients_page.titles.edit')
              : tr('ingredients_page.titles.add'),
          style: appBarStyle(),
        ),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
        actions: [
          if (!widget.isEdit)
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: ElevatedButton(
                  onPressed: () async {
                    await scanBarcodeNormal();
                    resultData = await fetchProductData(context, _scanBarcode);
                    assignDataFromScan();
                  },
                  child: const Icon(Icons.qr_code_scanner_rounded)),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            MacronutrientScrollableForm(),
            SaveButton(dataController, context)
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
            labelText: tr('ingredients_page.labels.$index'),
            hintText: tr('ingredients_page.hints.$index'),
          ),
        ),
        heightSpacer(12),
      ],
    );
  }

  Padding SaveButton(DataController dataController, BuildContext context) {
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
        child: Text(tr('ingredients_page.bottom_side_actions.save_button')),
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
