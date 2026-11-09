import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/presentation/health_effect.dart';
import 'package:macro_cal_public/features/food_bank/presentation/nutrient_kind.dart';

class NutrientRow extends StatelessWidget {
  const new({
    required this.kind,
    required this.value,
    required this.onTap,
    super.key,
  });

  final NutrientKind kind;
  final double value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = switch (kind.healthEffect) {
      HealthEffect.hazardous => Colors.red.shade300,
      HealthEffect.beneficial => Colors.green.shade300,
      HealthEffect.neutral => null,
    };
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Hero(
                  tag: 'ICON${kind.svgPath}',
                  child: SvgPicture.asset(kind.svgPath, width: 40, height: 40),
                ),
                const SizedBox(width: 16),
                Text(
                  kind.title(context.l10n),
                  style: TextStyle(
                    color: color,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
