import 'package:flutter/material.dart';

abstract final class AppColors {
  static const MaterialColor kPrimaryColor = MaterialColor(
    0xFF00C1B9,
    <int, Color>{
      50: Color.fromRGBO(0, 193, 185, .1),
      100: Color.fromRGBO(0, 193, 185, .2),
      200: Color.fromRGBO(0, 193, 185, .3),
      300: Color.fromRGBO(0, 193, 185, .4),
      400: Color.fromRGBO(0, 193, 185, .5),
      500: Color.fromRGBO(0, 193, 185, .6),
      600: Color.fromRGBO(0, 193, 185, .7),
      700: Color.fromRGBO(0, 193, 185, .8),
      800: Color.fromRGBO(0, 193, 185, .9),
      900: Color.fromRGBO(0, 193, 185, 1),
    },
  );

  static const Color white = Colors.white;
  static const Color green = Color(0xFF19B21D);
  static const Color orange = Color(0xFFFF7F00);
  static const Color redAccent = Color(0xFFFF6464);
  static const Color normalGray = Color(0xFF838383);
  static const Color confirmationButtonsColor = Color(0xFF19B21D);
}
