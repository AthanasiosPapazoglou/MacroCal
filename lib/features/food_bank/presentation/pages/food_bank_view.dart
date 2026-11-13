import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/empty_state.dart';
import 'package:macro_cal_public/core/widgets/major_page_app_bar.dart';
import 'package:macro_cal_public/core/widgets/search_field.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/food_kind.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/food_bank_action_bar.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/food_kind_switch.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/food_tile.dart';
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

  String get _newFoodRoute =>
      switch (context.read<FoodBankCubit>().state.kind) {
        FoodKind.ingredient => AppRoutes.newIngredient,
        FoodKind.recipe => AppRoutes.newRecipe,
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MajorPageAppBar(title: context.l10n.foodsPageTitle),
      endDrawer: const SettingsDrawer(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 56),
        child: Column(
          children: [
            BlocBuilder<FoodBankCubit, FoodBankState>(
              buildWhen: (previous, current) => previous.kind != current.kind,
              builder: (context, state) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: FoodKindSwitch(
                  kind: state.kind,
                  onChanged: context.read<FoodBankCubit>().selectKind,
                ),
              ),
            ),
            FoodBankActionBar(
              isListView: _isListView,
              isSearching: _isSearching,
              onToggleLayout: () => setState(() => _isListView = !_isListView),
              onToggleSearch: _toggleSearch,
            ),
            if (_isSearching)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: SearchField(
                  controller: _searchController,
                  hintText: context.l10n.foodsPageTopActionBarSearchHint,
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
                  return switch (state.kind) {
                    FoodKind.ingredient => _ingredients(state),
                    FoodKind.recipe => _recipes(state),
                  };
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: () => context.push(_newFoodRoute),
        icon: const Icon(Icons.format_list_bulleted_add, size: 30),
        style: IconButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          fixedSize: const Size(50, 50),
        ),
      ),
    );
  }

  Widget _ingredients(FoodBankState state) {
    final ingredients = state.visibleIngredients;
    if (ingredients.isEmpty) {
      return EmptyState(
        title: state.isFiltering
            ? context.l10n.foodsPageEmptyPageTitleNoResults
            : context.l10n.foodsPageEmptyPageTitleNoItems,
      );
    }
    return _collection(
      ingredients.length,
      (index) => FoodTile(
        name: ingredients[index].name,
        isListItem: _isListView,
        onTap: () => context.push(AppRoutes.ingredient(ingredients[index].id)),
      ),
    );
  }

  Widget _recipes(FoodBankState state) {
    final recipes = state.visibleRecipes;
    if (recipes.isEmpty) {
      return state.isFiltering
          ? EmptyState(title: context.l10n.foodsPageEmptyPageTitleNoResults)
          : EmptyState(
              title: context.l10n.foodsPageNoRecipes,
              subtitle: context.l10n.foodsPageNoRecipesHint,
            );
    }
    return _collection(
      recipes.length,
      (index) => FoodTile(
        name: recipes[index].name,
        isListItem: _isListView,
        icon: Icons.menu_book_rounded,
        onTap: () => context.push(AppRoutes.recipe(recipes[index].id)),
      ),
    );
  }

  Widget _collection(int count, Widget Function(int index) tile) {
    if (_isListView) {
      return ListView.builder(
        itemCount: count,
        itemBuilder: (_, index) => tile(index),
      );
    }
    return GridView.builder(
      itemCount: count,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: max(1, MediaQuery.sizeOf(context).width ~/ 120),
        crossAxisSpacing: 1,
        mainAxisSpacing: 1,
      ),
      itemBuilder: (_, index) => tile(index),
    );
  }
}
