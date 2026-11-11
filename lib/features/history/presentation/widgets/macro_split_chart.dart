import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';

class MacroSplitChart extends StatelessWidget {
  const new({required this.average, super.key});

  static const _kcalPerGramProtein = 4.0;
  static const _kcalPerGramCarbs = 4.0;
  static const _kcalPerGramFat = 9.0;

  final Nutrients average;

  static bool hasData(Nutrients average) =>
      average.proteinG + average.carbsG + average.fatG > 0;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final parts = [
      (
        l10n.ingredientDetailsNutrientsProtein,
        average.proteinG,
        average.proteinG * _kcalPerGramProtein,
        AppColors.kPrimaryColor,
      ),
      (
        l10n.historyMacroCarbs,
        average.carbsG,
        average.carbsG * _kcalPerGramCarbs,
        Colors.amber,
      ),
      (
        l10n.historyMacroFat,
        average.fatG,
        average.fatG * _kcalPerGramFat,
        AppColors.orange,
      ),
    ];
    final total = parts.fold<double>(0, (sum, part) => sum + part.$3);
    return Row(
      children: [
        SizedBox.square(
          dimension: 150,
          child: PieChart(
            PieChartData(
              sectionsSpace: 2,
              centerSpaceRadius: 28,
              sections: [
                for (final (_, _, kcal, color) in parts)
                  if (kcal > 0)
                    PieChartSectionData(
                      value: kcal,
                      color: color,
                      radius: 44,
                      title: '${(kcal / total * 100).round()}%',
                      titleStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final (label, grams, _, color) in parts)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Row(
                    children: [
                      Icon(Icons.circle, size: 12, color: color),
                      const SizedBox(width: 8),
                      Expanded(child: Text(label)),
                      Text('${grams.round()} ${l10n.unitGramsShort}'),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
