import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity.freezed.dart';

@freezed
abstract class Activity with _$Activity {
  const factory({
    required int id,
    required String name,
    required int kcalPerUnit,
    required String unitLabel,
    String? presetKey,
    @Default(false) bool isDurationBased,
  }) = _Activity;
}
