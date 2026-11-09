import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/widgets/numeric_field.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity_entry.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';
import 'package:macro_cal_public/features/today/presentation/activity_labels.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/exercise_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/exercise_state.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';
import 'package:go_router/go_router.dart';

class TodayExcercise extends StatelessWidget {
  const TodayExcercise({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ExerciseCubit(context.read<ActivityRepository>())..load(),
      child: BlocListener<ExerciseCubit, ExerciseState>(
        listenWhen: (previous, current) =>
            current.status == ExerciseStatus.saved,
        listener: (context, _) => context.pop(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              context.l10n.activitiesPageTitle,
              style: AppTextStyles.appBarTitle,
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: BlocBuilder<ExerciseCubit, ExerciseState>(
            buildWhen: (previous, _) =>
                previous.status == ExerciseStatus.loading,
            builder: (context, state) => state.status == ExerciseStatus.loading
                ? const SizedBox.shrink()
                : _ExerciseForm(initialEntries: state.entries),
          ),
        ),
      ),
    );
  }
}

class _ExerciseForm extends StatefulWidget {
  const _ExerciseForm({required this.initialEntries});

  final List<ActivityEntry> initialEntries;

  @override
  State<_ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<_ExerciseForm> {
  late final _controllers = {
    for (final entry in widget.initialEntries)
      entry.activity.id: TextEditingController(text: entry.amount.toString()),
  };

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.initialEntries.length,
            itemBuilder: (_, index) =>
                _activityItem(widget.initialEntries[index].activity),
          ),
        ),
        _actionButtons(),
        const SizedBox(height: 32),
      ],
    );
  }

  Padding _activityItem(Activity activity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Container(
        width: double.maxFinite,
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: Theme.of(context).primaryColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(
                activity.localizedName(context.l10n),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  activity.localizedUnit(context.l10n),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: NumericField(
                    controller: _controllers[activity.id],
                    onChanged: (amount) => context
                        .read<ExerciseCubit>()
                        .updateAmount(activity.id, amount),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row _actionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _showResetDialog,
          child: Text(
            context.l10n.activitiesPageBottomActionBarResetValues,
            style: const TextStyle(color: AppColors.orange),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton(
          onPressed: context.read<ExerciseCubit>().save,
          child: Text(
            context.l10n.activitiesPageBottomActionBarSaveChanges,
            style: const TextStyle(color: AppColors.confirmationButtonsColor),
          ),
        ),
      ],
    );
  }

  void _showResetDialog() {
    final cubit = context.read<ExerciseCubit>();
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(dialogContext.l10n.activitiesPageResetValuesDialogTitle),
        content: Text(dialogContext.l10n.activitiesPageResetValuesDialogBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(dialogContext.l10n.activitiesPageResetValuesDialogCancel),
          ),
          TextButton(
            onPressed: () async {
              await cubit.reset();
              for (final controller in _controllers.values) {
                controller.text = '0';
              }
              if (dialogContext.mounted) Navigator.of(dialogContext).pop();
            },
            child: Text(
              dialogContext.l10n.activitiesPageResetValuesDialogConfirm,
              style: const TextStyle(color: AppColors.confirmationButtonsColor),
            ),
          ),
        ],
      ),
    );
  }
}
