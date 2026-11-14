import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/settings/presentation/cubit/microcal_tracking_cubit.dart';
import 'package:mocktail/mocktail.dart';

class _MockSettingsRepository extends Mock implements SettingsRepository;

void main() {
  late SettingsRepository repository;
  late StreamController<bool> stored;
  late MicrocalTrackingCubit cubit;

  setUp(() {
    repository = _MockSettingsRepository();
    stored = StreamController<bool>.broadcast();
    when(repository.watchMicrocalEnabled).thenAnswer((_) => stored.stream);
    when(() => repository.saveMicrocalEnabled(enabled: any(named: 'enabled')))
        .thenAnswer((_) async {});
    cubit = MicrocalTrackingCubit(repository);
  });
  tearDown(() async {
    await cubit.close();
    await stored.close();
  });

  test('is unknown until the setting is read', () {
    expect(cubit.state, isNull);
  });

  test('watch follows the stored setting', () async {
    cubit.watch();
    final emitted = expectLater(cubit.stream, emitsInOrder([false, true]));

    stored
      ..add(false)
      ..add(true);
    await emitted;
  });

  test('setEnabled emits at once and saves', () async {
    await cubit.setEnabled(enabled: true);

    expect(cubit.state, isTrue);
    verify(() => repository.saveMicrocalEnabled(enabled: true)).called(1);
  });

  test('setEnabled goes back when saving fails', () async {
    when(() => repository.saveMicrocalEnabled(enabled: any(named: 'enabled')))
        .thenThrow(Exception('db'));
    final emitted = expectLater(cubit.stream, emitsInOrder([true, false]));

    await cubit.setEnabled(enabled: true);
    await emitted;
  });
}
