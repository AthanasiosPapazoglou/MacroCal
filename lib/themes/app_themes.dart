import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';


ScrollbarThemeData _scrollbarThemeData = const ScrollbarThemeData(
  radius: Radius.circular(10),
);

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = FlexThemeData.light(
  scheme: FlexScheme.orangeM3,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  scaffoldBackground: Colors.blueGrey.shade800,
  primary: Colors.orange.shade400,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
);

  static final ThemeData darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.greenM3,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  scaffoldBackground: Colors.blueGrey.shade800,
  primary: Colors.green.shade500,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
);
}
