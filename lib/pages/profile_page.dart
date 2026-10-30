import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/appbars.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart' as storage;
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:macro_cal_public/miscellaneous/locale_consts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final List<FocusNode> _focusNodes =
      List<FocusNode>.generate(8, (index) => FocusNode());
  final List<TextEditingController> _textControllers =
      List<TextEditingController>.generate(
          8, (index) => TextEditingController());

  prePopulateTextFields() {
    _textControllers[0].text = dataController.dailyCalories.value.toString();
    _textControllers[1].text = dataController.dailyProteins.value.toString();
    _textControllers[2].text = dataController.dailyFiber.value.toString();
    _textControllers[3].text = dataController.sugarsLimit.value.toString();
    _textControllers[4].text = dataController.saturatedLimit.value.toString();
    _textControllers[5].text = dataController.sodiumLimit.value.toString();
    _textControllers[6].text = dataController.bodyWeight.value.toString();
    _textControllers[7].text = dataController.bodyHeight.value.toString();
  }

  double? parseProfileValue(String text) {
    final double? value = double.tryParse(text.trim().replaceAll(',', '.'));
    return (value == null || !value.isFinite || value < 0) ? null : value;
  }

  saveProfileData() {
    final List<double> values = [
      for (final controller in _textControllers)
        parseProfileValue(controller.text)!
    ];
    dataController.dailyCalories.value = values[0];
    dataController.dailyProteins.value = values[1];
    dataController.dailyFiber.value = values[2];
    dataController.sugarsLimit.value = values[3];
    dataController.saturatedLimit.value = values[4];
    dataController.sodiumLimit.value = values[5];
    dataController.bodyWeight.value = values[6];
    dataController.bodyHeight.value = values[7];
    calculateAdjustedCalories();
  }

  @override
  void initState() {
    prePopulateTextFields();
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
      appBar: MajorPageAppBar(
        title: LocaleConsts.profilePageTitle.tr(),
      ),
      endDrawer: const SettingsDrawer(),
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            profileScrollableForm(),
            saveButton(context),
          ],
        ),
      ),
    );
  }

  Expanded profileScrollableForm() {
    const textfieldLabels = [
      LocaleConsts.profilePageLabels0,
      LocaleConsts.profilePageLabels1,
      LocaleConsts.profilePageLabels2,
      LocaleConsts.profilePageLabels3,
      LocaleConsts.profilePageLabels4,
      LocaleConsts.profilePageLabels5,
      LocaleConsts.profilePageLabels6,
      LocaleConsts.profilePageLabels7,
    ];

    return Expanded(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(8, (index) {
              const borderRadius = BorderRadius.all(Radius.circular(12));
              final borderSide =
                  BorderSide(color: Colors.green.shade500, width: 1.5);
              return Column(
                children: [
                  heightSpacer(12),
                  TextFormField(
                    controller: _textControllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    validator: (value) => parseProfileValue(value ?? '') == null
                        ? LocaleConsts.profilePageInvalidNumber.tr()
                        : null,
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
            }),
          ),
        ),
      ),
    );
  }

  Padding saveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ElevatedButton(
          onPressed: () {
            if (!_formKey.currentState!.validate()) return;
            final tabController = DefaultTabController.of(context);
            saveProfileData();
            dataController.update();
            storage.globalDataSave();
            tabController.animateTo(0);
          },
          child:
              Text(LocaleConsts.profilePageButtonSideActionsSaveButton.tr())),
    );
  }
}
