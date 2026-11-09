import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/domain/use_cases/archive_day.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/archive_day_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/archive_day_state.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_cubit.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';

class DateSelectionDialog extends StatelessWidget {
  const DateSelectionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ArchiveDayCubit(
        context.read<HistoryRepository>(),
        context.read<ArchiveDay>(),
        today: DateTime.now(),
      )..load(),
      child: BlocConsumer<ArchiveDayCubit, ArchiveDayState>(
        listenWhen: (_, current) => current.status == ArchiveDayStatus.archived,
        listener: (context, _) => Navigator.of(context).pop(),
        builder: (context, state) => _dialog(context, state),
      ),
    );
  }

  AlertDialog _dialog(BuildContext context, ArchiveDayState state) {
    final cubit = context.read<ArchiveDayCubit>();
    final isTaken = state.isDateTaken;
    return AlertDialog(
      title: Text(context.l10n.archiveDialogTitle),
      content: SizedBox(
        height: 260,
        width: double.maxFinite,
        child: Column(
          children: [
            Text(context.l10n.archiveDialogBody, textAlign: TextAlign.start),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(context.l10n.archiveDialogSelectedDate),
            ),
            InkWell(
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                  lastDate: DateTime.now(),
                );
                if (pickedDate == null) return;
                await cubit.selectDate(pickedDate);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                width: double.maxFinite,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    width: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          context.l10n.archiveDialogArchiveFor,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.calendar_month_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    Text(
                      DateFormat('dd/MM/yyyy').format(state.selectedDate),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(
                  isTaken
                      ? Icons.warning_amber_rounded
                      : Icons.check_circle_outline_rounded,
                  color: isTaken ? AppColors.orange : AppColors.green,
                ),
                const SizedBox(width: 4),
                SizedBox(
                  width: 240,
                  child: Text(
                    isTaken
                        ? context.l10n.archiveDialogDateTaken
                        : context.l10n.archiveDialogDateFree,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 11,
                      color: isTaken ? AppColors.orange : AppColors.green,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            context.l10n.archiveDialogCancel,
            style: const TextStyle(color: AppColors.redAccent),
          ),
        ),
        TextButton(
          onPressed: state.status == ArchiveDayStatus.archiving
              ? null
              : () => cubit.archive(
                  context.read<OverviewCubit>().state.summary,
                ),
          child: Text(
            context.l10n.archiveDialogComplete,
            style: TextStyle(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }
}
