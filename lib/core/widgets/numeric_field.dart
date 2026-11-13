import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumericField extends StatelessWidget {
  const new({
    required this.controller,
    required this.onChanged,
    this.maxDigits = 4,
    this.autofocus = false,
    super.key,
  });

  final TextEditingController? controller;
  final ValueChanged<int> onChanged;
  final int maxDigits;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 48,
      width: 85,
      child: Center(
        child: TextField(
          controller: controller,
          autofocus: autofocus,
          onChanged: (value) => onChanged(int.tryParse(value) ?? 0),
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(maxDigits),
          ],
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hoverColor: theme.canvasColor,
            fillColor: theme.disabledColor,
          ),
        ),
      ),
    );
  }
}
