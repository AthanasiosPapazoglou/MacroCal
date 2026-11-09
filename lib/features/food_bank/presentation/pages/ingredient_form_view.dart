import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_field.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/ingredient_field_input.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/lookup_snack_bar.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/scan_barcode_button.dart';

class IngredientFormView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IngredientFormCubit, IngredientFormState>(
      buildWhen: (previous, _) =>
          previous.status == IngredientFormStatus.loading,
      builder: (context, state) => state.status == IngredientFormStatus.loading
          ? const Scaffold()
          : _IngredientForm(
              initialValues: state.values,
              isEdit: context.read<IngredientFormCubit>().isEdit,
              uncategorisedLabel: context.l10n.ingredientsPageUncategorised,
            ),
    );
  }
}

class _IngredientForm extends StatefulWidget {
  const new({
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
  final Map<IngredientField, FocusNode> _focusNodes = {
    for (final field in IngredientField.values) field: FocusNode(),
  };
  late final Map<IngredientField, TextEditingController> _controllers = {
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
    final outcome = state.lookupOutcome ?? LookupOutcome.notFound;
    if (outcome == LookupOutcome.found) {
      for (final MapEntry(key: field, value: text)
          in state.scannedValues.entries) {
        _controllers[field]!.text = text;
      }
    }
    ScaffoldMessenger.of(context)
        .showSnackBar(lookupSnackBar(context, outcome));
  }

  void _submitted(IngredientField field) {
    if (field == IngredientField.values.last) {
      _formKey.currentState!.validate();
    } else {
      _focusNodes[IngredientField.values[field.index + 1]]!.requestFocus();
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    await context.read<IngredientFormCubit>().save({
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
    final l10n = context.l10n;
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
                ? l10n.ingredientsPageTitlesEdit
                : l10n.ingredientsPageTitlesAdd,
            style: AppTextStyles.appBarTitle,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            if (!widget.isEdit)
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: ScanBarcodeButton(onPressed: _scanProduct),
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: IngredientFieldInput(
                              field: field,
                              controller: _controllers[field]!,
                              focusNode: _focusNodes[field]!,
                              onSubmitted: () => _submitted(field),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: ElevatedButton(
                  onPressed: _save,
                  child: Text(l10n.ingredientsPageBottomSideActionsSaveButton),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
