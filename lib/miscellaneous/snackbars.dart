import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:macro_cal_public/miscellaneous/locale_consts.dart';
import 'package:macro_cal_public/themes/app_themes.dart';

SnackBar productFoundSnackbar() => SnackBar(
      content: Text(
        LocaleConsts.snackbarProductFound.tr(),
        style: TextStyle(color: AppThemes.darkTheme.primaryColor),
      ),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: LocaleConsts.snackbarClose.tr(),
        onPressed: () {},
      ),
    );

SnackBar noProductFoundSnackbar() => SnackBar(
      content: Text(LocaleConsts.snackbarProductNotFound.tr()),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: LocaleConsts.snackbarClose.tr(),
        onPressed: () {},
      ),
    );
