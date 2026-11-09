import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';

class Loader extends StatelessWidget {
  const new({this.size = 50, super.key});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size,
        child: SpinKitCircle(color: AppColors.kPrimaryColor, size: size),
      ),
    );
  }
}
