import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

class FoodHeader extends StatelessWidget {
  const new({required this.name, required this.referenceGrams, super.key});

  final String name;
  final double referenceGrams;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Container(
        width: double.maxFinite,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).primaryColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              '${l10n.ingredientDetailsInfoBoard} '
              '${referenceGrams.toInt()} '
              '${l10n.unitGramsShort}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange.shade300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
