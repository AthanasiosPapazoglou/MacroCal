import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/widgets/major_page_app_bar.dart';
import 'package:macro_cal_public/features/settings/domain/entities/app_language.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:macro_cal_public/features/settings/presentation/cubit/locale_cubit.dart';
import 'package:macro_cal_public/features/settings/presentation/widgets/language_switch.dart';
import 'package:macro_cal_public/features/settings/presentation/widgets/settings_drawer.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pump_localized.dart';

class _MockLocaleCubit extends Mock implements LocaleCubit;

class _MockSettingsRepository extends Mock implements SettingsRepository;

void main() {
  late LocaleCubit cubit;
  late SettingsRepository settings;

  setUpAll(() => registerFallbackValue(AppLanguage.english));

  setUp(() {
    cubit = _MockLocaleCubit();
    when(() => cubit.state).thenReturn(AppLanguage.english);
    when(() => cubit.stream).thenAnswer((_) => const Stream.empty());
    when(cubit.close).thenAnswer((_) async {});
    when(() => cubit.select(any())).thenAnswer((_) async {});
    settings = _MockSettingsRepository();
    when(settings.watchMicrocalEnabled).thenAnswer((_) => Stream.value(false));
    when(() => settings.saveMicrocalEnabled(enabled: any(named: 'enabled')))
        .thenAnswer((_) async {});
  });

  Future<void> openDrawer(WidgetTester tester) async {
    await pumpLocalized(
      tester,
      home: RepositoryProvider.value(
        value: settings,
        child: BlocProvider.value(
          value: cubit,
          child: const Scaffold(
            appBar: MajorPageAppBar(title: 'Title'),
            endDrawer: SettingsDrawer(),
          ),
        ),
      ),
    );
    await tester.tap(find.byIcon(Icons.settings_rounded));
    await tester.pumpAndSettle();
  }

  testWidgets('the app bar settings button opens the language drawer', (
    tester,
  ) async {
    await openDrawer(tester);

    expect(find.text('Language'), findsOneWidget);
    expect(find.byType(LanguageSwitch), findsOneWidget);
  });

  testWidgets('about the data names the food table and its licence', (
    tester,
  ) async {
    await openDrawer(tester);

    await tester.tap(find.text('About the data'));
    await tester.pumpAndSettle();

    expect(find.textContaining('ANSES-CIQUAL 2025'), findsOneWidget);
    expect(find.textContaining('Open Licence 2.0'), findsOneWidget);

    await tester.tap(find.text('Close'));
    await tester.pumpAndSettle();
    expect(find.textContaining('ANSES-CIQUAL 2025'), findsNothing);
  });

  testWidgets('choosing the Greek flag selects Greek', (tester) async {
    await openDrawer(tester);

    await tester.tap(find.byType(Flag).first);
    await tester.pumpAndSettle();

    verify(() => cubit.select(AppLanguage.greek)).called(1);
  });

  testWidgets('micronutrient tracking shows the stored setting and saves it', (
    tester,
  ) async {
    await openDrawer(tester);

    final tile = find.widgetWithText(SwitchListTile, 'Track micronutrients');
    expect(tester.widget<SwitchListTile>(tile).value, isFalse);

    await tester.tap(tile);
    await tester.pumpAndSettle();

    expect(tester.widget<SwitchListTile>(tile).value, isTrue);
    verify(() => settings.saveMicrocalEnabled(enabled: true)).called(1);
  });
}
