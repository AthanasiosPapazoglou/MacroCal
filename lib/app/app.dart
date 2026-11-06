import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/app/view/app_view.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/settings/domain/entities/app_language.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/settings/presentation/cubit/locale_cubit.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_cubit.dart';

class App extends StatelessWidget {
  const new({
    required this.settingsRepository,
    required this.profileRepository,
    required this.activityRepository,
    required this.initialLanguage,
    super.key,
  });

  final SettingsRepository settingsRepository;
  final ProfileRepository profileRepository;
  final ActivityRepository activityRepository;
  final AppLanguage initialLanguage;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: settingsRepository),
        RepositoryProvider.value(value: profileRepository),
        RepositoryProvider.value(value: activityRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => LocaleCubit(settingsRepository, initialLanguage),
          ),
          BlocProvider(
            create: (_) =>
                OverviewCubit(profileRepository, activityRepository)..watch(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}
