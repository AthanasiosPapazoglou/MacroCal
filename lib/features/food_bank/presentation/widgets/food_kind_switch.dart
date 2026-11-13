import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/food_kind.dart';

class FoodKindSwitch extends StatelessWidget {
  const new({required this.kind, required this.onChanged, super.key});

  final FoodKind kind;
  final ValueChanged<FoodKind> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: double.infinity,
      child: SegmentedButton<FoodKind>(
        showSelectedIcon: false,
        segments: [
          ButtonSegment(
            value: FoodKind.ingredient,
            label: Text(l10n.foodsPageIngredients),
          ),
          ButtonSegment(
            value: FoodKind.recipe,
            label: Text(l10n.foodsPageRecipes),
          ),
        ],
        selected: {kind},
        onSelectionChanged: (selection) => onChanged(selection.single),
      ),
    );
  }
}
