import 'package:macro_cal_public/core/database/app_database.dart';
import 'package:macro_cal_public/core/domain/transaction_runner.dart';

class DriftTransactionRunner implements TransactionRunner {
  new(this._database);

  final AppDatabase _database;

  @override
  Future<T> run<T>(Future<T> Function() action) =>
      _database.transaction(action);
}
