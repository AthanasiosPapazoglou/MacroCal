import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:macro_cal_public/app/theme/intake_colors.dart';

abstract final class AppTheme {
  static final ThemeData dark = FlexThemeData.dark(
    scheme: FlexScheme.greenM3,
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 13,
    scaffoldBackground: Colors.blueGrey.shade800,
    primary: Colors.green.shade500,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      useM2StyleDividerInM3: true,
      alignedDropdown: true,
      useInputDecoratorThemeInDialogs: true,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    swapLegacyOnMaterial3: true,
    extensions: [IntakeColors.standard],
  );
}
