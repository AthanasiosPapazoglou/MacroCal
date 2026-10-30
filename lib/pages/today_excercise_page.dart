import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart' as storage;
import 'package:macro_cal_public/themes/app_colors.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:macro_cal_public/miscellaneous/locale_consts.dart';

class TodayExcercise extends StatefulWidget {
  const TodayExcercise({super.key});

  @override
  State<TodayExcercise> createState() => _TodayExcerciseState();
}

class _TodayExcerciseState extends State<TodayExcercise> {
  late List<TextEditingController> _controllers;

  int totalExcerciseActivities() => dataController.activitiesList.length;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
        totalExcerciseActivities(), (_) => TextEditingController());
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].text = dataController.activitiyVolumesList[i].toString();
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleConsts.activitiesPageTitle.tr(),
          style: appBarStyle(),
        ),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          ActivitiesList(),
          BottomSideActionButtons(context),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }

  Expanded ActivitiesList() {
    return Expanded(
      child: ListView.builder(
          itemCount: totalExcerciseActivities(),
          itemBuilder: (BuildContext ctx, int index) {
            return ActivityItem(index);
          }),
    );
  }

  Padding ActivityItem(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Container(
        width: double.maxFinite,
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: AppThemes.darkTheme.primaryColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                dataController.activitiesList[index].activityName ?? '',
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Text(
                  dataController.activitiesList[index].metricDescription ?? '',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Container(
                    height: 48,
                    width: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (value) {
                          dataController.activitiyVolumesList[index] =
                              int.tryParse(value) ?? 0;
                        },
                        controller: _controllers[index],
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hoverColor: AppThemes.darkTheme.canvasColor,
                          fillColor: AppThemes.darkTheme.disabledColor,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Row BottomSideActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            _showPopupDialog();
          },
          child: Text(
            LocaleConsts.activitiesPageBottomActionBarResetValues.tr(),
            style: const TextStyle(color: AppColors.orange),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        ElevatedButton(
            onPressed: () {
              calculateAdjustedCalories();
              dataController.update();
              storage.globalDataSave();
              Navigator.pop(context);
            },
            child: Text(
              LocaleConsts.activitiesPageBottomActionBarSaveChanges.tr(),
              style: const TextStyle(color: AppColors.confirmationButtonsColor),
            )),
      ],
    );
  }

  void _showPopupDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(LocaleConsts.activitiesPageResetValuesDialogTitle.tr()),
          content: Text(LocaleConsts.activitiesPageResetValuesDialogBody.tr()),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                LocaleConsts.activitiesPageResetValuesDialogCancel.tr(),
              ),
            ),
            TextButton(
              onPressed: () {
                resetActivityVolumesList();
                calculateAdjustedCalories();
                dataController.update();
                storage.globalDataSave();
                for (final controller in _controllers) {
                  controller.text = '0';
                }
                Navigator.of(context).pop();
              },
              child: Text(LocaleConsts.activitiesPageResetValuesDialogConfirm.tr(), style: const TextStyle(color: AppColors.confirmationButtonsColor),),
            ),
          ],
        );
      },
    );
  }
}
