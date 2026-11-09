import 'package:flutter/material.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/core/widgets/loader.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/product_lookup_repository.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_field.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_state.dart';
import 'package:macro_cal_public/miscellaneous/snackbars.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';

class CreateOrEditIngredientPage extends StatelessWidget {
  const CreateOrEditIngredientPage({super.key, this.ingredientId});

  final int? ingredientId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => IngredientFormCubit(
        context.read<IngredientRepository>(),
        context.read<ProductLookupRepository>(),
        ingredientId: ingredientId,
      )..load(),
      child: BlocBuilder<IngredientFormCubit, IngredientFormState>(
        buildWhen: (previous, _) =>
            previous.status == IngredientFormStatus.loading,
        builder: (context, state) => state.status == IngredientFormStatus.loading
            ? const Scaffold()
            : _IngredientForm(
                initialValues: state.values,
                isEdit: ingredientId != null,
                uncategorisedLabel: context.l10n.ingredientsPageUncategorised,
              ),
      ),
    );
  }
}

class _IngredientForm extends StatefulWidget {
  const _IngredientForm({
    required this.initialValues,
    required this.isEdit,
    required this.uncategorisedLabel,
  });

  final Map<IngredientField, String> initialValues;
  final bool isEdit;
  final String uncategorisedLabel;

  @override
  State<_IngredientForm> createState() => _IngredientFormState();
}

class _IngredientFormState extends State<_IngredientForm> {
  final _formKey = GlobalKey<FormState>();
  final _focusNodes = {
    for (final field in IngredientField.values) field: FocusNode(),
  };
  late final _controllers = {
    for (final field in IngredientField.values)
      field: TextEditingController(text: _initialText(field)),
  };

  String _initialText(IngredientField field) {
    final value = widget.initialValues[field] ?? '';
    return field == IngredientField.category && value.isEmpty
        ? widget.uncategorisedLabel
        : value;
  }

  @override
  void dispose() {
    for (final focusNode in _focusNodes.values) {
      focusNode.dispose();
    }
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _scanProduct() async {
    final cubit = context.read<IngredientFormCubit>();
    final barcode = await context.push<String>(AppRoutes.scan);
    if (barcode == null) return;
    await cubit.lookUpBarcode(barcode);
  }

  void _onLookupFinished(IngredientFormState state) {
    final messenger = ScaffoldMessenger.of(context);
    if (state.lookupOutcome == LookupOutcome.found) {
      for (final MapEntry(key: field, value: text)
          in state.scannedValues.entries) {
        _controllers[field]!.text = text;
      }
      messenger.showSnackBar(productFoundSnackbar(context.l10n, Theme.of(context).primaryColor));
    } else {
      messenger.showSnackBar(noProductFoundSnackbar(context.l10n));
    }
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    context.read<IngredientFormCubit>().save({
      for (final MapEntry(key: field, value: controller)
          in _controllers.entries)
        field:
            field == IngredientField.category &&
                controller.text == widget.uncategorisedLabel
            ? ''
            : controller.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<IngredientFormCubit, IngredientFormState>(
          listenWhen: (previous, current) =>
              previous.status == IngredientFormStatus.lookingUp &&
              current.status != IngredientFormStatus.lookingUp,
          listener: (_, state) => _onLookupFinished(state),
        ),
        BlocListener<IngredientFormCubit, IngredientFormState>(
          listenWhen: (_, current) =>
              current.status == IngredientFormStatus.saved,
          listener: (context, _) => context.pop(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            widget.isEdit
                ? context.l10n.ingredientsPageTitlesEdit
                : context.l10n.ingredientsPageTitlesAdd,
            style: AppTextStyles.appBarTitle,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            if (!widget.isEdit)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: BlocBuilder<IngredientFormCubit, IngredientFormState>(
                  buildWhen: (previous, current) =>
                      previous.status != current.status,
                  builder: (context, state) {
                    final isLookingUp =
                        state.status == IngredientFormStatus.lookingUp;
                    return ElevatedButton(
                      onPressed: isLookingUp ? null : _scanProduct,
                      child: isLookingUp
                          ? const Loader(size: 24)
                          : const Icon(Icons.qr_code_scanner_rounded),
                    );
                  },
                ),
              ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (final field in IngredientField.values)
                          _textFieldItem(field),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ElevatedButton(
                  onPressed: _save,
                  child: Text(
                    context.l10n.ingredientsPageBottomSideActionsSaveButton,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textFieldItem(IngredientField field) {
    const borderRadius = BorderRadius.all(Radius.circular(12));
    final borderSide = BorderSide(color: Colors.green.shade500, width: 1.5);
    final l10n = context.l10n;
    final labels = [
      l10n.ingredientsPageLabels0,
      l10n.ingredientsPageLabels1,
      l10n.ingredientsPageLabels2,
      l10n.ingredientsPageLabels3,
      l10n.ingredientsPageLabels4,
      l10n.ingredientsPageLabels5,
      l10n.ingredientsPageLabels6,
      l10n.ingredientsPageLabels7,
      l10n.ingredientsPageLabels8,
      l10n.ingredientsPageLabels9,
      l10n.ingredientsPageLabels10,
    ];
    final hints = [
      l10n.ingredientsPageHints0,
      l10n.ingredientsPageHints1,
      l10n.ingredientsPageHints2,
      l10n.ingredientsPageHints3,
      l10n.ingredientsPageHints4,
      l10n.ingredientsPageHints5,
      l10n.ingredientsPageHints6,
      l10n.ingredientsPageHints7,
      l10n.ingredientsPageHints8,
      l10n.ingredientsPageHints9,
      l10n.ingredientsPageHints10,
    ];
    final isText =
        field == IngredientField.name || field == IngredientField.category;

    return Column(
      children: [
        const SizedBox(height: 12),
        TextFormField(
          keyboardType: isText ? null : TextInputType.number,
          validator: (value) =>
              field == IngredientField.name && (value ?? '').trim().isEmpty
              ? l10n.ingredientsPageNameRequired
              : null,
          controller: _controllers[field],
          focusNode: _focusNodes[field],
          onFieldSubmitted: (_) {
            if (field != IngredientField.values.last) {
              _focusNodes[IngredientField.values[field.index + 1]]!
                  .requestFocus();
            } else {
              _formKey.currentState!.validate();
            }
          },
          decoration: InputDecoration(
            floatingLabelAlignment: FloatingLabelAlignment.center,
            labelText: labels[field.index],
            hintText: hints[field.index],
            enabledBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: borderSide,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: borderSide.copyWith(width: 2.5),
            ),
            border: OutlineInputBorder(
              borderRadius: borderRadius,
              borderSide: borderSide,
            ),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
