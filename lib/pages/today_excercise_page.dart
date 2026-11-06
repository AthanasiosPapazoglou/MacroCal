import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart' as storage;
import 'package:macro_cal_public/themes/app_colors.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

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
          context.l10n.activitiesPageTitle,
          style: appBarStyle(),
        ),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          activitiesListView(),
          bottomSideActionButtons(context),
          const SizedBox(
            height: 32,
          )
        ],
      ),
    );
  }

  Expanded activitiesListView() {
    return Expanded(
      child: ListView.builder(
          itemCount: totalExcerciseActivities(),
          itemBuilder: (BuildContext ctx, int index) {
            return activityItem(index);
          }),
    );
  }

  Padding activityItem(int index) {
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
                translateDefaultText(context.l10n, 
                    dataController.activitiesList[index].activityName ?? ''),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Text(
                  translateDefaultText(context.l10n, 
                      dataController.activitiesList[index].metricDescription ??
                          ''),
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

  Row bottomSideActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            _showPopupDialog();
          },
          child: Text(
            context.l10n.activitiesPageBottomActionBarResetValues,
            style: const TextStyle(color: AppColors.orange),
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        ElevatedButton(
            onPressed: () {
              dataController.update();
              storage.globalDataSave();
              Navigator.pop(context);
            },
            child: Text(
              context.l10n.activitiesPageBottomActionBarSaveChanges,
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
          title: Text(context.l10n.activitiesPageResetValuesDialogTitle),
          content: Text(context.l10n.activitiesPageResetValuesDialogBody),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                context.l10n.activitiesPageResetValuesDialogCancel,
              ),
            ),
            TextButton(
              onPressed: () {
                resetActivityVolumesList();
                dataController.update();
                storage.globalDataSave();
                for (final controller in _controllers) {
                  controller.text = '0';
                }
                Navigator.of(context).pop();
              },
              child: Text(
                context.l10n.activitiesPageResetValuesDialogConfirm,
                style:
                    const TextStyle(color: AppColors.confirmationButtonsColor),
              ),
            ),
          ],
        );
      },
    );
  }
}
