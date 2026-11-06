import 'package:drift/drift.dart';

Future<void> seedDefaultActivities<T extends Table, D>(
  GeneratedDatabase database,
  TableInfo<T, D> activities,
) => database
    .into(activities)
    .insert(
      RawValuesInsertable<D>({
        'preset_key': const Variable('walking'),
        'name': const Variable('Walking'),
        'kcal_per_unit': const Variable(50),
        'unit_label': const Variable('Kilometers'),
        'is_duration_based': const Variable(false),
      }),
    );
