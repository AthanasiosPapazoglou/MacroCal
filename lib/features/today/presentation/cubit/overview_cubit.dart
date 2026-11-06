import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity_entry.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
import 'package:macro_cal_public/features/today/domain/repositories/activity_repository.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';
import 'package:macro_cal_public/features/today/domain/services/nutrition_calculator.dart';
import 'package:macro_cal_public/features/today/presentation/cubit/overview_state.dart';

class OverviewCubit extends Cubit<OverviewState> {
  new(
    this._profileRepository,
    this._activityRepository,
    this._foodLogRepository,
  ) : super(
        OverviewState(
          summary: _calculator.summarize(
            goals: const NutritionGoals(),
            foodEntries: const [],
            activityEntries: const [],
          ),
        ),
      );

  static const _calculator = NutritionCalculator();

  final ProfileRepository _profileRepository;
  final ActivityRepository _activityRepository;
  final FoodLogRepository _foodLogRepository;
  final _subscriptions = <StreamSubscription<Object?>>[];
  NutritionGoals _goals = const NutritionGoals();
  List<ActivityEntry> _activityEntries = const [];
  List<FoodEntry> _foodEntries = const [];

  void watch() {
    if (_subscriptions.isNotEmpty) return;
    _subscriptions.addAll([
      _profileRepository.watchProfile().listen((profile) {
        _goals = profile.goals;
        _emitSummary();
      }, onError: _onError),
      _activityRepository.watchEntries().listen((entries) {
        _activityEntries = entries;
        _emitSummary();
      }, onError: _onError),
      _foodLogRepository.watchEntries().listen((entries) {
        _foodEntries = entries;
        _emitSummary();
      }, onError: _onError),
    ]);
  }

  void _emitSummary() => emit(
    OverviewState(
      status: OverviewStatus.ready,
      summary: _calculator.summarize(
        goals: _goals,
        foodEntries: _foodEntries,
        activityEntries: _activityEntries,
      ),
    ),
  );

  void _onError(Object _) =>
      emit(state.copyWith(status: OverviewStatus.failure));

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    await super.close();
  }
}
