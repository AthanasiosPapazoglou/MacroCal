import 'dart:math';

import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/widgets/empty_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/food_bank_state.dart';
import 'package:macro_cal_public/core/widgets/major_page_app_bar.dart';
import 'package:macro_cal_public/features/settings/presentation/widgets/settings_drawer.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';

class FoodBankPage extends StatelessWidget {
  const FoodBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          FoodBankCubit(context.read<IngredientRepository>())..watch(),
      child: const _FoodBankView(),
    );
  }
}

class _FoodBankView extends StatefulWidget {
  const _FoodBankView();

  @override
  State<_FoodBankView> createState() => _FoodBankViewState();
}

class _FoodBankViewState extends State<_FoodBankView> {
  final _searchBarController = TextEditingController();
  bool _isSearchActivated = false;
  bool _isListView = false;

  int _gridColumns() => max(1, MediaQuery.sizeOf(context).width ~/ 120);

  @override
  void dispose() {
    _searchBarController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchBarController.clear();
    context.read<FoodBankCubit>().search('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MajorPageAppBar(title: context.l10n.foodsPageTitle),
      endDrawer: const SettingsDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 12),
            Expanded(
              child: Column(
                children: [
                  _topSideActionBar(),
                  if (_isSearchActivated) _filterSearchBar(),
                  _foodList(),
                ],
              ),
            ),
            const SizedBox(height: 56),
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

  Padding _topSideActionBar() {
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
            onPressed: () => setState(() => _isListView = !_isListView),
            child: Icon(
              _isListView ? Icons.window_rounded : Icons.table_rows_rounded,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _clearSearch();
              setState(() => _isSearchActivated = !_isSearchActivated);
            },
            child: Icon(
              _isSearchActivated
                  ? Icons.search_off_rounded
                  : Icons.search_rounded,
              size: 25,
              color: _isSearchActivated ? AppColors.redAccent : null,
            ),
          ),
        ],
      ),
    );
  }

  Column _filterSearchBar() {
    return Column(
      children: [
        TextField(
          onChanged: context.read<FoodBankCubit>().search,
          controller: _searchBarController,
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
              onTap: _clearSearch,
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
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Expanded _foodList() {
    return Expanded(
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
          return _isListView
              ? ListView.builder(
                  itemCount: ingredients.length,
                  itemBuilder: (_, index) => _ingredientItem(ingredients[index]),
                )
              : GridView.builder(
                  itemCount: ingredients.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _gridColumns(),
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  itemBuilder: (_, index) => _ingredientItem(ingredients[index]),
                );
        },
      ),
    );
  }

  Widget _ingredientItem(Ingredient ingredient) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: _isListView ? 0 : 8,
      ),
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => context.push(AppRoutes.ingredient(ingredient.id)),
          child: Container(
            padding: const EdgeInsets.all(4),
            height: 48,
            child: Center(
              child: Text(
                ingredient.name,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
