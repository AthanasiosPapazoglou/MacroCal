import 'package:flutter/material.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

class FoodBankActionBar extends StatelessWidget {
  const new({
    required this.isListView,
    required this.isSearching,
    required this.onToggleLayout,
    required this.onToggleSearch,
    super.key,
  });

  final bool isListView;
  final bool isSearching;
  final VoidCallback onToggleLayout;
  final VoidCallback onToggleSearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.sort_rounded),
              const SizedBox(width: 4),
              Text(context.l10n.foodsPageTopActionBarSort),
            ],
          ),
          ElevatedButton(
            onPressed: onToggleLayout,
            child: Icon(
              isListView ? Icons.window_rounded : Icons.table_rows_rounded,
            ),
          ),
          ElevatedButton(
            onPressed: onToggleSearch,
            child: Icon(
              isSearching ? Icons.search_off_rounded : Icons.search_rounded,
              size: 25,
              color: isSearching ? AppColors.redAccent : null,
            ),
          ),
        ],
      ),
    );
  }
}
