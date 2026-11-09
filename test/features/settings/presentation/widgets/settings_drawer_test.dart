import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/core/widgets/major_page_app_bar.dart';
import 'package:macro_cal_public/features/settings/domain/entities/app_language.dart';
import 'package:macro_cal_public/features/settings/presentation/cubit/locale_cubit.dart';
import 'package:macro_cal_public/features/settings/presentation/widgets/language_switch.dart';
import 'package:macro_cal_public/features/settings/presentation/widgets/settings_drawer.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pump_localized.dart';

class _MockLocaleCubit extends Mock implements LocaleCubit;

void main() {
  late LocaleCubit cubit;

  setUpAll(() => registerFallbackValue(AppLanguage.english));

  setUp(() {
    cubit = _MockLocaleCubit();
    when(() => cubit.state).thenReturn(AppLanguage.english);
    when(() => cubit.stream).thenAnswer((_) => const Stream.empty());
    when(cubit.close).thenAnswer((_) async {});
    when(() => cubit.select(any())).thenAnswer((_) async {});
  });

  Future<void> openDrawer(WidgetTester tester) async {
    await pumpLocalized(
      tester,
      home: BlocProvider.value(
        value: cubit,
        child: const Scaffold(
          appBar: MajorPageAppBar(title: 'Title'),
          endDrawer: SettingsDrawer(),
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

  testWidgets('choosing the Greek flag selects Greek', (tester) async {
    await openDrawer(tester);

    await tester.tap(find.byType(Flag).first);
    await tester.pumpAndSettle();

    verify(() => cubit.select(AppLanguage.greek)).called(1);
  });
}
