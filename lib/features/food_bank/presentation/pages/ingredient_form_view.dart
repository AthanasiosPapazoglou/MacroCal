import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_field.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/micronutrient_labels.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/ingredient_field_input.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/lookup_snack_bar.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/micronutrient_input.dart';
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
              initialMicroValues: state.microValues,
              showMicros: state.showMicros,
              isEdit: context.read<IngredientFormCubit>().isEdit,
              uncategorisedLabel: context.l10n.ingredientsPageUncategorised,
            ),
    );
  }
}

class _IngredientForm extends StatefulWidget {
  const new({
    required this.initialValues,
    required this.initialMicroValues,
    required this.showMicros,
    required this.isEdit,
    required this.uncategorisedLabel,
  });

  final Map<IngredientField, String> initialValues;
  final Map<Micronutrient, String> initialMicroValues;
  final bool showMicros;
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
  final Map<Micronutrient, FocusNode> _microFocusNodes = {
    for (final nutrient in Micronutrient.values) nutrient: FocusNode(),
  };
  late final Map<Micronutrient, TextEditingController> _microControllers = {
    for (final nutrient in Micronutrient.values)
      nutrient: TextEditingController(
        text: widget.initialMicroValues[nutrient] ?? '',
      ),
  };

  String _initialText(IngredientField field) {
    final value = widget.initialValues[field] ?? '';
    return field == IngredientField.category && value.isEmpty
        ? widget.uncategorisedLabel
        : value;
  }

  @override
  void dispose() {
    for (final focusNode in [
      ..._focusNodes.values,
      ..._microFocusNodes.values,
    ]) {
      focusNode.dispose();
    }
    for (final controller in [
      ..._controllers.values,
      ..._microControllers.values,
    ]) {
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
      for (final MapEntry(key: nutrient, value: controller)
          in _microControllers.entries) {
        controller.text = state.scannedMicroValues[nutrient] ?? '';
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

  void _microSubmitted(Micronutrient nutrient) {
    if (nutrient == Micronutrient.values.last) {
      _formKey.currentState!.validate();
    } else {
      _microFocusNodes[Micronutrient.values[nutrient.index + 1]]!
          .requestFocus();
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    await context.read<IngredientFormCubit>().save(
      {
        for (final MapEntry(key: field, value: controller)
            in _controllers.entries)
          field:
              field == IngredientField.category &&
                  controller.text == widget.uncategorisedLabel
              ? ''
              : controller.text,
      },
      micros: {
        for (final MapEntry(key: nutrient, value: controller)
            in _microControllers.entries)
          nutrient: controller.text,
      },
    );
  }

  Widget _microSection(AppLocalizations l10n) => ExpansionTile(
    tilePadding: EdgeInsets.zero,
    childrenPadding: EdgeInsets.zero,
    title: Text(l10n.micronutrientsPer100g),
    subtitle: Text(l10n.micronutrientsFormHint),
    children: [
      for (final group in MicronutrientGroup.values) ...[
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Text(
            group.title(l10n),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        for (final nutrient in group.members)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: MicronutrientInput(
              nutrient: nutrient,
              controller: _microControllers[nutrient]!,
              focusNode: _microFocusNodes[nutrient]!,
              onSubmitted: () => _microSubmitted(nutrient),
            ),
          ),
      ],
    ],
  );

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
                        if (widget.showMicros) _microSection(l10n),
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
