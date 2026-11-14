import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/domain/services/reference_food_search.dart';

import '../../../../helpers/sample_reference_foods.dart';

void main() {
  const foods = [referencePineapple, referenceApple, referenceFeta];

  test('fold drops case, accents and the final sigma', () {
    expect(ReferenceFoodSearch.fold('Μήλο'), 'μηλο');
    expect(ReferenceFoodSearch.fold('ΚΡΈΑΣ'), 'κρεασ');
    expect(ReferenceFoodSearch.fold('ωμός'), 'ωμοσ');
    expect(ReferenceFoodSearch.fold('Conférence'), 'conference');
  });

  test('an empty query keeps every food in order', () {
    expect(ReferenceFoodSearch.search(foods, '  '), foods);
  });

  test('Greek and English queries find the same food', () {
    for (final query in ['μηλο', 'Μήλο', 'ΜΗΛΟ', 'apple']) {
      expect(
        ReferenceFoodSearch.search(foods, query).first,
        referenceApple,
        reason: query,
      );
    }
  });

  test('a final sigma matches the middle form', () {
    expect(ReferenceFoodSearch.search(foods, 'ανανασ ωμοσ'), [
      referencePineapple,
    ]);
  });

  test('every word must match, in either name', () {
    expect(ReferenceFoodSearch.search(foods, 'φετα ewe'), [referenceFeta]);
    expect(ReferenceFoodSearch.search(foods, 'apple cheese'), isEmpty);
  });

  test('names starting with the first word come before others', () {
    expect(ReferenceFoodSearch.search(foods, 'apple'), [
      referenceApple,
      referencePineapple,
    ]);
  });
}
