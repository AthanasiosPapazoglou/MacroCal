import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/assets/app_assets.dart';

class EmptyState extends StatelessWidget {
  const new({
    required this.title,
    this.subtitle,
    this.image = AppImages.emptyList,
    this.subtitleStyle,
    super.key,
  });

  final String title;
  final String? subtitle;
  final String image;
  final TextStyle? subtitleStyle;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    final subtitle = this.subtitle;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      builder: (context, opacity, child) =>
          Opacity(opacity: opacity, child: child),
      child: Center(
        child: AspectRatio(
          aspectRatio: 1,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Spacer(),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(image),
                  ),
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: color,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 10),
                  Text(
                    subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: color,
                    ).merge(subtitleStyle),
                  ),
                ],
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
