import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:macro_cal_public/features/today/domain/entities/goal_kind.dart';
import 'package:macro_cal_public/app/theme/intake_colors.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/dialogs/date_selection_dialog.dart';
import 'package:macro_cal_public/features/today/domain/services/nutrition_calculator.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_cubit.dart';
import 'package:macro_cal_public/core/widgets/major_page_app_bar.dart';
import 'package:macro_cal_public/features/settings/presentation/widgets/settings_drawer.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

bool isLimitSurpassed(double max, double current) => current > max;

String surpassedTitle(AppLocalizations l10n, String title, double max, double current) {
  final String surpassed = l10n.overviewPageSurpassed(title);
  return max > 0
      ? "$surpassed (${(((current / max) - 1) * 100).floor()}%)"
      : surpassed;
}

class TodaysPage extends StatefulWidget {
  const TodaysPage({
    super.key,
  });

  @override
  State<TodaysPage> createState() => _TodaysPageState();
}

class _TodaysPageState extends State<TodaysPage>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  static const _calculator = NutritionCalculator();
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
                          context.push(AppRoutes.consumption);
                        },
                        icon: const Icon(Icons.restaurant_rounded),
                        style: IconButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
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
                          context.push(AppRoutes.exercise);
                        },
                        icon: const Icon(Icons.sports_gymnastics_rounded),
                        style: IconButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
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
                        backgroundColor: Theme.of(context).primaryColor,
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
    final summary = context.watch<OverviewCubit>().state.summary;
    final goals = summary.goals;
    return Scaffold(
      appBar: MajorPageAppBar(
        title: '${context.l10n.overviewPageTitle}:  $formattedDate',
      ),
      endDrawer: const SettingsDrawer(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
                children: [
                  sectionHeader(context.l10n.overviewPageIntake),
                  caloriesOverview(summary.adjustedKcal, summary.consumed.kcal),
                  sectionHeader(context.l10n.overviewPageHealthy),
                  horizontalMetricOverview(
                      context.l10n.overviewPageNutrientsProtein,
                      goals.proteinG,
                      summary.consumed.proteinG,
                      GoalKind.minimum),
                  horizontalMetricOverview(
                      context.l10n.overviewPageNutrientsFiber,
                      goals.fiberG,
                      summary.consumed.fiberG,
                      GoalKind.minimum),
                  sectionHeader(context.l10n.overviewPageUnhealthy),
                  horizontalMetricOverview(
                      context.l10n.overviewPageNutrientsSugars,
                      summary.sugarLimitG,
                      summary.consumed.sugarsG,
                      GoalKind.limit),
                  horizontalMetricOverview(
                      context.l10n.overviewPageNutrientsSaturated,
                      summary.saturatedLimitG,
                      summary.consumed.saturatedG,
                      GoalKind.limit),
                  horizontalMetricOverview(
                      context.l10n.overviewPageNutrientsSalt,
                      goals.saltLimitMg,
                      summary.consumed.saltMg,
                      GoalKind.limit,
                      showDecimals: false),
                  const SizedBox(height: 48),
                ],
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
                backgroundColor: Theme.of(context).primaryColor,
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
                  backgroundColor: Theme.of(context).primaryColor,
                  fixedSize: const Size(56, 56),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Column sectionHeader(String title) {
    return Column(
      children: [
        const SizedBox(height: 48),
        Center(
          child: Text(
            title,
            style: AppTextStyles.appBarTitle,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Column caloriesOverview(double adjustedKcal, double consumedKcal) {
    final double ringPercent =
        _calculator.progress(goal: adjustedKcal, consumed: consumedKcal);
    return Column(
      children: [
        const SizedBox(height: 16),
        Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).hintColor.withValues(alpha: .2),
            ),
            child: CircularPercentIndicator(
              animation: true,
              animateFromLastPercent: true,
              radius: 100.0,
              lineWidth: 12.0,
              percent: ringPercent,
              center: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${consumedKcal.toInt()} / ${adjustedKcal.toInt()}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    context.l10n.overviewPageIntakeInfoKcal,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Column(
                      children: [
                        Text(
                          (ringPercent == 1.0)
                              ? context.l10n.overviewPageIntakeInfoExceeding
                              : context.l10n.overviewPageIntakeInfoRemaining,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _intakeColor(adjustedKcal, consumedKcal, GoalKind.energy)),
                        ),
                        Text(
                          '${(consumedKcal - adjustedKcal).abs().toInt()} kcal.',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: _intakeColor(adjustedKcal, consumedKcal, GoalKind.energy)),
                        )
                      ],
                    ),
                  )
                ],
              ),
              animationDuration: 1000,
              progressColor: _intakeColor(adjustedKcal, consumedKcal, GoalKind.energy),
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
    GoalKind kind, {
    bool showDecimals = true,
  }) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            isLimitSurpassed(max, current)
                ? surpassedTitle(context.l10n, title, max, current)
                : title,
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isLimitSurpassed(max, current)
                    ? kind == GoalKind.minimum
                        ? Colors.green
                        : _intakeColor(max, current, kind)
                    : Colors.white),
          ),
        ),
        Center(
          child: LinearPercentIndicator(
            lineHeight: 35,
            animation: true,
            animateFromLastPercent: true,
            percent: _calculator.progress(goal: max, consumed: current),
            center: Text(
              showDecimals
                  ? "${(current * 10).truncateToDouble() / 10} / ${max.toInt()}"
                  : "${current.toInt()} / ${max.toInt()}",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            animationDuration: 1000,
            progressColor: isLimitSurpassed(max, current) && kind == GoalKind.minimum
                ? Colors.green
                : _intakeColor(max, current, kind),
            backgroundColor: Colors.black.withValues(alpha: .3),
            barRadius: const Radius.circular(20),
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Color _intakeColor(double goal, double consumed, GoalKind kind) =>
      context.intakeColors.of(
        _calculator.status(goal: goal, consumed: consumed, kind: kind),
      );

  void _showArchiveDayPopupDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const DateSelectionDialog();
        });
  }
}
