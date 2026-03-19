import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:macro_cal_public/miscellaneous/appbars.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart' as storage;
import 'package:macro_cal_public/themes/app_colors.dart';
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

  saveProfileData() {
    dataController.dailyCalories.value =
        double.tryParse(_textControllers[0].text) ?? 0.0;
    dataController.dailyProteins.value =
        double.tryParse(_textControllers[1].text) ?? 0.0;
    dataController.dailyFiber.value =
        double.tryParse(_textControllers[2].text) ?? 0.0;
    dataController.sugarsLimit.value =
        double.tryParse(_textControllers[3].text) ?? 0.0;
    dataController.saturatedLimit.value =
        double.tryParse(_textControllers[4].text) ?? 0.0;
    dataController.sodiumLimit.value =
        double.tryParse(_textControllers[5].text) ?? 0.0;
    dataController.bodyWeight.value =
        double.tryParse(_textControllers[6].text) ?? 0.0;
    dataController.bodyHeight.value =
        double.tryParse(_textControllers[7].text) ?? 0.0;
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
      appBar: const MajorPageAppBar(
        title: 'Profile',
      ),
      endDrawer: const SettingsDrawer(),
      backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ProfileScrollableForm(),
            SaveButton(context),
          ],
        ),
      ),
    );
  }

  Expanded ProfileScrollableForm() {
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
        child: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            const borderRadius = BorderRadius.all(Radius.circular(12));
            final borderSide = BorderSide(color: Colors.green.shade500, width: 1.5);
            return Column(
              children: [
                heightSpacer(12),
                TextFormField(
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
          },
        ),
      ),
    );
  }

  Padding SaveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: ElevatedButton(
          onPressed: () {
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
