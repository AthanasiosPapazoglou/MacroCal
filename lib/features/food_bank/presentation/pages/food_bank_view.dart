import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/empty_state.dart';
import 'package:macro_cal_public/core/widgets/major_page_app_bar.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/food_bank_action_bar.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/ingredient_search_bar.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/ingredient_tile.dart';
import 'package:macro_cal_public/features/settings/presentation/widgets/settings_drawer.dart';

class FoodBankView extends StatefulWidget {
  const new({super.key});

  @override
  State<FoodBankView> createState() => _FoodBankViewState();
}

class _FoodBankViewState extends State<FoodBankView> {
  final _searchController = TextEditingController();
  bool _isSearching = false;
  bool _isListView = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    context.read<FoodBankCubit>().search('');
  }

  void _toggleSearch() {
    _clearSearch();
    setState(() => _isSearching = !_isSearching);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MajorPageAppBar(title: context.l10n.foodsPageTitle),
      endDrawer: const SettingsDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 56),
        child: Column(
          children: [
            FoodBankActionBar(
              isListView: _isListView,
              isSearching: _isSearching,
              onToggleLayout: () => setState(() => _isListView = !_isListView),
              onToggleSearch: _toggleSearch,
            ),
            if (_isSearching)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: IngredientSearchBar(
                  controller: _searchController,
                  onChanged: context.read<FoodBankCubit>().search,
                  onClear: _clearSearch,
                ),
              ),
            Expanded(
              child: BlocBuilder<FoodBankCubit, FoodBankState>(
                builder: (context, state) {
                  if (state.status == FoodBankStatus.loading) {
                    return const SizedBox.shrink();
                  }
                  final ingredients = state.visibleIngredients;
                  if (ingredients.isEmpty) {
                    return EmptyState(
                      title: state.isFiltering
                          ? context.l10n.foodsPageEmptyPageTitleNoResults
                          : context.l10n.foodsPageEmptyPageTitleNoItems,
                    );
                  }
                  return _ingredientCollection(ingredients);
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () => context.push(AppRoutes.newIngredient),
        icon: const Icon(Icons.format_list_bulleted_add, size: 30),
        style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          fixedSize: const Size(50, 50),
        ),
      ),
    );
  }

  Widget _ingredientCollection(List<Ingredient> ingredients) {
    Widget tile(int index) => IngredientTile(
      ingredient: ingredients[index],
      isListItem: _isListView,
      onTap: () => context.push(AppRoutes.ingredient(ingredients[index].id)),
    );

    if (_isListView) {
      return ListView.builder(
        itemCount: ingredients.length,
        itemBuilder: (_, index) => tile(index),
      );
    }
    return GridView.builder(
      itemCount: ingredients.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: max(1, MediaQuery.sizeOf(context).width ~/ 120),
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (_, index) => tile(index),
    );
  }
}
