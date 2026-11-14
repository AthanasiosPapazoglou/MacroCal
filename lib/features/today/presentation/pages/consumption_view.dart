import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/theme/app_colors.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:macro_cal_public/core/assets/app_assets.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/empty_state.dart';
import 'package:macro_cal_public/core/widgets/search_field.dart';
import 'package:macro_cal_public/core/widgets/tab_icon.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/food_kind.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/recipe.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/consumption_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/consumption_state.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/amount_row.dart';
import 'package:macro_cal_public/features/today/presentation/widgets/reset_values_dialog.dart';

class ConsumptionView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConsumptionCubit, ConsumptionState>(
      listenWhen: (_, current) => current.status == ConsumptionStatus.saved,
      listener: (context, _) => context.pop(),
      child: BlocBuilder<ConsumptionCubit, ConsumptionState>(
        buildWhen: (previous, _) =>
            previous.status == ConsumptionStatus.loading,
        builder: (context, state) => state.status == ConsumptionStatus.loading
            ? const Scaffold()
            : _ConsumptionTabs(initialState: state),
      ),
    );
  }
}

class _ConsumptionTabs extends StatefulWidget {
  const new({required this.initialState});

  final ConsumptionState initialState;

  @override
  State<_ConsumptionTabs> createState() => _ConsumptionTabsState();
}

class _ConsumptionTabsState extends State<_ConsumptionTabs>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this)
    ..addListener(_onTabChanged);
  final _searchController = TextEditingController();
  late final Map<int, TextEditingController> _controllers = {
    for (final ingredient in widget.initialState.ingredients)
      ingredient.id: TextEditingController(
        text: widget.initialState.gramsOf(ingredient.id).toString(),
      ),
  };
  late final Map<int, TextEditingController> _recipeControllers = {
    for (final recipe in widget.initialState.recipes)
      recipe.id: TextEditingController(
        text: widget.initialState.recipeGramsOf(recipe.id).toString(),
      ),
  };
  bool _isSearching = false;

  bool get _onAllFoods => _tabController.index == 0;

  ConsumptionCubit get _cubit => context.read<ConsumptionCubit>();

  @override
  void dispose() {
    for (final controller in [
      ..._controllers.values,
      ..._recipeControllers.values,
    ]) {
      controller.dispose();
    }
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (_onAllFoods) {
      setState(() {});
      return;
    }
    _cubit.refreshConsumed();
    _clearSearch();
    setState(() => _isSearching = false);
  }

  void _clearSearch() {
    _searchController.clear();
    _cubit.search('');
  }

  void _toggleSearch() {
    if (!_onAllFoods) return;
    _clearSearch();
    setState(() => _isSearching = !_isSearching);
  }

  Future<void> _confirmReset() async {
    final l10n = context.l10n;
    final cubit = _cubit;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => ResetValuesDialog(
        title: l10n.consumptionPageResetValuesDialogTitle,
        body: l10n.consumptionPageResetValuesDialogBody,
        cancelLabel: l10n.consumptionPageResetValuesDialogCancel,
        confirmLabel: l10n.consumptionPageResetValuesDialogConfirm,
      ),
    );
    if (!(confirmed ?? false)) return;
    await cubit.reset();
    for (final controller in [
      ..._controllers.values,
      ..._recipeControllers.values,
    ]) {
      controller.text = '0';
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n.consumptionPageTitle,
          style: AppTextStyles.appBarTitle,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _confirmReset,
                  child: Text(l10n.consumptionPageTopActionBarResetValues),
                ),
                ElevatedButton(
                  onPressed: _cubit.save,
                  child: Text(
                    l10n.consumptionPageTopActionBarSaveChanges,
                    style: const TextStyle(
                      color: AppColors.confirmationButtonsColor,
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: _onAllFoods
                        ? null
                        : WidgetStatePropertyAll(
                            Theme.of(context).disabledColor,
                          ),
                  ),
                  onPressed: _toggleSearch,
                  child: Icon(
                    _isSearching
                        ? Icons.search_off_rounded
                        : Icons.search_rounded,
                    size: 25,
                    color: _isSearching ? AppColors.redAccent : null,
                  ),
                ),
              ],
            ),
          ),
          if (_isSearching && _onAllFoods)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: SearchField(
                controller: _searchController,
                hintText: l10n.consumptionPageTopActionBarSearchHint,
                onChanged: _cubit.search,
                onClear: _clearSearch,
              ),
            ),
          Expanded(
            child: BlocBuilder<ConsumptionCubit, ConsumptionState>(
              builder: (context, state) => TabBarView(
                controller: _tabController,
                children: [
                  _allFoods(state),
                  if (state.consumedIngredients.isEmpty &&
                      state.consumedRecipes.isEmpty)
                    EmptyState(
                      image: AppImages.addFood,
                      title: l10n.consumptionPageEmptyPageTitle,
                      subtitle: l10n.consumptionPageEmptyPageSubTitle,
                    )
                  else
                    _consumed(state),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: [
          Tab(
            text: l10n.consumptionPageBottomActionBarAllFoods,
            icon: const TabIcon(AppImages.pantry),
          ),
          Tab(
            text: l10n.consumptionPageBottomActionBarConsumed,
            icon: const TabIcon(AppImages.consumption),
          ),
        ],
      ),
    );
  }

  Widget _allFoods(ConsumptionState state) {
    final l10n = context.l10n;
    final rows = switch (state.kind) {
      FoodKind.ingredient => _ingredientRows(state.visibleIngredients),
      FoodKind.recipe => _recipeRows(state.visibleRecipes),
    };
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: SizedBox(
            width: double.infinity,
            child: SegmentedButton<FoodKind>(
              showSelectedIcon: false,
              segments: [
                ButtonSegment(
                  value: FoodKind.ingredient,
                  label: Text(l10n.foodsPageIngredients),
                ),
                ButtonSegment(
                  value: FoodKind.recipe,
                  label: Text(l10n.foodsPageRecipes),
                ),
              ],
              selected: {state.kind},
              onSelectionChanged: (selection) =>
                  _cubit.selectKind(selection.single),
            ),
          ),
        ),
        Expanded(
          child: rows.isNotEmpty
              ? ListView(children: rows)
              : _emptyAllFoods(state),
        ),
      ],
    );
  }

  Widget _emptyAllFoods(ConsumptionState state) {
    final l10n = context.l10n;
    if (state.isFiltering) {
      return EmptyState(title: l10n.foodsPageEmptyPageTitleNoResults);
    }
    return switch (state.kind) {
      FoodKind.ingredient => EmptyState(
        title: l10n.foodsPageEmptyPageTitleNoItems,
      ),
      FoodKind.recipe => EmptyState(
        title: l10n.foodsPageNoRecipes,
        subtitle: l10n.foodsPageNoRecipesHint,
      ),
    };
  }

  Widget _consumed(ConsumptionState state) {
    final l10n = context.l10n;
    final recipes = state.consumedRecipes;
    final ingredients = state.consumedIngredients;
    return ListView(
      children: [
        if (recipes.isNotEmpty) ...[
          _GroupHeader(l10n.foodsPageRecipes),
          ..._recipeRows(recipes),
        ],
        if (ingredients.isNotEmpty) ...[
          _GroupHeader(l10n.foodsPageIngredients),
          ..._ingredientRows(ingredients),
        ],
      ],
    );
  }

  List<Widget> _ingredientRows(List<Ingredient> ingredients) => [
    for (final ingredient in ingredients)
      AmountRow(
        key: ValueKey('ingredient ${ingredient.id}'),
        label: ingredient.name,
        unit: context.l10n.consumptionPageMetricsGrams,
        labelWidth: 180,
        controller: _controllers[ingredient.id],
        onChanged: (grams) => _cubit.updateGrams(ingredient.id, grams),
      ),
  ];

  List<Widget> _recipeRows(List<Recipe> recipes) => [
    for (final recipe in recipes)
      AmountRow(
        key: ValueKey('recipe ${recipe.id}'),
        label: recipe.name,
        unit: context.l10n.consumptionPageMetricsGrams,
        labelWidth: 180,
        controller: _recipeControllers[recipe.id],
        onChanged: (grams) => _cubit.updateRecipeGrams(recipe.id, grams),
      ),
  ];
}

class _GroupHeader extends StatelessWidget {
  const new(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 4),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
