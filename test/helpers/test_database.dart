import 'package:drift/native.dart';
import 'package:macro_cal_public/core/database/app_database.dart';

AppDatabase createTestDatabase() => AppDatabase(NativeDatabase.memory());
