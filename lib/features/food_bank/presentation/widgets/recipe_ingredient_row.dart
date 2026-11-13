import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/numeric_field.dart';

/// An ingredient of a recipe with its grams field and a remove button.
class RecipeIngredientRow extends StatefulWidget {
  const new({
    required this.name,
    required this.initialGrams,
    required this.onChanged,
    required this.onRemove,
    this.autofocus = false,
    super.key,
  });

  final String name;
  final int initialGrams;
  final ValueChanged<int> onChanged;
  final VoidCallback onRemove;
  final bool autofocus;

  @override
  State<RecipeIngredientRow> createState() => _RecipeIngredientRowState();
}

class _RecipeIngredientRowState extends State<RecipeIngredientRow> {
  late final _controller = TextEditingController(
    text: widget.initialGrams > 0 ? '${widget.initialGrams}' : '',
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const bold = TextStyle(fontWeight: FontWeight.bold);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        height: 62,
        padding: const EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 2, color: Theme.of(context).primaryColor),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.name,
                overflow: TextOverflow.ellipsis,
                style: bold.copyWith(fontSize: 14),
              ),
            ),
            Text(
              context.l10n.consumptionPageMetricsGrams,
              style: bold.copyWith(fontSize: 12),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: NumericField(
                controller: _controller,
                onChanged: widget.onChanged,
                autofocus: widget.autofocus,
              ),
            ),
            IconButton(
              onPressed: widget.onRemove,
              tooltip: MaterialLocalizations.of(context).deleteButtonTooltip,
              icon: const Icon(Icons.close_rounded),
            ),
          ],
        ),
      ),
    );
  }
}
