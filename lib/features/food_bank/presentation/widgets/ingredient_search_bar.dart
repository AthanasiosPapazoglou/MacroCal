import 'package:flutter/material.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

class IngredientSearchBar extends StatelessWidget {
  const new({
    required this.controller,
    required this.onChanged,
    required this.onClear,
    super.key,
  });

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      textInputAction: TextInputAction.done,
      style: const TextStyle(color: AppColors.kPrimaryColor),
      decoration: InputDecoration(
        fillColor: Theme.of(context).canvasColor,
        border: InputBorder.none,
        hintText: context.l10n.foodsPageTopActionBarSearchHint,
        hintStyle: const TextStyle(
          color: AppColors.kPrimaryColor,
          fontSize: 15,
        ),
        suffixIcon: GestureDetector(
          onTap: onClear,
          child: const Icon(
            Icons.cancel_outlined,
            color: AppColors.kPrimaryColor,
          ),
        ),
        prefixIcon: const Icon(
          Icons.search_rounded,
          color: AppColors.kPrimaryColor,
        ),
        contentPadding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 8),
      ),
    );
  }
}
