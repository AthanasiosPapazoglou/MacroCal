import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/empty_state.dart';
import 'package:macro_cal_public/core/widgets/loader.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/microcal/domain/entities/reference_intake.dart';
import 'package:macro_cal_public/features/microcal/presentation/cubit/microcal_cubit.dart';
import 'package:macro_cal_public/features/microcal/presentation/cubit/microcal_state.dart';
import 'package:macro_cal_public/features/microcal/presentation/microcal_labels.dart';
import 'package:macro_cal_public/features/microcal/presentation/widgets/micro_nutrient_groups.dart';
import 'package:macro_cal_public/features/microcal/presentation/widgets/micro_nutrient_sheet.dart';

class MicroCalView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.microcalTitle)),
      body: BlocBuilder<MicroCalCubit, MicroCalState>(
        builder: (context, state) => switch (state) {
          MicroCalState(status: MicroCalStatus.loading) => const Loader(),
          MicroCalState(status: MicroCalStatus.failure) => EmptyState(
            title: l10n.microcalLoadFailed,
          ),
          MicroCalState(:final references?) => _Report(
            state: state,
            references: references,
          ),
          MicroCalState() => EmptyState(title: l10n.microcalUnderAge),
        },
      ),
    );
  }
}

class _Report extends StatelessWidget {
  const new({required this.state, required this.references});

  final MicroCalState state;
  final Map<Micronutrient, ReferenceIntake> references;

  Future<void> _openNutrient(BuildContext context, Micronutrient nutrient) =>
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (_) => MicroNutrientSheet(
          nutrient: nutrient,
          reference: references[nutrient]!,
          contributors: context.read<MicroCalCubit>().contributorsOf(nutrient),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final small = theme.textTheme.bodySmall;
    final colors = theme.colorScheme;
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
      children: [
        SegmentedButton<MicroCalPeriod>(
          segments: [
            ButtonSegment(
              value: MicroCalPeriod.today,
              label: Text(l10n.microcalToday),
            ),
            ButtonSegment(
              value: MicroCalPeriod.week,
              label: Text(l10n.microcalWeek),
            ),
          ],
          selected: {state.period},
          onSelectionChanged: (selection) =>
              context.read<MicroCalCubit>().selectPeriod(selection.single),
        ),
        const SizedBox(height: 12),
        Text(
          referenceIntakesLine(l10n, sex: state.sex, age: state.age),
          style: small,
        ),
        if (state.period == MicroCalPeriod.week)
          Text(
            state.weekDays == 0
                ? l10n.microcalNoWeekData
                : l10n.microcalDaysWithData(state.weekDays),
            style: small,
          ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 16,
          children: [
            _LegendItem(color: colors.primary, label: l10n.microcalLegendFood),
            _LegendItem(
              color: colors.tertiary,
              label: l10n.microcalLegendSupplements,
            ),
            _LegendItem(
              color: colors.outline,
              label: l10n.microcalLegendCoverage,
              height: 2,
            ),
          ],
        ),
        MicroNutrientGroups(
          intake: state.intake,
          references: references,
          onTap: (nutrient) => _openNutrient(context, nutrient),
        ),
        const SizedBox(height: 16),
        Text(l10n.microcalAdequateIntakeNote, style: small),
        const SizedBox(height: 8),
        Text(l10n.microcalDisclaimer, style: small),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  const new({required this.color, required this.label, this.height = 10});

  final Color color;
  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(width: 12, height: height, color: color),
        const SizedBox(width: 4),
        Text(label, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
