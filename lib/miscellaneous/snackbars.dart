import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

SnackBar productFoundSnackbar(AppLocalizations l10n, Color textColor) => SnackBar(
      content: Text(
        l10n.snackbarProductFound,
        style: TextStyle(color: textColor),
      ),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: l10n.snackbarClose,
        onPressed: () {},
      ),
    );

SnackBar noProductFoundSnackbar(AppLocalizations l10n) => SnackBar(
      content: Text(l10n.snackbarProductNotFound),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: l10n.snackbarClose,
        onPressed: () {},
      ),
    );
