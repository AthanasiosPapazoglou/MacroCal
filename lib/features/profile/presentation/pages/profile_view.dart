import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:macro_cal_public/app/router/routes.dart';
import 'package:macro_cal_public/core/l10n/l10n.dart';
import 'package:macro_cal_public/core/widgets/major_page_app_bar.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_state.dart';
import 'package:macro_cal_public/features/profile/presentation/widgets/profile_form.dart';
import 'package:macro_cal_public/features/settings/presentation/widgets/settings_drawer.dart';

class ProfileView extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listenWhen: (previous, current) =>
          current.status == ProfileStatus.saved &&
          previous.status != ProfileStatus.saved,
      listener: (context, _) => context.go(AppRoutes.today),
      child: Scaffold(
        appBar: MajorPageAppBar(title: context.l10n.profilePageTitle),
        endDrawer: const SettingsDrawer(),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          buildWhen: (previous, _) => previous.status == ProfileStatus.loading,
          builder: (context, state) => state.status == ProfileStatus.loading
              ? const SizedBox.shrink()
              : ProfileForm(
                  initialProfile: state.profile,
                  onSave: context.read<ProfileCubit>().save,
                ),
        ),
      ),
    );
  }
}
