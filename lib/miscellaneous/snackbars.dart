import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/themes/app_themes.dart';

SnackBar productFoundSnackbar(AppLocalizations l10n) => SnackBar(
      content: Text(
        l10n.snackbarProductFound,
        style: TextStyle(color: AppThemes.darkTheme.primaryColor),
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
