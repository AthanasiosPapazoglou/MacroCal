import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/consumption_cubit.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/consumption_state.dart';
import 'package:macro_cal_public/miscellaneous/functions.dart';
import 'package:macro_cal_public/miscellaneous/images.dart';
import 'package:macro_cal_public/themes/app_colors.dart';
import 'package:macro_cal_public/themes/app_themes.dart';

class TodayConsumption extends StatelessWidget {
  const TodayConsumption({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConsumptionCubit(
        context.read<IngredientRepository>(),
        context.read<FoodLogRepository>(),
      )..load(),
      child: BlocListener<ConsumptionCubit, ConsumptionState>(
        listenWhen: (_, current) => current.status == ConsumptionStatus.saved,
        listener: (context, _) => Navigator.pop(context),
        child: BlocBuilder<ConsumptionCubit, ConsumptionState>(
          buildWhen: (previous, _) =>
              previous.status == ConsumptionStatus.loading,
          builder: (context, state) =>
              state.status == ConsumptionStatus.loading
              ? const Scaffold()
              : _ConsumptionView(initialState: state),
        ),
      ),
    );
  }
}

class _ConsumptionView extends StatefulWidget {
  const _ConsumptionView({required this.initialState});

  final ConsumptionState initialState;

  @override
  State<_ConsumptionView> createState() => _ConsumptionViewState();
}

class _ConsumptionViewState extends State<_ConsumptionView>
    with SingleTickerProviderStateMixin {
  late final _tabController = TabController(length: 2, vsync: this)
    ..addListener(_onTabChanged);
  final _searchBarController = TextEditingController();
  late final _controllers = {
    for (final ingredient in widget.initialState.ingredients)
      ingredient.id: TextEditingController(
        text: widget.initialState.gramsOf(ingredient.id).toString(),
      ),
  };
  bool _isSearchActivated = false;

  bool get _isAllFoodsTabSelected => _tabController.index == 0;

  void _onTabChanged() {
    if (_tabController.index == 1) {
      context.read<ConsumptionCubit>().refreshConsumed();
      _searchBarController.clear();
      context.read<ConsumptionCubit>().search('');
      setState(() => _isSearchActivated = false);
    } else {
      setState(() {});
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    _tabController.dispose();
    _searchBarController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchBarController.clear();
    context.read<ConsumptionCubit>().search('');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.consumptionPageTitle, style: appBarStyle()),
        backgroundColor: AppThemes.darkTheme.scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          _topSideActionBar(),
          if (_isSearchActivated && _isAllFoodsTabSelected) _filterSearchBar(),
          Expanded(
            child: BlocBuilder<ConsumptionCubit, ConsumptionState>(
              builder: (context, state) => TabBarView(
                controller: _tabController,
                children: [
                  _allFoodsTab(state),
                  if (state.consumedIngredients.isEmpty)
                    _emptyConsumedPage()
                  else
                    _ingredientList(state.consumedIngredients),
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
            text: context.l10n.consumptionPageBottomActionBarAllFoods,
            icon: tabIcon(context, pantryImagePath),
          ),
          Tab(
            text: context.l10n.consumptionPageBottomActionBarConsumed,
            icon: tabIcon(context, consumptionImagePath),
          ),
        ],
      ),
    );
  }

  Column _topSideActionBar() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _showResetDialog,
                child: Text(context.l10n.consumptionPageTopActionBarResetValues),
              ),
              ElevatedButton(
                onPressed: context.read<ConsumptionCubit>().save,
                child: Text(
                  context.l10n.consumptionPageTopActionBarSaveChanges,
                  style: const TextStyle(
                    color: AppColors.confirmationButtonsColor,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: _isAllFoodsTabSelected
                      ? null
                      : WidgetStateProperty.all<Color>(
                          AppThemes.darkTheme.disabledColor,
                        ),
                ),
                onPressed: () {
                  if (!_isAllFoodsTabSelected) return;
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
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Column _filterSearchBar() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: context.read<ConsumptionCubit>().search,
            controller: _searchBarController,
            textInputAction: TextInputAction.done,
            style: const TextStyle(color: AppColors.kPrimaryColor),
            decoration: InputDecoration(
              fillColor: AppThemes.darkTheme.canvasColor,
              border: InputBorder.none,
              hintText: context.l10n.consumptionPageTopActionBarSearchHint,
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
        ),
        const SizedBox(height: 12),
      ],
    );
  }

  Widget _allFoodsTab(ConsumptionState state) {
    final ingredients = state.visibleIngredients;
    if (ingredients.isEmpty) {
      return EmptyWidget(
        packageImage: PackageImage.Image_2,
        title: state.isFiltering
            ? context.l10n.foodsPageEmptyPageTitleNoResults
            : context.l10n.foodsPageEmptyPageTitleNoItems,
        titleTextStyle: TextStyle(
          fontSize: 22,
          color: AppThemes.darkTheme.primaryColor,
          fontWeight: FontWeight.w500,
        ),
      );
    }
    return _ingredientList(ingredients);
  }

  Widget _ingredientList(List<Ingredient> ingredients) {
    return ListView.builder(
      itemCount: ingredients.length,
      itemBuilder: (_, index) => _ingredientItem(ingredients[index]),
    );
  }

  Widget _ingredientItem(Ingredient ingredient) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: Container(
        width: double.maxFinite,
        height: 62,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: AppThemes.darkTheme.primaryColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: SizedBox(
                width: 180,
                child: Text(
                  ingredient.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Text(
                  context.l10n.consumptionPageMetricsGrams,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Container(
                    height: 48,
                    width: 85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextField(
                        onChanged: (value) => context
                            .read<ConsumptionCubit>()
                            .updateGrams(ingredient.id, int.tryParse(value) ?? 0),
                        controller: _controllers[ingredient.id],
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(4),
                        ],
                        textAlign: TextAlign.center,
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          hoverColor: AppThemes.darkTheme.canvasColor,
                          fillColor: AppThemes.darkTheme.disabledColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _emptyConsumedPage() {
    return EmptyWidget(
      image: addFoodImagePath,
      title: context.l10n.consumptionPageEmptyPageTitle,
      subTitle: context.l10n.consumptionPageEmptyPageSubTitle,
      titleTextStyle: TextStyle(
        fontSize: 22,
        color: AppThemes.darkTheme.primaryColor,
        fontWeight: FontWeight.w500,
      ),
      subtitleTextStyle: TextStyle(
        fontSize: 14,
        color: AppThemes.darkTheme.primaryColor,
      ),
    );
  }

  void _showResetDialog() {
    final cubit = context.read<ConsumptionCubit>();
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(dialogContext.l10n.consumptionPageResetValuesDialogTitle),
        content: Text(dialogContext.l10n.consumptionPageResetValuesDialogBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              dialogContext.l10n.consumptionPageResetValuesDialogCancel,
            ),
          ),
          TextButton(
            onPressed: () async {
              await cubit.reset();
              for (final controller in _controllers.values) {
                controller.text = '0';
              }
              if (dialogContext.mounted) Navigator.of(dialogContext).pop();
            },
            child: Text(
              dialogContext.l10n.consumptionPageResetValuesDialogConfirm,
              style: const TextStyle(color: AppColors.confirmationButtonsColor),
            ),
          ),
        ],
      ),
    );
  }
}
