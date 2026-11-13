import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/search_field.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';

/// A searchable sheet that pops with the tapped ingredient.
class IngredientPicker extends StatefulWidget {
  const new({required this.ingredients, super.key});

  final List<Ingredient> ingredients;

  @override
  State<IngredientPicker> createState() => _IngredientPickerState();
}

class _IngredientPickerState extends State<IngredientPicker> {
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _query = '');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final query = _query.toLowerCase();
    final visible = [
      for (final ingredient in widget.ingredients)
        if (ingredient.name.toLowerCase().contains(query)) ingredient,
    ];
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
      child: SizedBox(
        height: MediaQuery.sizeOf(context).height * 0.7,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
              child: Text(
                l10n.recipeFormPickerTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SearchField(
                controller: _searchController,
                hintText: l10n.consumptionPageTopActionBarSearchHint,
                onChanged: (value) => setState(() => _query = value),
                onClear: _clearSearch,
              ),
            ),
            Expanded(
              child: visible.isEmpty
                  ? Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          _query.isEmpty
                              ? l10n.foodsPageEmptyPageTitleNoItems
                              : l10n.foodsPageEmptyPageTitleNoResults,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: visible.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(visible[index].name),
                        trailing: const Icon(Icons.add_rounded),
                        onTap: () => Navigator.of(context).pop(visible[index]),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
