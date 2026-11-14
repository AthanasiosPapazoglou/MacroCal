import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/asset_reference_food_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrient.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/micronutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/reference_food.dart';
import 'package:macro_cal_public/features/food_bank/domain/services/reference_food_search.dart';

class _StringBundle extends CachingAssetBundle {
  new(this.json);

  final String json;
  int loads = 0;

  @override
  Future<String> loadString(String key, {bool cache = true}) async {
    loads++;
    return json;
  }

  @override
  Future<ByteData> load(String key) => throw UnimplementedError();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('reads an entry, skips unknown nutrients and loads once', () async {
    final bundle = _StringBundle('''
[{"code":13039,"en":"Apple, raw","el":"Μήλο, ωμό","kcal":53.0,
  "proteinG":0.25,"carbsG":11.6,"sugarsG":9.4,"fatG":0.2,"saturatedG":0.04,
  "fiberG":1.9,"saltMg":1.5,"micros":{"vitaminC":4.6,"chromium":3}}]
''');
    final repository = AssetReferenceFoodRepository(bundle);

    final foods = await repository.loadAll();
    await repository.loadAll();

    expect(bundle.loads, 1);
    expect(foods, [
      const ReferenceFood(
        code: 13039,
        nameEn: 'Apple, raw',
        nameEl: 'Μήλο, ωμό',
        per100g: Nutrients(
          kcal: 53,
          proteinG: 0.25,
          carbsG: 11.6,
          sugarsG: 9.4,
          fatG: 0.2,
          saturatedG: 0.04,
          fiberG: 1.9,
          saltMg: 1.5,
          micros: Micronutrients(amounts: {Micronutrient.vitaminC: 4.6}),
        ),
      ),
    ]);
  });

  test('the bundled table has 696 named foods with unique codes', () async {
    final foods = await AssetReferenceFoodRepository(rootBundle).loadAll();

    expect(foods, hasLength(696));
    expect(foods.map((food) => food.code).toSet(), hasLength(696));
    expect(
      foods.every((food) => food.nameEn.isNotEmpty && food.nameEl.isNotEmpty),
      isTrue,
    );
    expect(foods.where((food) => food.per100g.micros.isEmpty), isEmpty);
    final feta = ReferenceFoodSearch.search(foods, 'φέτα πρόβεια').first;
    expect(feta.per100g.micros[Micronutrient.calcium], greaterThan(0));
  });
}
