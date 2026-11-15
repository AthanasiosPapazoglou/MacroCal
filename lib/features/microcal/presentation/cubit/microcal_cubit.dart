import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:macro_cal_public/core/domain/date_only.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/microcal/domain/services/micro_intake_calculator.dart';
import 'package:macro_cal_public/features/microcal/domain/services/reference_intakes.dart';
import 'package:macro_cal_public/features/microcal/presentation/cubit/microcal_state.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/today/domain/entities/food_entry.dart';
import 'package:macro_cal_public/features/today/domain/entities/supplement_entry.dart';
import 'package:macro_cal_public/features/today/domain/repositories/food_log_repository.dart';

/// Today's log and the archived days of the last week, compared with the
/// profile's reference intakes.
class MicroCalCubit extends Cubit<MicroCalState> {
  new(
    this._profileRepository,
    this._foodLogRepository,
    this._historyRepository,
    this._settingsRepository, {
    this._now = DateTime.now,
  }) : super(const MicroCalState());

  static const _calculator = MicroIntakeCalculator();
  static const _referenceIntakes = ReferenceIntakes();
  static const _weekDays = 7;

  final ProfileRepository _profileRepository;
  final FoodLogRepository _foodLogRepository;
  final HistoryRepository _historyRepository;
  final SettingsRepository _settingsRepository;
  final DateTime Function() _now;
  final _subscriptions = <StreamSubscription<Object?>>[];
  Profile? _profile;
  List<FoodEntry>? _foodEntries;
  List<SupplementEntry>? _supplementEntries;
  List<DayLog>? _dayLogs;
  bool? _enabled;

  void watch() {
    if (_subscriptions.isNotEmpty) return;
    _subscriptions.addAll([
      _profileRepository.watchProfile().listen((profile) {
        _profile = profile;
        _emitReport();
      }, onError: _onError),
      _foodLogRepository.watchEntries().listen((entries) {
        _foodEntries = entries;
        _emitReport();
      }, onError: _onError),
      _foodLogRepository.watchSupplementEntries().listen((entries) {
        _supplementEntries = entries;
        _emitReport();
      }, onError: _onError),
      _historyRepository.watchDayLogs().listen((logs) {
        _dayLogs = logs;
        _emitReport();
      }, onError: _onError),
      _settingsRepository.watchMicrocalEnabled().listen((enabled) {
        _enabled = enabled;
        _emitReport();
      }, onError: _onError),
    ]);
  }

  void selectPeriod(MicroCalPeriod period) =>
      emit(state.copyWith(period: period));

  List<MicroContributor> contributorsOf(Micronutrient nutrient) =>
      _calculator.contributors(
        nutrient,
        foodEntries: _foodEntries ?? const [],
        supplementEntries: _supplementEntries ?? const [],
      );

  void _emitReport() {
    if ((_profile, _foodEntries, _supplementEntries, _dayLogs, _enabled) case (
      final profile?,
      final foodEntries?,
      final supplementEntries?,
      final dayLogs?,
      final enabled?,
    )) {
      final today = _now().dateOnly;
      final since = DateTime(
        today.year,
        today.month,
        today.day - _weekDays + 1,
      );
      final todayIntake = _calculator.intake(
        foodEntries: foodEntries,
        supplementEntries: supplementEntries,
      );
      final weekLogs = dayLogs.where(
        (log) => !log.date.isBefore(since) && !log.date.isAfter(today),
      );
      final days = [
        for (final log in weekLogs) ?log.micros,
        if (todayIntake.hasData &&
            !weekLogs.any((log) => log.date.dateOnly == today))
          todayIntake,
      ];
      final age = profile.ageOn(today);
      emit(
        state.copyWith(
          status: MicroCalStatus.ready,
          enabled: enabled,
          today: todayIntake,
          week: _calculator.average(days),
          weekDays: days.length,
          sex: profile.sex,
          age: age,
          references: _referenceIntakes.forPerson(
            energyKcal: profile.goals.dailyKcal,
            sex: profile.sex,
            age: age,
          ),
        ),
      );
    }
  }

  void _onError(Object _) =>
      emit(state.copyWith(status: MicroCalStatus.failure));

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    await super.close();
  }
}
