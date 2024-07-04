import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

getFlag(value) {
  if (value == 'en') {
    return Flag.fromCode(
      FlagsCode.GB_ENG,
    );
  } else {
    return Flag.fromCode(
      FlagsCode.GR,
    );
  }
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  String language = Get.locale == const Locale('en', 'US') ? 'en' : 'gr';

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<String>.rolling(
      current: language,
      values: const ['gr', 'en'],
      iconBuilder: (value, selected) {
        return Padding(
          padding: const EdgeInsets.all(8),
          child: getFlag(value),
        );
      },
      onChanged: (v) {
        if (EasyLocalization.of(context)!.currentLocale ==
            const Locale('en', 'US')) {
          EasyLocalization.of(context)!.setLocale(
            const Locale('el', 'GR'),
          );
          Get.updateLocale(
            const Locale('el', 'GR'),
          );
        } else {
          EasyLocalization.of(context)!.setLocale(
            const Locale('en', 'US'),
          );
          Get.updateLocale(
            const Locale('en', 'US'),
          );
        }
        setState(() => language = v);
      },
    );
  }
}
