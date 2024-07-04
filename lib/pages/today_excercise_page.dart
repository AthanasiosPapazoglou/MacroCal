import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart' as storage;
import 'package:macro_cal_public/themes/app_colors.dart';
import 'package:macro_cal_public/themes/app_themes.dart';

class TodayExcercise extends StatefulWidget {
  const TodayExcercise({super.key});

  @override
  State<TodayExcercise> createState() => _TodayExcerciseState();
}

class _TodayExcerciseState extends State<TodayExcercise> {
  late int maxLength;
  late List<TextEditingController> _controllers;
  final DataController dataController = Get.find();
  int ingredientListIndex = 0;
  int ingredientListNestedIndex = 0;

  int totalExcerciseActivities() {
    int total = 0;
    for (var element in dataController.activitiesList) {
      total++;
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    maxLength = totalExcerciseActivities();
    _controllers = List.generate(
        totalExcerciseActivities(), (_) => TextEditingController());
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].text = dataController.activitiyVolumesList[i].toString();
    }
    for (var controller in _controllers) {
      controller.addListener(() {
        if (controller.text.length > 4) {
          controller.text = controller.text.substring(0, 4);
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        }
      });
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
          tr('activities_page.title'),
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

  ///Scrollable list of available activies to be registered by volume of excercise
  Expanded ActivitiesList() {
    return Expanded(
      child: ListView.builder(
          itemCount: totalExcerciseActivities(),
          itemBuilder: (BuildContext ctx, int index) {
            return ActivityItem(index);
          }),
    );
  }

  ///Graphical element representing a specific activity entity, these are rendered within the ActivitiesList
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

  /// Action buttons row at the bottom side of the page Reset/Save values
  Row BottomSideActionButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            _showPopupDialog();
          },
          child: Text(
            tr('activities_page.bottom_action_bar.reset_values'),
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
              tr('activities_page.bottom_action_bar.save_changes'),
            )),
      ],
    );
  }

  ///Popup dialog used as confirmation for reseting the volumes of all activities
  void _showPopupDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tr('activities_page.reset_values_dialog.title')),
          content: Text(tr('activities_page.reset_values_dialog.body')),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                tr('activities_page.reset_values_dialog.cancel'),
                style: const TextStyle(color: AppColors.redAccent),
              ),
            ),
            TextButton(
              onPressed: () {
                resetActivityVolumesList();
                calculateAdjustedCalories();
                dataController.update();
                storage.globalDataSave();
                Navigator.of(context).pop();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TodayExcercise(),
                  ),
                );
              },
              child: Text(tr('activities_page.reset_values_dialog.confirm')),
            ),
          ],
        );
      },
    );
  }
}
