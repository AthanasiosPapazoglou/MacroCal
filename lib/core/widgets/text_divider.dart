import 'package:flutter/material.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';

class TextDivider extends StatelessWidget {
  const new({
    required this.text,
    this.textStyle = const TextStyle(color: AppColors.white),
    this.thickness = 1.0,
    this.color = AppColors.normalGray,
    super.key,
  });

  final String text;
  final TextStyle textStyle;
  final double thickness;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Divider(thickness: thickness, color: color),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(text, style: textStyle),
        ),
        Flexible(
          child: Divider(thickness: thickness, color: color),
        ),
      ],
    );
  }
}
