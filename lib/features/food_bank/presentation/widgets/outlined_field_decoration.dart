import 'package:flutter/material.dart';

/// The green rounded outline of the food bank form fields.
InputDecoration outlinedFieldDecoration({required String label, String? hint}) {
  final side = BorderSide(color: Colors.green.shade500, width: 1.5);
  final border = OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(12)),
    borderSide: side,
  );
  return InputDecoration(
    floatingLabelAlignment: FloatingLabelAlignment.center,
    labelText: label,
    hintText: hint,
    enabledBorder: border,
    focusedBorder: border.copyWith(borderSide: side.copyWith(width: 2.5)),
    border: border,
  );
}
