import 'package:drift/native.dart';
import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/core/database/seed/ingredient_seed.dart';

AppDatabase createTestDatabase({IngredientSeedLoader? ingredientSeeds}) =>
    AppDatabase(NativeDatabase.memory(), ingredientSeeds);
