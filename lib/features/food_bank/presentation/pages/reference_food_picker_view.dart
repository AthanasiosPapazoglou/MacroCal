import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_field.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/reference_food_picker_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/reference_food_picker_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/reference_food_name.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/outlined_field_decoration.dart';

class ReferenceFoodPickerView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.referenceFoodsTitle, style: AppTextStyles.appBarTitle),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: TextField(
                autofocus: true,
                onChanged: context.read<ReferenceFoodPickerCubit>().search,
                decoration: outlinedFieldDecoration(
                  label: l10n.referenceFoodsSearchHint,
                ),
              ),
            ),
            const Expanded(child: _Results()),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                l10n.referenceFoodsSource,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Results extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<ReferenceFoodPickerCubit, ReferenceFoodPickerState>(
      builder: (context, state) => switch (state.status) {
        ReferenceFoodPickerStatus.loading => const Center(
          child: CircularProgressIndicator(),
        ),
        ReferenceFoodPickerStatus.failure => Center(
          child: Text(l10n.referenceFoodsLoadFailed),
        ),
        ReferenceFoodPickerStatus.ready when state.results.isEmpty => Center(
          child: Text(l10n.referenceFoodsNoResults),
        ),
        ReferenceFoodPickerStatus.ready => ListView.builder(
          itemCount: state.results.length,
          itemBuilder: (context, index) {
            final food = state.results[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(food.localName(context)),
              subtitle: Text(
                '${IngredientField.format(food.per100g.kcal)} kcal / 100 g',
              ),
              onTap: () => context.pop(food),
            );
          },
        ),
      },
    );
  }
}
