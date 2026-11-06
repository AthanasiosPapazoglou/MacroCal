import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flag/flag_enum.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/settings/domain/entities/app_language.dart';
import 'package:macro_cal_public/features/settings/presentation/cubit/locale_cubit.dart';

class LanguageSwitch extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedToggleSwitch<AppLanguage>.rolling(
      current: context.watch<LocaleCubit>().state,
      values: const [AppLanguage.greek, AppLanguage.english],
      iconBuilder: (language, _) => Padding(
        padding: const EdgeInsets.all(8),
        child: Flag.fromCode(
          language == AppLanguage.english ? FlagsCode.GB_ENG : FlagsCode.GR,
        ),
      ),
      onChanged: context.read<LocaleCubit>().select,
    );
  }
}
