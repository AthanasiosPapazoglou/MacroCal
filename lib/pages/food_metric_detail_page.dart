import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:macro_cal_public/wrappers/dismiss_page.dart';

class FoodMetricDetailsPage extends StatelessWidget {
  const FoodMetricDetailsPage(
      {super.key,
      required this.title,
      required this.svgPath,
      required this.metricDescription});

  final String title;
  final String svgPath;
  final String metricDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: appBarStyle(),
        ),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      ),
      body: PageDismissWraper(
        child: Container(
          padding: const EdgeInsetsDirectional.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 32,
              ),
              Hero(
                tag: 'ICON$svgPath',
                child: SvgPicture.asset(
                  svgPath,
                  width: 250,
                  height: 250,
                ),
              ),
              const SizedBox(
                height: 64,
              ),
              Text(
                metricDescription,
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
