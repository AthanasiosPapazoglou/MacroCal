import 'package:macro_cal_public/features/profile/domain/entities/sex.dart';
import 'package:macro_cal_public/features/profile/presentation/cubit/profile_field.dart';

/// The profile form's number fields and birth year as typed, and the sex.
typedef ProfileInput = ({
  Map<ProfileField, String> fields,
  Sex? sex,
  String birthYear,
});

abstract final class BirthYear {
  static const earliest = 1900;

  /// Empty text is valid and means no birth year.
  static bool isValid(String text, {required int currentYear}) {
    if (text.trim().isEmpty) return true;
    final year = parse(text);
    return year != null && year >= earliest && year <= currentYear;
  }

  static int? parse(String text) => int.tryParse(text.trim());
}
