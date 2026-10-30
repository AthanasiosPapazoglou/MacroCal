import 'package:easy_localization/easy_localization.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/miscellaneous/locale_consts.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:macro_cal_public/themes/app_colors.dart';
import 'package:macro_cal_public/themes/app_themes.dart';

class DateSelectionDialog extends StatefulWidget {
  const DateSelectionDialog({super.key});

  @override
  State<DateSelectionDialog> createState() => _DateSelectionDialogState();
}

class _DateSelectionDialogState extends State<DateSelectionDialog> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final bool isDatePopulated = measurementIndexForDate(selectedDate) != -1;
    return AlertDialog(
      title: Text(LocaleConsts.archiveDialogTitle.tr()),
      content: SizedBox(
        height: 260,
        width: double.maxFinite,
        child: Column(
          children: [
            Text(
              LocaleConsts.archiveDialogBody.tr(),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(LocaleConsts.archiveDialogSelectedDate.tr()),
                ),
                InkWell(
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                        lastDate: DateTime.now());
                    if (pickedDate == null || !mounted) return;
                    setState(() => selectedDate = pickedDate);
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
                              LocaleConsts.archiveDialogArchiveFor.tr(),
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
                          DateFormat('dd/MM/yyyy').format(selectedDate),
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
                      isDatePopulated
                          ? Icons.warning_amber_rounded
                          : Icons.check_circle_outline_rounded,
                      color:
                          isDatePopulated ? AppColors.orange : AppColors.green,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SizedBox(
                      width: 240,
                      child: Text(
                        isDatePopulated
                            ? LocaleConsts.archiveDialogDateTaken.tr()
                            : LocaleConsts.archiveDialogDateFree.tr(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 11,
                            color: isDatePopulated
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
          child: Text(
            LocaleConsts.archiveDialogCancel.tr(),
            style: const TextStyle(color: AppColors.redAccent),
          ),
        ),
        TextButton(
          onPressed: () {
            registerHistoricalMeasurement(selectedDate);
            resetIngredientQuantitiesList();
            populateConsumptionVariables();
            resetActivityVolumesList();
            calculateAdjustedCalories();
            dataController.update();
            storage.globalDataSave();
            Navigator.of(context).pop();
          },
          child: Text(
            LocaleConsts.archiveDialogComplete.tr(),
            style: TextStyle(color: AppThemes.darkTheme.primaryColor),
          ),
        ),
      ],
    );
  }
}
