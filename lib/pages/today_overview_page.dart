import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:macro_cal_public/controllers/data_controller.dart';
import 'package:macro_cal_public/dialogs/date_selection_dialog.dart';
import 'package:macro_cal_public/miscellaneous/appbars.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/pages/today_consumption_page.dart';
import 'package:macro_cal_public/pages/today_excercise_page.dart';
import 'package:macro_cal_public/themes/app_themes.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:macro_cal_public/miscellaneous/locale_consts.dart';

List<Color> colorCodingList = [
  Colors.red,
  Colors.orange,
  Colors.yellow.shade700,
  Colors.green
];

bool isLimitSurpassed(double max, double current) => current > max;

double progressPercent(double max, double current) {
  if (max <= 0) return current > max ? 1.0 : 0.0;
  return (current / max).clamp(0.0, 1.0);
}

String surpassedTitle(String title, double max, double current) => max > 0
    ? "Surpassed $title (${(((current / max) - 1) * 100).floor()}%)"
    : "Surpassed $title";

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

double calculateMacroFromPercentile(
        {required double limitPercentage, required double unitCalories}) =>
    (limitPercentage *
            0.01 *
            dataController.adjustedCalories.value /
            unitCalories)
        .floor()
        .toDouble();

double caloryCirclePercentile() => progressPercent(
    dataController.adjustedCalories.value,
    dataController.consumedCalories.value);

class TodaysPage extends StatefulWidget {
  const TodaysPage({
    super.key,
  });

  @override
  State<TodaysPage> createState() => _TodaysPageState();
}

class _TodaysPageState extends State<TodaysPage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  bool _fabExpanded = false;
  OverlayEntry? _overlayEntry;
  final GlobalKey _fabKey = GlobalKey();
  late final AnimationController _animController;
  late final Animation<double> _fadeAnim;
  late final Animation<Offset> _slideAnim;
  late final Animation<double> _rotationAnim;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    calculateAdjustedCalories();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );
    _fadeAnim =
        CurvedAnimation(parent: _animController, curve: Curves.easeInOut);
    _slideAnim = Tween<Offset>(begin: const Offset(0, 0.4), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _animController, curve: Curves.easeOut));
    _rotationAnim =
        Tween<double>(begin: 0, end: 0.125).animate(_animController);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _removeOverlay();
    _animController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) setState(() {});
  }

  void _toggleFab() {
    if (_fabExpanded) {
      _collapseFab();
    } else {
      setState(() => _fabExpanded = true);
      _animController.forward();
      _showOverlay();
    }
  }

  void _collapseFab() {
    _animController.reverse().then((_) {
      if (mounted) {
        setState(() => _fabExpanded = false);
        _removeOverlay();
      }
    });
  }

  void _showOverlay() {
    final RenderBox renderBox =
        _fabKey.currentContext!.findRenderObject() as RenderBox;
    final Offset fabGlobal = renderBox.localToGlobal(Offset.zero);
    final Size fabSize = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (ctx) {
        final screenSize = MediaQuery.of(ctx).size;
        final double fabBottom =
            screenSize.height - fabGlobal.dy - fabSize.height;
        final double fabRight = screenSize.width - fabGlobal.dx - fabSize.width;

        return Stack(
          children: [
            Positioned.fill(
              child: AnimatedBuilder(
                animation: _animController,
                builder: (_, child) => BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: _animController.value * 3.5,
                    sigmaY: _animController.value * 3.5,
                  ),
                  child: child,
                ),
                child: GestureDetector(
                  onTap: _collapseFab,
                  child: FadeTransition(
                    opacity: _animController,
                    child:
                        ColoredBox(color: Colors.black.withValues(alpha: 0.25)),
                  ),
                ),
              ),
            ),
            Positioned(
              right: fabRight,
              bottom: fabBottom,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  FadeTransition(
                    opacity: _fadeAnim,
                    child: SlideTransition(
                      position: _slideAnim,
                      child: IconButton(
                        onPressed: () {
                          _collapseFab();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TodayConsumption()));
                        },
                        icon: const Icon(Icons.restaurant_rounded),
                        style: IconButton.styleFrom(
                          backgroundColor: AppThemes.darkTheme.primaryColor,
                          fixedSize: const Size(50, 50),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  FadeTransition(
                    opacity: _fadeAnim,
                    child: SlideTransition(
                      position: _slideAnim,
                      child: IconButton(
                        onPressed: () {
                          _collapseFab();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const TodayExcercise()));
                        },
                        icon: const Icon(Icons.sports_gymnastics_rounded),
                        style: IconButton.styleFrom(
                          backgroundColor: AppThemes.darkTheme.primaryColor,
                          fixedSize: const Size(50, 50),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: fabSize.width,
                    height: fabSize.height,
                    child: IconButton(
                      onPressed: _toggleFab,
                      icon: RotationTransition(
                        turns: _rotationAnim,
                        child: const Icon(Icons.add_rounded),
                      ),
                      style: IconButton.styleFrom(
                        backgroundColor: AppThemes.darkTheme.primaryColor,
                        fixedSize: fabSize,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    final String formattedDate = DateFormat('dd/MM/yy').format(DateTime.now());
    return Scaffold(
      appBar: MajorPageAppBar(
        title: '${LocaleConsts.overviewPageTitle.tr()}:  $formattedDate',
      ),
      endDrawer: const SettingsDrawer(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(
              () => ListView(
                children: [
                  SectionHeader(LocaleConsts.overviewPageIntake.tr()),
                  CaloriesOverview(),
                  SectionHeader(LocaleConsts.overviewPageHealthy.tr()),
                  horizontalMetricOverview(
                      LocaleConsts.overviewPageNutrientsProtein.tr(),
                      dataController.dailyProteins.value,
                      dataController.proteinConsumed.value,
                      true),
                  horizontalMetricOverview(
                      LocaleConsts.overviewPageNutrientsFiber.tr(),
                      dataController.dailyFiber.value,
                      dataController.fiberConsumed.value,
                      true),
                  SectionHeader(LocaleConsts.overviewPageUnhealthy.tr()),
                  horizontalMetricOverview(
                      LocaleConsts.overviewPageNutrientsSugars.tr(),
                      calculateMacroFromPercentile(
                          limitPercentage: dataController.sugarsLimit.value,
                          unitCalories: 4),
                      dataController.sugarsConsumed.value,
                      false),
                  horizontalMetricOverview(
                      LocaleConsts.overviewPageNutrientsSaturated.tr(),
                      calculateMacroFromPercentile(
                          limitPercentage: dataController.saturatedLimit.value,
                          unitCalories: 9),
                      dataController.saturatedConsumed.value,
                      false),
                  horizontalMetricOverview(
                      LocaleConsts.overviewPageNutrientsSalt.tr(),
                      dataController.sodiumLimit.value,
                      dataController.sodiumConsumed.value,
                      false,
                      showDecimals: false),
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
          if (!_fabExpanded)
            Positioned(
              right: 16,
              bottom: 4,
              child: IconButton(
                key: _fabKey,
                onPressed: _toggleFab,
                icon: const Icon(Icons.add_rounded),
                style: IconButton.styleFrom(
                  backgroundColor: AppThemes.darkTheme.primaryColor,
                  fixedSize: const Size(56, 56),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Column SectionHeader(String title) {
    return Column(
      children: [
        heightSpacer(48),
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
              color: AppThemes.darkTheme.hintColor.withValues(alpha: .2),
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
                    LocaleConsts.overviewPageIntakeInfoKcal.tr(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      children: [
                        Text(
                          (caloryCirclePercentile() == 1.0)
                              ? LocaleConsts.overviewPageIntakeInfoExceeding
                                  .tr()
                              : LocaleConsts.overviewPageIntakeInfoRemaining
                                  .tr(),
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
              backgroundColor: Colors.black.withValues(alpha: .3),
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
    bool isMacro, {
    bool showDecimals = true,
  }) {
    return Column(
      children: [
        heightSpacer(8),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            isLimitSurpassed(max, current)
                ? surpassedTitle(title, max, current)
                : title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isLimitSurpassed(max, current)
                    ? isMacro
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
            percent: progressPercent(max, current),
            center: Text(
              showDecimals
                  ? "${(current * 10).truncateToDouble() / 10} / ${max.toInt()}"
                  : "${current.toInt()} / ${max.toInt()}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            animationDuration: 1000,
            progressColor: isLimitSurpassed(max, current) && isMacro
                ? Colors.green
                : assignItemColor(max, current, isMacro),
            backgroundColor: Colors.black.withValues(alpha: .3),
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
