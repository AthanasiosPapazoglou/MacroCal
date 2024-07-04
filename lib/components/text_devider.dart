import 'package:flutter/material.dart';
import 'package:macro_cal_public/themes/app_colors.dart';

class TextDivider extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final double thickness;
  final Color color;

  const TextDivider({
    super.key,
    required this.text,
    this.textStyle = const TextStyle(color: AppColors.white),
    this.thickness = 1.0,
    this.color = AppColors.normalGray,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: Divider(
            thickness: thickness,
            color: color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: textStyle,
          ),
        ),
        Flexible(
          flex: 1,
          child: Divider(
            thickness: thickness,
            color: color,
          ),
        ),
      ],
    );
  }
}
