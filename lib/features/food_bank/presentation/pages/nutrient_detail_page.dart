import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/swipe_back_detector.dart';
import 'package:macro_cal_public/features/food_bank/presentation/nutrient_kind.dart';

class NutrientDetailPage extends StatelessWidget {
  const new({required this.kind, super.key});

  final NutrientKind kind;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(kind.title(l10n), style: AppTextStyles.appBarTitle),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SwipeBackDetector(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(height: 32),
              Hero(
                tag: 'ICON${kind.svgPath}',
                child: SvgPicture.asset(kind.svgPath, width: 250, height: 250),
              ),
              const SizedBox(height: 64),
              Text(
                kind.description(l10n),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
