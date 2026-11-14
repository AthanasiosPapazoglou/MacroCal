import 'package:flutter/widgets.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/reference_food.dart';

extension ReferenceFoodName on ReferenceFood {
  /// The name in the app language, with English as the fallback.
  String localName(BuildContext context) =>
      Localizations.localeOf(context).languageCode == 'el' ? nameEl : nameEn;
}
