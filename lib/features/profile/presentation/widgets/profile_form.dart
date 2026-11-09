import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_field.dart';
import 'package:macro_cal_public/features/profile/presentation/widgets/profile_field_input.dart';

class ProfileForm extends StatefulWidget {
  const new({required this.initialProfile, required this.onSave, super.key});

  final Profile initialProfile;
  final ValueChanged<Map<ProfileField, String>> onSave;

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

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    widget.onSave({
      for (final MapEntry(key: field, value: controller)
          in _controllers.entries)
        field: controller.text,
    });
  }

  void _submitted(ProfileField field) {
    if (field == ProfileField.values.last) {
      _formKey.currentState!.validate();
    } else {
      _focusNodes[ProfileField.values[field.index + 1]]!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
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
              child: Text(context.l10n.profilePageButtonSideActionsSaveButton),
            ),
          ),
        ],
      ),
    );
  }
}
