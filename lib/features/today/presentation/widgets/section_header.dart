import 'package:flutter/material.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  const new(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 48, bottom: 16),
      child: Center(child: Text(title, style: AppTextStyles.appBarTitle)),
    );
  }
}
