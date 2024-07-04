import 'package:get_storage/get_storage.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:macro_cal_public/themes/app_colors.dart';
import 'package:macro_cal_public/themes/app_themes.dart';

class DateSelectionDialog extends StatefulWidget {
  const DateSelectionDialog({super.key});

  @override
  State<DateSelectionDialog> createState() => _DateSelectionDialogState();
}

class _DateSelectionDialogState extends State<DateSelectionDialog> {
  DateTime? selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.put(DataController());
    return AlertDialog(
      title: const Text(
        'Archive Day\'s Intake',
      ),
      content: SizedBox(
        height: 260,
        width: double.maxFinite,
        child: Column(
          children: [
            const Text(
              'Select the date that you wish your current intake to be registered to. Today\'s date is preselected by default. Press complete to finalise the registration process.',
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Selected Date'),
                ),
                InkWell(
                  onTap: () async {
                    selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                        lastDate: DateTime.now());
                    setState(() {});
                    print(selectedDate);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    width: double.maxFinite,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 2, color: AppThemes.darkTheme.primaryColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Archive For:',
                              style: TextStyle(
                                  color: AppThemes.darkTheme.primaryColor),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.calendar_month_rounded,
                              color: AppThemes.darkTheme.primaryColor,
                            ),
                          ],
                        ),
                        Text(
                          DateFormat('dd/MM/yyyy')
                              .format(selectedDate ?? DateTime.now()),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppThemes.darkTheme.primaryColor),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      (isSelectedDatepopulatedChecker(
                              selectedDate)['isPopulated'])
                          ? Icons.warning_amber_rounded
                          : Icons.check_circle_outline_rounded,
                      color: (isSelectedDatepopulatedChecker(
                              selectedDate)['isPopulated'])
                          ? AppColors.orange
                          : AppColors.green,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SizedBox(
                      width: 240,
                      child: Text(
                        (isSelectedDatepopulatedChecker(
                                selectedDate)['isPopulated'])
                            ? 'Measurement already exists for the selected date. \'Complete\' will overwrite it.'
                            : 'Selected Date has no previous Measurement assigned.',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 11,
                            color: (isSelectedDatepopulatedChecker(
                                    selectedDate)['isPopulated'])
                                ? AppColors.orange
                                : AppColors.green),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: AppColors.redAccent),
          ),
        ),
        TextButton(
          onPressed: () {
            print(
                'controller pre: ${dataController.historicalMeasurementsList}');
            print(
                'storage pre: ${GetStorage().read('historicalMeasurementList')}');
            registerHistoricalMeasurement(selectedDate);
            resetIngredientQuantitiesList();
            populateConsumptionVariables();
            resetActivityVolumesList();
            calculateAdjustedCalories();
            dataController.update();
            storage.globalDataSave();
            print(
                ('controller post: ${dataController.historicalMeasurementsList}'));
            print(
                'storage post: ${GetStorage().read('historicalMeasurementList')}');
            Navigator.of(context).pop();
          },
          child: Text(
            'Complete',
            style: TextStyle(color: AppThemes.darkTheme.primaryColor),
          ),
        ),
      ],
    );
  }
}
