import 'package:intl/intl.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/miscellaneous/storage.dart' as storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_cubit.dart';
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
      title: Text(context.l10n.archiveDialogTitle),
      content: SizedBox(
        height: 260,
        width: double.maxFinite,
        child: Column(
          children: [
            Text(
              context.l10n.archiveDialogBody,
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 16,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(context.l10n.archiveDialogSelectedDate),
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
                              context.l10n.archiveDialogArchiveFor,
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
                            ? context.l10n.archiveDialogDateTaken
                            : context.l10n.archiveDialogDateFree,
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
            context.l10n.archiveDialogCancel,
            style: const TextStyle(color: AppColors.redAccent),
          ),
        ),
        TextButton(
          onPressed: () {
            registerHistoricalMeasurement(
                selectedDate, context.read<OverviewCubit>().state.goals);
            resetIngredientQuantitiesList();
            populateConsumptionVariables();
            resetActivityVolumesList();
            dataController.update();
            storage.globalDataSave();
            Navigator.of(context).pop();
          },
          child: Text(
            context.l10n.archiveDialogComplete,
            style: TextStyle(color: AppThemes.darkTheme.primaryColor),
          ),
        ),
      ],
    );
  }
}
