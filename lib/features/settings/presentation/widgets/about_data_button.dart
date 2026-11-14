import 'package:flutter/material.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';

/// Opens the sources and licences of the bundled data.
class AboutDataButton extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextButton.icon(
      onPressed: () => showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(l10n.settingsPageAboutData),
          content: SingleChildScrollView(
            child: Text(l10n.settingsPageAboutDataCiqual),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(l10n.settingsPageAboutDataClose),
            ),
          ],
        ),
      ),
      icon: const Icon(Icons.info_outline),
      label: Text(l10n.settingsPageAboutData),
    );
  }
}
