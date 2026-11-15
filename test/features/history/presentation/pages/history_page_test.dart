import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/history/domain/entities/day_log.dart';
import 'package:macro_cal_public/features/history/domain/repositories/history_repository.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/history_cubit.dart';
import 'package:macro_cal_public/features/history/presentation/cubit/history_state.dart';
import 'package:macro_cal_public/features/history/presentation/pages/history_page.dart';
import 'package:macro_cal_public/features/history/presentation/pages/history_view.dart';
import 'package:macro_cal_public/features/settings/domain/repositories/settings_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../helpers/pump_localized.dart';

class _MockHistoryRepository extends Mock implements HistoryRepository;

class _MockSettingsRepository extends Mock implements SettingsRepository;

void main() {
  testWidgets('provides a history cubit that watches the day logs', (
    tester,
  ) async {
    final repository = _MockHistoryRepository();
    when(repository.watchDayLogs)
        .thenAnswer((_) => Stream.value(const <DayLog>[]));
    final settings = _MockSettingsRepository();
    when(settings.watchMicrocalEnabled).thenAnswer((_) => Stream.value(true));

    await pumpLocalized(
      tester,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<HistoryRepository>.value(value: repository),
          RepositoryProvider<SettingsRepository>.value(value: settings),
        ],
        child: const HistoryPage(),
      ),
    );

    final cubit = tester.element(find.byType(HistoryView)).read<HistoryCubit>();

    await tester.pump();

    expect(cubit.state.status, HistoryStatus.ready);
    expect(cubit.state.microcalEnabled, isTrue);
    verify(repository.watchDayLogs).called(1);
  });
}
