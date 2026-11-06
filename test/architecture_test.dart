import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  final forbidden = RegExp(
    "^import '(dart:ui|dart:io|package:flutter/|package:drift|package:http"
    '|package:macro_cal_public/app/'
    '|package:macro_cal_public/core/(?!domain/)'
    r'|package:macro_cal_public/features/\w+/(data|presentation)/)',
    multiLine: true,
  );

  List<String> offendersIn(String directory, bool Function(File) include) =>
      Directory(directory)
          .listSync(recursive: true)
          .whereType<File>()
          .where((file) => file.path.endsWith('.dart'))
          .where(include)
          .where((file) => forbidden.hasMatch(file.readAsStringSync()))
          .map((file) => file.path)
          .toList();

  test('domain layers import only plain Dart and other domain code', () {
    expect(
      offendersIn('lib/features', (file) => file.path.contains('/domain/')),
      isEmpty,
    );
  });

  test('core domain stays plain Dart', () {
    expect(offendersIn('lib/core/domain', (_) => true), isEmpty);
  });
}
