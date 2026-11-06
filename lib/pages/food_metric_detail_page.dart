import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/presentation/nutrient_kind.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:macro_cal_public/wrappers/dismiss_page.dart';

class FoodMetricDetailsPage extends StatelessWidget {
  const FoodMetricDetailsPage({required this.kind, super.key});

  final NutrientKind kind;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(kind.title(context.l10n), style: appBarStyle()),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      ),
      body: PageDismissWraper(
        child: Container(
          padding: const EdgeInsetsDirectional.all(16),
          child: Column(
            children: [
              const SizedBox(height: 32),
              Hero(
                tag: 'ICON${kind.svgPath}',
                child: SvgPicture.asset(kind.svgPath, width: 250, height: 250),
              ),
              const SizedBox(height: 64),
              Text(
                kind.description(context.l10n),
                textAlign: TextAlign.start,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
