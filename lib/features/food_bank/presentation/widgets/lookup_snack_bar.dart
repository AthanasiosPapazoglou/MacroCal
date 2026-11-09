import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/food_bank/presentation/cubit/ingredient_form_state.dart';

/// Builds the snack bar that reports a barcode lookup [outcome].
SnackBar lookupSnackBar(BuildContext context, LookupOutcome outcome) {
  final l10n = context.l10n;
  final found = outcome == LookupOutcome.found;
  return SnackBar(
    content: Text(
      found ? l10n.snackbarProductFound : l10n.snackbarProductNotFound,
      style: found ? TextStyle(color: Theme.of(context).primaryColor) : null,
    ),
    duration: Duration(seconds: found ? 3 : 5),
    action: SnackBarAction(label: l10n.snackbarClose, onPressed: () {}),
  );
}
