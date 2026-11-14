import 'package:freezed_annotation/freezed_annotation.dart';

part 'reference_intake.freezed.dart';

/// EFSA dietary reference values, NASEM dietary reference intakes, or the
/// EU label nutrient reference values (Regulation 1169/2011, Annex XIII).
enum ReferenceSource { efsa, nasem, euNrv }

enum UpperLimitScope { allIntake, supplementsOnly }

/// A daily reference intake for one nutrient, in the nutrient's unit.
@freezed
abstract class ReferenceIntake with _$ReferenceIntake {
  const factory({
    required double target,
    required ReferenceSource source,
    @Default(false) bool isAdequateIntake,
    UpperLimit? upperLimit,
  }) = _ReferenceIntake;
}

/// A tolerable upper intake level, compared with all intake or with
/// supplements only.
@freezed
abstract class UpperLimit with _$UpperLimit {
  const factory({
    required double amount,
    required ReferenceSource source,
    @Default(UpperLimitScope.allIntake) UpperLimitScope scope,
  }) = _UpperLimit;
}
