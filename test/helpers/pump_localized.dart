import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/theme/app_theme.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

/// Pumps [home], or [router] when given, inside the app theme in [locale].
/// Skips settling when [settle] is false, for endless animations.
Future<void> pumpLocalized(
  WidgetTester tester, {
  Widget? home,
  GoRouter? router,
  bool settle = true,
  Locale locale = const Locale('en'),
}) async {
  tester.view
    ..physicalSize = const Size(1179, 2556)
    ..devicePixelRatio = 3;
  addTearDown(tester.view.reset);

  await tester.pumpWidget(
    router == null
        ? MaterialApp(
            theme: AppTheme.dark,
            locale: locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: home,
          )
        : MaterialApp.router(
            theme: AppTheme.dark,
            locale: locale,
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            routerConfig: router,
          ),
  );
  if (settle) await tester.pumpAndSettle();
}
