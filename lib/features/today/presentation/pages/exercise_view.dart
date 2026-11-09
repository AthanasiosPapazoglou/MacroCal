import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity_entry.dart';
import 'package:macro_cal_public/features/today/presentation/activity_labels.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/exercise_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/exercise_state.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/amount_row.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/reset_values_dialog.dart';

class ExerciseView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExerciseCubit, ExerciseState>(
      listenWhen: (_, current) => current.status == ExerciseStatus.saved,
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
          buildWhen: (previous, _) => previous.status == ExerciseStatus.loading,
          builder: (context, state) => state.status == ExerciseStatus.loading
              ? const SizedBox.shrink()
              : _ExerciseForm(initialEntries: state.entries),
        ),
      ),
    );
  }
}

class _ExerciseForm extends StatefulWidget {
  const new({required this.initialEntries});

  final List<ActivityEntry> initialEntries;

  @override
  State<_ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<_ExerciseForm> {
  late final Map<int, TextEditingController> _controllers = {
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

  Future<void> _confirmReset() async {
    final l10n = context.l10n;
    final cubit = context.read<ExerciseCubit>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => ResetValuesDialog(
        title: l10n.activitiesPageResetValuesDialogTitle,
        body: l10n.activitiesPageResetValuesDialogBody,
        cancelLabel: l10n.activitiesPageResetValuesDialogCancel,
        confirmLabel: l10n.activitiesPageResetValuesDialogConfirm,
      ),
    );
    if (!(confirmed ?? false)) return;
    await cubit.reset();
    for (final controller in _controllers.values) {
      controller.text = '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              for (final ActivityEntry(:activity) in widget.initialEntries)
                AmountRow(
                  label: activity.localizedName(l10n),
                  unit: activity.localizedUnit(l10n),
                  controller: _controllers[activity.id],
                  onChanged: (amount) => context
                      .read<ExerciseCubit>()
                      .updateAmount(activity.id, amount),
                ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _confirmReset,
                child: Text(
                  l10n.activitiesPageBottomActionBarResetValues,
                  style: const TextStyle(color: AppColors.orange),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton(
                onPressed: context.read<ExerciseCubit>().save,
                child: Text(
                  l10n.activitiesPageBottomActionBarSaveChanges,
                  style: const TextStyle(
                    color: AppColors.confirmationButtonsColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
