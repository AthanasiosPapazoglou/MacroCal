import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:macro_cal_public/features/profile/presentation/pages/profile_view.dart';

class ProfilePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = ProfileCubit(context.read<ProfileRepository>());
        unawaited(cubit.load());
        return cubit;
      },
      child: const ProfileView(),
    );
  }
}
