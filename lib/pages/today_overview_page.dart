import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/dialogs/date_selection_dialog.dart';
import 'package:macro_cal_public/miscellaneous/appbars.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/pages/today_consumption_page.dart';
import 'package:macro_cal_public/pages/today_excercise_page.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:easy_localization/easy_localization.dart';

final DataController dataController = Get.find<DataController>();

String formatedDate = DateFormat('dd/MM/yy').format(DateTime.now());

List<Color> colorCodingList = [
  Colors.red,
  Colors.orange,
  Colors.yellow.shade700,
  Colors.green
];

bool isLimitSurpassed(double max, double current) => current / max > 1;

int surpassedPercentage(double max, double current) =>
    (((current / max) - 1) * 100).floor();

Color assignItemColor(double max, double current, bool isMacro) {
  if (current / max < .3) {
    return colorCodingList[isMacro ? 0 : 3];
  } else if (current / max < .6) {
    return colorCodingList[isMacro ? 1 : 3];
  } else if (current / max < .85) {
    return colorCodingList[isMacro ? 2 : 2];
  } else if (current / max <= 1.1) {
    return colorCodingList[isMacro ? 3 : 1];
  } else if (current / max <= 1.2) {
    return colorCodingList[isMacro ? 2 : 0];
  } else if (current / max <= 1.3) {
    return colorCodingList[isMacro ? 1 : 0];
  } else {
    return colorCodingList[0];
  }
}

double calculateMacroFromPercentile({required double unitCalories}) =>
    (dataController.sugarsLimit.value *
            0.01 *
            dataController.adjustedCalories.value /
            unitCalories)
        .floor()
        .toDouble();

caloryCirclePercentile() => (dataController.consumedCalories /
            dataController.adjustedCalories.value <=
        1)
    ? dataController.consumedCalories / dataController.adjustedCalories.value
    : 1.0;

class TodaysPage extends StatefulWidget {
  const TodaysPage({
    super.key,
  });

  @override
  State<TodaysPage> createState() => _TodaysPageState();
}

class _TodaysPageState extends State<TodaysPage> {
  @override
  void initState() {
    calculateAdjustedCalories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MajorPageAppBar(
        title: '${tr('overview_page.title')}:  $formatedDate',
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(
              () => ListView(
                children: [
                  SectionHeader(tr('overview_page.intake')),
                  CaloriesOverview(),
                  SectionHeader(tr('overview_page.healthy')),
                  horizontalMetricOverview(
                      tr('overview_page.nutrients.protein'),
                      dataController.dailyProteins.value,
                      dataController.proteinConsumed.value,
                      true),
                  horizontalMetricOverview(
                      tr('overview_page.nutrients.fiber'),
                      dataController.dailyFiber.value,
                      dataController.fiberConsumed.value,
                      true),
                  SectionHeader(tr('overview_page.unhealthy')),
                  horizontalMetricOverview(
                      tr('overview_page.nutrients.sugars'),
                      calculateMacroFromPercentile(unitCalories: 4),
                      dataController.sugarsConsumed.value,
                      false),
                  horizontalMetricOverview(
                      tr('overview_page.nutrients.saturated'),
                      calculateMacroFromPercentile(unitCalories: 9),
                      dataController.saturatedConsumed.value,
                      false),
                  horizontalMetricOverview(
                      tr('overview_page.nutrients.salt'),
                      dataController.sodiumLimit.value,
                      dataController.sodiumConsumed.value,
                      false),
                  heightSpacer(48),
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            top: 4,
            child: IconButton(
              onPressed: () {
                _showArchiveDayPopupDialog();
              },
              icon: const Icon(Icons.save_rounded),
              style: IconButton.styleFrom(
                backgroundColor: AppThemes.darkTheme.primaryColor,
                fixedSize: const Size(50, 50),
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 4,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TodayConsumption()));
                  },
                  icon: const Icon(Icons.restaurant_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor: AppThemes.darkTheme.primaryColor,
                    fixedSize: const Size(50, 50),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TodayExcercise()));
                  },
                  icon: const Icon(Icons.sports_gymnastics_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor: AppThemes.darkTheme.primaryColor,
                    fixedSize: const Size(50, 50),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column SectionHeader(String title) {
    return Column(
      children: [
        heightSpacer(title == 'Calory Intake' ? 32 : 48),
        Center(
          child: Text(
            title,
            style: appBarStyle(),
          ),
        ),
        heightSpacer(16),
      ],
    );
  }

  Column CaloriesOverview() {
    return Column(
      children: [
        heightSpacer(16),
        Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppThemes.darkTheme.hintColor.withOpacity(.2),
            ),
            child: CircularPercentIndicator(
              animation: true,
              animateFromLastPercent: true,
              radius: 100.0,
              lineWidth: 12.0,
              percent: caloryCirclePercentile(),
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${dataController.consumedCalories.toInt()} / ${dataController.adjustedCalories.toInt()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    tr('overview_page.intake_info.kcal'),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      children: [
                        Text(
                          (caloryCirclePercentile() == 1.0)
                              ? tr('overview_page.intake_info.exceeding')
                              : tr('overview_page.intake_info.remaining'),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: assignItemColor(
                                  dataController.adjustedCalories.value,
                                  dataController.consumedCalories.value,
                                  true)),
                        ),
                        Text(
                          '${(dataController.consumedCalories.value - dataController.adjustedCalories.value).abs().toInt()} kcal.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: assignItemColor(
                                  dataController.adjustedCalories.value,
                                  dataController.consumedCalories.value,
                                  true)),
                        )
                      ],
                    ),
                  )
                ],
              ),
              animationDuration: 1000,
              progressColor: assignItemColor(
                  dataController.adjustedCalories.value,
                  dataController.consumedCalories.value,
                  true),
              backgroundColor: Colors.black.withOpacity(.3),
            ),
          ),
        ),
      ],
    );
  }

  Column horizontalMetricOverview(
    String title,
    double max,
    double current,
    bool isMacro,
  ) {
    return Column(
      children: [
        heightSpacer(8),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            isLimitSurpassed(max, current)
                ? "Surpassed $title (${surpassedPercentage(max, current)}%)"
                : title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isLimitSurpassed(max, current)
                    ? (title == tr('overview_page.nutrients.protein') ||
                            title == tr('overview_page.nutrients.fiber'))
                        ? Colors.green
                        : assignItemColor(max, current, isMacro)
                    : Colors.white),
          ),
        ),
        Center(
          child: LinearPercentIndicator(
            lineHeight: 35,
            animation: true,
            animateFromLastPercent: true,
            percent: isLimitSurpassed(max, current) ? 1 : current / max,
            center: Text(
              (title == 'Salt (mg)')
                  ? "${current.toInt()} / ${max.toInt()}"
                  : "${(current * 10).truncateToDouble() / 10} / ${max.toInt()}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            animationDuration: 1000,
            progressColor: isLimitSurpassed(max, current)
                ? (title == tr('overview_page.nutrients.protein') ||
                        title == tr('overview_page.nutrients.fiber'))
                    ? Colors.green
                    : assignItemColor(max, current, isMacro)
                : assignItemColor(max, current, isMacro),
            backgroundColor: Colors.black.withOpacity(.3),
            barRadius: const Radius.circular(20),
          ),
        ),
        heightSpacer(8),
      ],
    );
  }

  void _showArchiveDayPopupDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const DateSelectionDialog();
        });
  }
}
