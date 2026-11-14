import 'package:macro_cal_public/features/food_bank/domain/entities/reference_food.dart';

/// Finds foods whose English or Greek name holds every word of a query,
/// ignoring case and accents.
abstract final class ReferenceFoodSearch {
  static const _folded = {
    'ά': 'α',
    'έ': 'ε',
    'ή': 'η',
    'ί': 'ι',
    'ϊ': 'ι',
    'ΐ': 'ι',
    'ό': 'ο',
    'ύ': 'υ',
    'ϋ': 'υ',
    'ΰ': 'υ',
    'ώ': 'ω',
    'ς': 'σ',
    'à': 'a',
    'á': 'a',
    'â': 'a',
    'ä': 'a',
    'ç': 'c',
    'è': 'e',
    'é': 'e',
    'ê': 'e',
    'ë': 'e',
    'ì': 'i',
    'í': 'i',
    'î': 'i',
    'ï': 'i',
    'ñ': 'n',
    'ò': 'o',
    'ó': 'o',
    'ô': 'o',
    'ö': 'o',
    'ù': 'u',
    'ú': 'u',
    'û': 'u',
    'ü': 'u',
  };
  static final _separators = RegExp(r'[\s,;/()]+');

  static String fold(String text) =>
      text.toLowerCase().split('').map((char) => _folded[char] ?? char).join();

  /// Names starting with the first word come first, then shorter names.
  static List<ReferenceFood> search(List<ReferenceFood> foods, String query) {
    final words = fold(query)
        .split(_separators)
        .where((word) => word.isNotEmpty)
        .toList();
    if (words.isEmpty) return foods;
    final matches = <(int, int, ReferenceFood)>[];
    for (final food in foods) {
      final names = [fold(food.nameEn), fold(food.nameEl)];
      final haystack = names.join(' ');
      if (!words.every(haystack.contains)) continue;
      final rank = names.any((name) => name.startsWith(words.first))
          ? 0
          : names.any(
              (name) => name
                  .split(_separators)
                  .any((word) => word.startsWith(words.first)),
            )
          ? 1
          : 2;
      final length = food.nameEn.length < food.nameEl.length
          ? food.nameEn.length
          : food.nameEl.length;
      matches.add((rank, length, food));
    }
    matches.sort(
      (a, b) => a.$1 != b.$1 ? a.$1.compareTo(b.$1) : a.$2.compareTo(b.$2),
    );
    return [for (final (_, _, food) in matches) food];
  }
}
