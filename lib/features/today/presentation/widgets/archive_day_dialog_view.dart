import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/archive_day_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/archive_day_state.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_cubit.dart';

class ArchiveDayDialogView extends StatelessWidget {
  const new({super.key});

  Future<void> _pickDate(BuildContext context) async {
    final cubit = context.read<ArchiveDayCubit>();
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime.fromMillisecondsSinceEpoch(0),
      lastDate: now,
    );
    if (picked == null) return;
    await cubit.selectDate(picked);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArchiveDayCubit, ArchiveDayState>(
      listenWhen: (_, current) => current.status == ArchiveDayStatus.archived,
      listener: (context, _) {
        if (ModalRoute.of(context)?.isCurrent ?? false) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        final l10n = context.l10n;
        final primary = Theme.of(context).primaryColor;
        final isTaken = state.isDateTaken;
        final statusColor = isTaken ? AppColors.orange : AppColors.green;
        final isArchiving = state.status == ArchiveDayStatus.archiving;
        return PopScope(
          canPop: !isArchiving,
          child: AlertDialog(
            title: Text(l10n.archiveDialogTitle),
            content: SizedBox(
              height: 260,
              width: double.maxFinite,
              child: Column(
                children: [
                  Text(l10n.archiveDialogBody),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(l10n.archiveDialogSelectedDate),
                  ),
                  InkWell(
                    onTap: () => _pickDate(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      height: 48,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(width: 2, color: primary),
                      ),
                      child: Row(
                        children: [
                          Text(
                            l10n.archiveDialogArchiveFor,
                            style: TextStyle(color: primary),
                          ),
                          const SizedBox(width: 8),
                          Icon(Icons.calendar_month_rounded, color: primary),
                          const Spacer(),
                          Text(
                            DateFormat('dd/MM/yyyy').format(state.selectedDate),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primary,
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
                        color: statusColor,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          isTaken
                              ? l10n.archiveDialogDateTaken
                              : l10n.archiveDialogDateFree,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(fontSize: 11, color: statusColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: isArchiving
                    ? null
                    : () => Navigator.of(context).pop(),
                child: Text(
                  l10n.archiveDialogCancel,
                  style: const TextStyle(color: AppColors.redAccent),
                ),
              ),
              TextButton(
                onPressed: isArchiving
                    ? null
                    : () => context.read<ArchiveDayCubit>().archive(
                        context.read<OverviewCubit>().state.summary,
                      ),
                child: Text(
                  l10n.archiveDialogComplete,
                  style: TextStyle(color: primary),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
