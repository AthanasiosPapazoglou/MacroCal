import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/settings/presentation/cubit/microcal_tracking_cubit.dart';

class MicrocalTrackingSwitch extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MicrocalTrackingCubit(context.read<SettingsRepository>())..watch(),
      child: const MicrocalTrackingSwitchView(),
    );
  }
}

class MicrocalTrackingSwitchView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final enabled = context.watch<MicrocalTrackingCubit>().state;
    return SwitchListTile(
      title: Text(
        context.l10n.settingsPageTrackMicronutrients,
        style: const TextStyle(fontSize: 16, color: Colors.white),
      ),
      value: enabled ?? false,
      onChanged: enabled == null
          ? null
          : (value) => context.read<MicrocalTrackingCubit>().setEnabled(
              enabled: value,
            ),
    );
  }
}
