import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/recipe_form_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/ingredient_picker.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/outlined_field_decoration.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/recipe_ingredient_row.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/recipe_totals.dart';

class RecipeFormView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipeFormCubit, RecipeFormState>(
      buildWhen: (previous, _) => previous.status == RecipeFormStatus.loading,
      builder: (context, state) => state.status == RecipeFormStatus.loading
          ? const Scaffold()
          : const _RecipeForm(),
    );
  }
}

class _RecipeForm extends StatefulWidget {
  const new();

  @override
  State<_RecipeForm> createState() => _RecipeFormState();
}

class _RecipeFormState extends State<_RecipeForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _finalWeightController = TextEditingController();
  int? _addedId;

  RecipeFormCubit get _cubit => context.read<RecipeFormCubit>();

  @override
  void dispose() {
    _nameController.dispose();
    _finalWeightController.dispose();
    super.dispose();
  }

  Future<void> _pickIngredient(List<Ingredient> addable) async {
    final cubit = _cubit;
    FocusManager.instance.primaryFocus?.unfocus();
    final ingredient = await showModalBottomSheet<Ingredient>(
      context: context,
      isScrollControlled: true,
      builder: (_) => IngredientPicker(ingredients: addable),
    );
    if (ingredient == null || !mounted) return;
    setState(() => _addedId = ingredient.id);
    cubit.addIngredient(ingredient);
  }

  Future<void> _save() async {
    _formKey.currentState!.validate();
    await _cubit.save(_nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocListener<RecipeFormCubit, RecipeFormState>(
      listenWhen: (_, current) => current.status == RecipeFormStatus.saved,
      listener: (context, _) => context.pop(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            l10n.recipeFormTitleAdd,
            style: AppTextStyles.appBarTitle,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<RecipeFormCubit, RecipeFormState>(
            builder: (context, state) => Column(
              children: [
                Expanded(
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _nameController,
                            textCapitalization: TextCapitalization.sentences,
                            validator: (value) => (value ?? '').trim().isEmpty
                                ? l10n.recipeFormNameRequired
                                : null,
                            decoration: outlinedFieldDecoration(
                              label: l10n.recipeFormName,
                              hint: l10n.recipeFormNameHint,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            l10n.foodsPageIngredients,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          for (final item in state.items)
                            RecipeIngredientRow(
                              key: ValueKey(item.ingredient.id),
                              name: item.ingredient.name,
                              initialGrams: item.grams,
                              autofocus: item.ingredient.id == _addedId,
                              onChanged: (grams) =>
                                  _cubit.updateGrams(item.ingredient.id, grams),
                              onRemove: () =>
                                  _cubit.removeIngredient(item.ingredient.id),
                            ),
                          if (state.status ==
                              RecipeFormStatus.missingIngredients)
                            Padding(
                              padding: const EdgeInsets.only(top: 6),
                              child: Text(
                                l10n.recipeFormIngredientsRequired,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton.icon(
                              onPressed: () => _pickIngredient(state.addable),
                              icon: const Icon(Icons.add_rounded),
                              label: Text(l10n.recipeFormAddIngredient),
                            ),
                          ),
                          const SizedBox(height: 12),
                          TextFormField(
                            controller: _finalWeightController,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(5),
                            ],
                            onChanged: (value) => _cubit.updateFinalWeight(
                              int.tryParse(value) ?? 0,
                            ),
                            decoration: outlinedFieldDecoration(
                              label: l10n.recipeFormFinalWeight,
                              hint: l10n.recipeFormFinalWeightHint,
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ),
                ),
                RecipeTotals(recipe: state.draft),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: ElevatedButton(
                    onPressed: _save,
                    child: Text(
                      l10n.ingredientsPageBottomSideActionsSaveButton,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
