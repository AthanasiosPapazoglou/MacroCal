import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_field.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_input.dart';
import 'package:macro_cal_public/features/profile/presentation/profile_field_labels.dart';
import 'package:macro_cal_public/features/profile/presentation/widgets/profile_field_input.dart';
import 'package:macro_cal_public/features/profile/presentation/widgets/sex_selector.dart';

class ProfileForm extends StatefulWidget {
  const new({required this.initialProfile, required this.onSave, super.key});

  final Profile initialProfile;
  final ValueChanged<ProfileInput> onSave;

  @override
  State<ProfileForm> createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final Map<ProfileField, FocusNode> _focusNodes = {
    for (final field in ProfileField.values) field: FocusNode(),
  };
  late final Map<ProfileField, TextEditingController> _controllers = {
    for (final field in ProfileField.values)
      field: TextEditingController(
        text: field.read(widget.initialProfile).toString(),
      ),
  };
  late final _birthYearController = TextEditingController(
    text: widget.initialProfile.birthYear?.toString() ?? '',
  );
  final _birthYearFocusNode = FocusNode();
  late Sex? _sex = widget.initialProfile.sex;

  @override
  void dispose() {
    for (final focusNode in _focusNodes.values) {
      focusNode.dispose();
    }
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    _birthYearController.dispose();
    _birthYearFocusNode.dispose();
    super.dispose();
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    widget.onSave((
      fields: {
        for (final MapEntry(key: field, value: controller)
            in _controllers.entries)
          field: controller.text,
      },
      sex: _sex,
      birthYear: _birthYearController.text,
    ));
  }

  void _submitted(ProfileField field) {
    if (field == ProfileField.values.last) {
      _birthYearFocusNode.requestFocus();
    } else {
      _focusNodes[ProfileField.values[field.index + 1]]!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Expanded(
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (final field in ProfileField.values)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: ProfileFieldInput(
                          label: field.label(l10n),
                          controller: _controllers[field]!,
                          focusNode: _focusNodes[field]!,
                          validator: (value) =>
                              ProfileField.parse(value ?? '') == null
                              ? l10n.profilePageInvalidNumber
                              : null,
                          onSubmitted: () => _submitted(field),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        l10n.profilePageMicronutrientsHint,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: SexSelector(
                        sex: _sex,
                        onChanged: (sex) => setState(() => _sex = sex),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: ProfileFieldInput(
                        label: l10n.profilePageBirthYear,
                        controller: _birthYearController,
                        focusNode: _birthYearFocusNode,
                        decimal: false,
                        validator: (value) =>
                            BirthYear.isValid(
                              value ?? '',
                              currentYear: DateTime.now().year,
                            )
                            ? null
                            : l10n.profilePageInvalidBirthYear,
                        onSubmitted: () => _formKey.currentState!.validate(),
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
              child: Text(l10n.profilePageButtonSideActionsSaveButton),
            ),
          ),
        ],
      ),
    );
  }
}
