import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/widgets/numeric_field.dart';

/// A bordered row with a label, a unit and a whole-number field.
class AmountRow extends StatelessWidget {
  const new({
    required this.label,
    required this.unit,
    required this.controller,
    required this.onChanged,
    this.labelWidth,
    super.key,
  });

  final String label;
  final String unit;
  final TextEditingController? controller;
  final ValueChanged<int> onChanged;
  final double? labelWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Container(
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: Theme.of(context).primaryColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: SizedBox(
                width: labelWidth,
                child: Text(
                  label,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  unit,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: NumericField(
                    controller: controller,
                    onChanged: onChanged,
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
