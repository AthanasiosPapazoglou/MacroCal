import 'package:flutter/material.dart';

double navTabsImageSize = 30;

Image tabIcon(BuildContext context, String path) => Image.asset(
      path,
      width: navTabsImageSize,
      height: navTabsImageSize,
      cacheWidth:
          (navTabsImageSize * MediaQuery.devicePixelRatioOf(context)).round(),
    );

SizedBox heightSpacer(double space) {
  return SizedBox(
    height: space,
  );
}

TextStyle appBarStyle() =>
    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold);
