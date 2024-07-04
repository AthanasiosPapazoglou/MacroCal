import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

ScrollbarThemeData _scrollbarThemeData = const ScrollbarThemeData(
  radius: Radius.circular(10),
);

class AppThemes {
  AppThemes._();

  static final ThemeData lightTheme = FlexThemeData.light(
    colors: const FlexSchemeColor(
      primary: Color(0xff004881),
      primaryContainer: Color(0xffd0e4ff),
      secondary: Color(0xffac3306),
      secondaryContainer: Color(0xffffdbcf),
      tertiary: Color(0xff006875),
      tertiaryContainer: Color(0xff95f0ff),
      appBarColor: Color(0xffffdbcf),
      error: Color(0xffb00020),
    ),
    surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
    blendLevel: 7,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
    swapLegacyOnMaterial3: true,
  ).copyWith(scrollbarTheme: _scrollbarThemeData);

  static final ThemeData darkTheme = FlexThemeData.dark(
    colors: FlexSchemeColor.from(primary: AppColors.kPrimaryColor),
    scheme: FlexScheme.aquaBlue,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 30,
    appBarStyle: FlexAppBarStyle.surface,
    appBarOpacity: 0.90,
    onPrimary: AppColors.white,
    fontFamily: 'ProductSans',
    tooltipsMatchBackground: true,
    subThemesData: const FlexSubThemesData(
      outlinedButtonSchemeColor: SchemeColor.primary,
      outlinedButtonOutlineSchemeColor: SchemeColor.primary,
      fabUseShape: true,
      cardElevation: 4,
      cardRadius: 40,
      blendOnLevel: 20,
      blendOnColors: false,
      useTextTheme: true,
      blendTextTheme: false,
      buttonPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 18),
      defaultRadius: 8.0,
      toggleButtonsRadius: 25.0,
      inputDecoratorUnfocusedHasBorder: false,
      fabRadius: 35.0,
      snackBarBackgroundSchemeColor: SchemeColor.onError,
      chipRadius: 26.0,
      dialogRadius: 18,
      popupMenuRadius: 12.0,
      elevatedButtonRadius: 40,
      outlinedButtonRadius: 40,
      inputDecoratorRadius: 40.0,
      navigationRailOpacity: 0.73,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
    useMaterial3: true,
  ).copyWith(scrollbarTheme: _scrollbarThemeData);
}
