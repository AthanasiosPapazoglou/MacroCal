import 'package:drift/drift.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/features/profile/domain/entities/nutrition_goals.dart';
import 'package:macro_cal_public/features/profile/domain/entities/profile.dart';
import 'package:macro_cal_public/features/profile/domain/repositories/profile_repository.dart';

class DriftProfileRepository implements ProfileRepository {
  new(this._database);

  static const _rowId = 1;

  final AppDatabase _database;

  @override
  Stream<Profile> watchProfile() {
    final query = _database.select(_database.profileTable)
      ..where((profile) => profile.id.equals(_rowId));
    return query.watchSingleOrNull().map(
      (row) => row == null ? const Profile() : _toEntity(row),
    );
  }

  @override
  Future<void> saveProfile(Profile profile) => _database
      .into(_database.profileTable)
      .insertOnConflictUpdate(_toCompanion(profile));

  Profile _toEntity(ProfileRow row) => Profile(
    goals: NutritionGoals(
      dailyKcal: row.dailyKcal,
      proteinG: row.proteinG,
      fiberG: row.fiberG,
      sugarLimitPct: row.sugarLimitPct,
      saturatedLimitPct: row.saturatedLimitPct,
      saltLimitMg: row.saltLimitMg,
    ),
    weightKg: row.weightKg,
    heightCm: row.heightCm,
  );

  ProfileTableCompanion _toCompanion(Profile profile) => ProfileTableCompanion(
    id: const Value(_rowId),
    dailyKcal: Value(profile.goals.dailyKcal),
    proteinG: Value(profile.goals.proteinG),
    fiberG: Value(profile.goals.fiberG),
    sugarLimitPct: Value(profile.goals.sugarLimitPct),
    saturatedLimitPct: Value(profile.goals.saturatedLimitPct),
    saltLimitMg: Value(profile.goals.saltLimitMg),
    weightKg: Value(profile.weightKg),
    heightCm: Value(profile.heightCm),
  );
}
