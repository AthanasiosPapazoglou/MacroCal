import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('domain layers import only plain Dart and other domain code', () {
    final forbidden = RegExp(
      "^import '(dart:ui|dart:io|package:flutter/|package:drift|package:http"
      '|package:macro_cal_public/(core|app)/'
      r'|package:macro_cal_public/features/\w+/(data|presentation)/)',
      multiLine: true,
    );

    final offenders = Directory('lib/features')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.contains('/domain/'))
        .where((file) => file.path.endsWith('.dart'))
        .where((file) => forbidden.hasMatch(file.readAsStringSync()))
        .map((file) => file.path)
        .toList();

    expect(offenders, isEmpty);
  });
}
