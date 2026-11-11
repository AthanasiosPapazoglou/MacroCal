import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/history/domain/entities/history_stats.dart';
import 'package:macro_cal_public/features/history/domain/entities/tracked_goal.dart';

class HistorySummary extends StatelessWidget {
  const new({required this.stats, super.key});

  final HistoryStats stats;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final average = stats.averageConsumed.kcal.round();
    final goal = stats.averageAdjustedKcal.round();
    return Column(
      children: [
        Row(
          children: [
            _StatTile(
              label: l10n.historyPageDaysLogged,
              value: '${stats.daysLogged}',
            ),
            _StatTile(
              label: l10n.historyPageAverageKcal,
              value: '$average / $goal',
            ),
          ],
        ),
        Row(
          children: [
            _StatTile(
              label: l10n.historyPageKcalGoalMet,
              value: l10n.historyPageDaysMet(
                stats.daysMet[TrackedGoal.energy] ?? 0,
                stats.daysLogged,
              ),
            ),
            _StatTile(
              label: l10n.historyPageStreak,
              value: l10n.historyPageStreakDays(stats.currentStreak),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatTile extends StatelessWidget {
  const new({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
          child: Column(
            children: [
              Text(
                value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(label, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
