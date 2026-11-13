import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';

/// A recipe's weight with its kcal and macros per 100 g.
class RecipeTotals extends StatelessWidget {
  const new({required this.recipe, super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final per100g = recipe.per100g;
    String grams(double value) =>
        '${value.toStringAsFixed(1)} ${l10n.unitGramsShort}';
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 2, color: Theme.of(context).primaryColor),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                l10n.recipeTotalsPer100g,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(l10n.recipeTotalsWeight(recipe.weightGrams)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _Value(value: '${per100g.kcal.round()}', label: 'kcal'),
              _Value(
                value: grams(per100g.proteinG),
                label: l10n.ingredientsPageLabels9,
              ),
              _Value(
                value: grams(per100g.carbsG),
                label: l10n.historyMacroCarbs,
              ),
              _Value(value: grams(per100g.fatG), label: l10n.historyMacroFat),
            ],
          ),
        ],
      ),
    );
  }
}

class _Value extends StatelessWidget {
  const new({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
