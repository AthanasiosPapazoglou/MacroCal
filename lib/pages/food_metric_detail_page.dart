import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:macro_cal_public/wrappers/dismiss_page.dart';

class FoodMetricDetailsPage extends StatelessWidget {
  const FoodMetricDetailsPage({
    super.key,
    required this.title,
    required this.svgPath,
    required this.metricDescription,
    this.valuePerGram = "",
    this.richInText = "",
    this.poorInText = "",
  });

  final String title;
  final String svgPath;
  final String metricDescription;
  final String valuePerGram;
  final String richInText;
  final String poorInText;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Hero(
                    tag: 'ICON$svgPath',
                    child: SvgPicture.asset(
                      svgPath,
                      width: 100,
                      height: 100,
                    ),
                  ),
                  if (valuePerGram != "")
                    const Column(
                      children: [
                        Text("Calorical Value per gram: "),
                        Text("Calorical rich foods:"),
                        Text("Calorical poor foods:"),
                      ],
                    )
                ],
              ),
              const SizedBox(
                height: 32,
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
