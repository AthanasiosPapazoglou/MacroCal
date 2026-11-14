import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/theme/app_text_styles.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/supplement.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_form_cubit.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/supplement_form_state.dart';
import 'package:macro_cal_public/features/food_bank/presentation/micronutrient_labels.dart';
import 'package:macro_cal_public/features/food_bank/presentation/supplement_unit_labels.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/micronutrient_input.dart';
import 'package:macro_cal_public/features/food_bank/presentation/widgets/outlined_field_decoration.dart';

class SupplementFormView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupplementFormCubit, SupplementFormState>(
      buildWhen: (previous, _) =>
          previous.status == SupplementFormStatus.loading,
      builder: (context, state) => state.status == SupplementFormStatus.loading
          ? const Scaffold()
          : _SupplementForm(initial: state),
    );
  }
}

class _SupplementForm extends StatefulWidget {
  const new({required this.initial});

  final SupplementFormState initial;

  @override
  State<_SupplementForm> createState() => _SupplementFormState();
}

class _SupplementFormState extends State<_SupplementForm> {
  final _formKey = GlobalKey<FormState>();
  late final _nameController = TextEditingController(text: widget.initial.name);
  final Map<Micronutrient, FocusNode> _focusNodes = {
    for (final nutrient in Micronutrient.values) nutrient: FocusNode(),
  };
  late final Map<Micronutrient, TextEditingController> _controllers = {
    for (final nutrient in Micronutrient.values)
      nutrient: TextEditingController(
        text: widget.initial.microValues[nutrient] ?? '',
      ),
  };

  SupplementFormCubit get _cubit => context.read<SupplementFormCubit>();

  @override
  void dispose() {
    _nameController.dispose();
    for (final focusNode in _focusNodes.values) {
      focusNode.dispose();
    }
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _submitted(Micronutrient nutrient) {
    if (nutrient == Micronutrient.values.last) {
      _formKey.currentState!.validate();
    } else {
      _focusNodes[Micronutrient.values[nutrient.index + 1]]!.requestFocus();
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    await _cubit.save(
      name: _nameController.text,
      micros: {
        for (final MapEntry(key: nutrient, value: controller)
            in _controllers.entries)
          nutrient: controller.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = Theme.of(context).textTheme;
    return BlocListener<SupplementFormCubit, SupplementFormState>(
      listenWhen: (_, current) => current.status == SupplementFormStatus.saved,
      listener: (context, _) => context.pop(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            _cubit.isEdit
                ? l10n.supplementFormTitleEdit
                : l10n.supplementFormTitleAdd,
            style: AppTextStyles.appBarTitle,
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: TextFormField(
                          controller: _nameController,
                          validator: (value) => (value ?? '').trim().isEmpty
                              ? l10n.ingredientsPageNameRequired
                              : null,
                          decoration: outlinedFieldDecoration(
                            label: l10n.supplementFormName,
                          ),
                        ),
                      ),
                      Text(
                        l10n.supplementFormUnit,
                        style: textTheme.titleMedium,
                      ),
                      BlocBuilder<SupplementFormCubit, SupplementFormState>(
                        buildWhen: (previous, current) =>
                            previous.unit != current.unit,
                        builder: (context, state) => Wrap(
                          spacing: 8,
                          children: [
                            for (final unit in SupplementUnit.values)
                              ChoiceChip(
                                label: Text(unit.title(l10n)),
                                selected: state.unit == unit,
                                onSelected: (_) => _cubit.selectUnit(unit),
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          l10n.supplementMicrosPerUnit,
                          style: textTheme.titleLarge,
                        ),
                      ),
                      Text(l10n.micronutrientsFormHint),
                      for (final group in MicronutrientGroup.values) ...[
                        Padding(
                          padding: const EdgeInsets.only(top: 12),
                          child: Text(
                            group.title(l10n),
                            style: textTheme.titleMedium,
                          ),
                        ),
                        for (final nutrient in group.members)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: MicronutrientInput(
                              nutrient: nutrient,
                              controller: _controllers[nutrient]!,
                              focusNode: _focusNodes[nutrient]!,
                              onSubmitted: () => _submitted(nutrient),
                            ),
                          ),
                      ],
                    ],
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
