import 'package:flutter/material.dart';
import 'package:macro_cal_public/themes/app_themes.dart';

final kInvalidEmailFormSnackbar = SnackBar(
  content: const Text('Error: Invalid email form'),
  duration: const Duration(seconds: 3),
  action: SnackBarAction(
    label: 'Close',
    onPressed: () {},
  ),
);

final kInsufficientCredentialSnackbar = SnackBar(
  content: const Text('Please provide input to both fields'),
  duration: const Duration(seconds: 3),
  action: SnackBarAction(
    label: 'Close',
    onPressed: () {},
  ),
);

final kSuccessfulUserRegistration = SnackBar(
  content: const Text('New user has been successfully added'),
  duration: const Duration(seconds: 3),
  action: SnackBarAction(
    label: 'Close',
    onPressed: () {},
  ),
);

final kProductFoundSnackbar = SnackBar(
  content: Text(
    'Scanned Product has been registered successfully',
    style: TextStyle(color: AppThemes.darkTheme.primaryColor),
  ),
  duration: const Duration(seconds: 3),
  action: SnackBarAction(
    label: 'Close',
    onPressed: () {},
  ),
);

final kNoProductFoundSnackbar = SnackBar(
  content: const Text(
      'No product found or there has been an error in the connection'),
  duration: const Duration(seconds: 5),
  action: SnackBarAction(
    label: 'Close',
    onPressed: () {},
  ),
);
