import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:macro_cal_public/app/theme/intake_colors.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/today/domain/entities/goal_kind.dart';
import 'package:macro_cal_public/features/today/domain/services/nutrition_calculator.dart';

class CaloriesChart extends StatelessWidget {
  const new({required this.logs, required this.averageGoal, super.key});

  static const maxDays = 31;
  static const _calculator = NutritionCalculator();

  /// Newest first; the chart shows the latest [maxDays] oldest to newest.
  final List<DayLog> logs;
  final double averageGoal;

  @override
  Widget build(BuildContext context) {
    final days = logs.take(maxDays).toList().reversed.toList();
    final colors = context.intakeColors;
    final highest = days.fold<double>(
      averageGoal,
      (top, log) => max(top, log.summary.consumed.kcal),
    );
    final labelStep = (days.length / 7).ceil();
    final textColor = Theme.of(context).colorScheme.onSurface;
    return AspectRatio(
      aspectRatio: 1.5,
      child: BarChart(
        BarChartData(
          maxY: highest <= 0 ? 1 : highest * 1.15,
          alignment: BarChartAlignment.spaceAround,
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
            drawVerticalLine: false,
            getDrawingHorizontalLine: (_) =>
                FlLine(color: textColor.withValues(alpha: .08), strokeWidth: 1),
          ),
          extraLinesData: ExtraLinesData(
            horizontalLines: [
              HorizontalLine(
                y: averageGoal,
                color: textColor.withValues(alpha: .7),
                strokeWidth: 1.5,
                dashArray: [6, 4],
              ),
            ],
          ),
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(),
            rightTitles: const AxisTitles(),
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 44,
                maxIncluded: false,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 28,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index % labelStep != 0) return const SizedBox.shrink();
                  return SideTitleWidget(
                    meta: meta,
                    child: Text(
                      DateFormat('dd/MM').format(days[index].date),
                      style: const TextStyle(fontSize: 11),
                    ),
                  );
                },
              ),
            ),
          ),
          barTouchData: BarTouchData(
            touchTooltipData: BarTouchTooltipData(
              getTooltipItem: (group, _, _, _) {
                final summary = days[group.x].summary;
                return BarTooltipItem(
                  '${summary.consumed.kcal.round()} / '
                  '${summary.adjustedKcal.round()}',
                  const TextStyle(fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
          barGroups: [
            for (final (index, log) in days.indexed)
              BarChartGroupData(
                x: index,
                barRods: [
                  BarChartRodData(
                    toY: log.summary.consumed.kcal,
                    width: days.length <= 7 ? 18 : 6,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(4),
                    ),
                    color: colors.of(
                      _calculator.status(
                        goal: log.summary.adjustedKcal,
                        consumed: log.summary.consumed.kcal,
                        kind: GoalKind.energy,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
