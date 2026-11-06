import 'package:freezed_annotation/freezed_annotation.dart';

part 'archive_day_state.freezed.dart';

enum ArchiveDayStatus { checking, ready, archiving, archived, failure }

@freezed
abstract class ArchiveDayState with _$ArchiveDayState {
  const factory({
    required DateTime selectedDate,
    @Default(false) bool isDateTaken,
    @Default(ArchiveDayStatus.checking) ArchiveDayStatus status,
  }) = _ArchiveDayState;
}
