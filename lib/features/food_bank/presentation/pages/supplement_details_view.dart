import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/swipe_back_detector.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_details_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_details_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/supplement_unit_labels.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/delete_food_dialog.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/micronutrient_list.dart';

class SupplementDetailsView extends StatelessWidget {
  const new({super.key});

  Future<void> _confirmDelete(BuildContext context) async {
    final cubit = context.read<SupplementDetailsCubit>();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) =>
          DeleteFoodDialog(body: context.l10n.supplementDeleteDialogBody),
    );
    if (confirmed ?? false) await cubit.delete();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SupplementDetailsCubit, SupplementDetailsState>(
      listenWhen: (_, current) =>
          current.status == SupplementDetailsStatus.deleted,
      listener: (context, _) => context.pop(),
      builder: (context, state) {
        final supplement = state.supplement;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              context.l10n.supplementDetailsTitle,
              style: AppTextStyles.appBarTitle,
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: supplement == null
              ? const SizedBox.shrink()
              : SwipeBackDetector(child: _details(context, supplement)),
        );
      },
    );
  }

  Widget _details(BuildContext context, Supplement supplement) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    supplement.name,
                    style: textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    '${l10n.supplementFormUnit}: '
                    '${supplement.unit.title(l10n)}',
                    style: textTheme.titleMedium,
                  ),
                ),
                MicronutrientList(
                  micros: supplement.microsPerUnit,
                  title: l10n.supplementMicrosPerUnit,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _confirmDelete(context),
                  child: Text(
                    l10n.ingredientDetailsButtonSideActionsDeleteButton,
                    style: const TextStyle(color: AppColors.redAccent),
                  ),
                ),
                const SizedBox(width: 24),
                ElevatedButton(
                  onPressed: () =>
                      context.push(AppRoutes.editSupplement(supplement.id)),
                  child: Text(
                    '  ${l10n.ingredientDetailsButtonSideActionsEditButton}  ',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
