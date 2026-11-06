import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:macro_cal_public/app/view/app_view.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/ingredient_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/product_lookup_repository.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/settings/domain/entities/app_language.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/settings/presentation/cubit/locale_cubit.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_cubit.dart';

class App extends StatelessWidget {
  const new({
    required this.settingsRepository,
    required this.profileRepository,
    required this.activityRepository,
    required this.foodLogRepository,
    required this.ingredientRepository,
    required this.productLookupRepository,
    required this.initialLanguage,
    super.key,
  });

  final SettingsRepository settingsRepository;
  final ProfileRepository profileRepository;
  final ActivityRepository activityRepository;
  final FoodLogRepository foodLogRepository;
  final IngredientRepository ingredientRepository;
  final ProductLookupRepository productLookupRepository;
  final AppLanguage initialLanguage;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: settingsRepository),
        RepositoryProvider.value(value: profileRepository),
        RepositoryProvider.value(value: activityRepository),
        RepositoryProvider.value(value: foodLogRepository),
        RepositoryProvider.value(value: ingredientRepository),
        RepositoryProvider.value(value: productLookupRepository),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => LocaleCubit(settingsRepository, initialLanguage),
          ),
          BlocProvider(
            create: (_) => OverviewCubit(
              profileRepository,
              activityRepository,
              foodLogRepository,
            )..watch(),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}
