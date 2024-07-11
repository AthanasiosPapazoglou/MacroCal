import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:macro_cal_public/themes/app_colors.dart';

class MacroCalLoader extends StatelessWidget {
  const MacroCalLoader(
      {this.width = 50, this.height = 50, this.size = 50, super.key});

  final double width;
  final double height;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        height: height,
        child: SpinKitCircle(
          color: AppColors.kPrimaryColor,
          size: size,
        ),
      ),
    );
  }
}
