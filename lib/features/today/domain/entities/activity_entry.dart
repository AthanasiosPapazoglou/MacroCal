import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/today/domain/entities/activity.dart';

part 'activity_entry.freezed.dart';

@freezed
abstract class ActivityEntry with _$ActivityEntry {
  const factory({required Activity activity, required int amount}) =
      _ActivityEntry;
}
