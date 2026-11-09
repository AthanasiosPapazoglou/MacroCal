import 'package:flutter/material.dart';
import 'package:macro_cal_public/features/today/domain/entities/intake_status.dart';

class IntakeColors extends ThemeExtension<IntakeColors> {
  const new({
    required this.critical,
    required this.warning,
    required this.caution,
    required this.good,
  });

  static final standard = IntakeColors(
    critical: Colors.red,
    warning: Colors.orange,
    caution: Colors.yellow.shade700,
    good: Colors.green,
  );

  final Color critical;
  final Color warning;
  final Color caution;
  final Color good;

  Color of(IntakeStatus status) => switch (status) {
    IntakeStatus.critical => critical,
    IntakeStatus.warning => warning,
    IntakeStatus.caution => caution,
    IntakeStatus.good => good,
  };

  @override
  IntakeColors copyWith({
    Color? critical,
    Color? warning,
    Color? caution,
    Color? good,
  }) => IntakeColors(
    critical: critical ?? this.critical,
    warning: warning ?? this.warning,
    caution: caution ?? this.caution,
    good: good ?? this.good,
  );

  @override
  IntakeColors lerp(IntakeColors? other, double t) {
    if (other == null) return this;
    return IntakeColors(
      critical: Color.lerp(critical, other.critical, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      caution: Color.lerp(caution, other.caution, t)!,
      good: Color.lerp(good, other.good, t)!,
    );
  }
}

extension IntakeColorsX on BuildContext {
  IntakeColors get intakeColors => Theme.of(this).extension<IntakeColors>()!;
}
