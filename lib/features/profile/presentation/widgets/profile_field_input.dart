import 'package:flutter/material.dart';

class ProfileFieldInput extends StatelessWidget {
  const new({
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.validator,
    required this.onSubmitted,
    this.decimal = true,
    super.key,
  });

  static const _radius = BorderRadius.all(Radius.circular(12));

  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FormFieldValidator<String> validator;
  final VoidCallback onSubmitted;
  final bool decimal;

  @override
  Widget build(BuildContext context) {
    final side = BorderSide(color: Colors.green.shade500, width: 1.5);
    final border = OutlineInputBorder(borderRadius: _radius, borderSide: side);
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.numberWithOptions(decimal: decimal),
      validator: validator,
      onFieldSubmitted: (_) => onSubmitted(),
      decoration: InputDecoration(
        floatingLabelAlignment: FloatingLabelAlignment.center,
        labelText: label,
        enabledBorder: border,
        focusedBorder: border.copyWith(borderSide: side.copyWith(width: 2.5)),
        border: border,
      ),
    );
  }
}
