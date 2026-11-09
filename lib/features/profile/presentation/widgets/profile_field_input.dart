import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_field.dart';
import 'package:macro_cal_public/features/profile/presentation/profile_field_labels.dart';

class ProfileFieldInput extends StatelessWidget {
  const new({
    required this.field,
    required this.controller,
    required this.focusNode,
    required this.onSubmitted,
    super.key,
  });

  static const _radius = BorderRadius.all(Radius.circular(12));

  final ProfileField field;
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final side = BorderSide(color: Colors.green.shade500, width: 1.5);
    final border = OutlineInputBorder(borderRadius: _radius, borderSide: side);
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      validator: (value) => ProfileField.parse(value ?? '') == null
          ? l10n.profilePageInvalidNumber
          : null,
      onFieldSubmitted: (_) => onSubmitted(),
      decoration: InputDecoration(
        floatingLabelAlignment: FloatingLabelAlignment.center,
        labelText: field.label(l10n),
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: side.copyWith(width: 2.5)),
        border: border,
      ),
    );
  }
}
