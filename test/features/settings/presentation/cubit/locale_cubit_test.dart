import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/settings/domain/entities/app_language.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/settings/presentation/cubit/locale_cubit.dart';
import 'package:mocktail/mocktail.dart';

class _MockSettingsRepository extends Mock implements SettingsRepository;

void main() {
  late SettingsRepository repository;

  setUpAll(() => registerFallbackValue(AppLanguage.english));

  setUp(() {
    repository = _MockSettingsRepository();
    when(() => repository.saveLanguage(any())).thenAnswer((_) async {});
  });

  test('starts with the initial language', () {
    final cubit = LocaleCubit(repository, AppLanguage.greek);
    addTearDown(cubit.close);

    expect(cubit.state, AppLanguage.greek);
  });

  test('select emits the language and saves it', () async {
    final cubit = LocaleCubit(repository, AppLanguage.english);
    addTearDown(cubit.close);

    final emitted = expectLater(cubit.stream, emits(AppLanguage.greek));
    await cubit.select(AppLanguage.greek);
    await emitted;

    expect(cubit.state, AppLanguage.greek);
    verify(() => repository.saveLanguage(AppLanguage.greek)).called(1);
  });

  test('select ignores the current language', () async {
    final cubit = LocaleCubit(repository, AppLanguage.english);
    addTearDown(cubit.close);

    await cubit.select(AppLanguage.english);

    verifyNever(() => repository.saveLanguage(any()));
  });
}
