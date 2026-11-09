import 'package:flutter/material.dart';

class TabIcon extends StatelessWidget {
  const new(this.asset, {super.key});

  static const _size = 30.0;

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      asset,
      width: _size,
      height: _size,
      cacheWidth: (_size * MediaQuery.devicePixelRatioOf(context)).round(),
    );
  }
}
