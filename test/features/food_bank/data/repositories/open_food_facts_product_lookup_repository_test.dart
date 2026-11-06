import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:macro_cal_public/features/food_bank/data/datasources/open_food_facts_client.dart';
import 'package:macro_cal_public/features/food_bank/data/repositories/open_food_facts_product_lookup_repository.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/product_info.dart';

OpenFoodFactsProductLookupRepository _repository(MockClientHandler handler) =>
    OpenFoodFactsProductLookupRepository(
      OpenFoodFactsClient(MockClient(handler)),
    );

void main() {
  test('maps a found product and converts salt from g to mg', () async {
    final body = File('test/fixtures/open_food_facts/product_found.json')
        .readAsStringSync();
    final repository = _repository((_) async => http.Response(body, 200));

    expect(
      await repository.lookup('5200000000001'),
      const ProductInfo(
        name: 'Sample Greek Yogurt 2%',
        per100g: Nutrients(
          kcal: 72,
          proteinG: 10,
          carbsG: 3.5,
          sugarsG: 3.5,
          fatG: 2,
          saturatedG: 1.3,
          fiberG: 0.5,
          saltMg: 120,
        ),
      ),
    );
  });

  test('fills missing name and nutriments with defaults', () async {
    final repository = _repository(
      (_) async => http.Response('{"status": 1, "product": {}}', 200),
    );

    expect(
      await repository.lookup('1'),
      const ProductInfo(name: '', per100g: Nutrients()),
    );
  });

  test('returns null when the request fails', () async {
    final repository = _repository(
      (_) async => throw http.ClientException('offline'),
    );

    expect(await repository.lookup('1'), isNull);
  });

  test('returns null for malformed JSON', () async {
    final repository = _repository(
      (_) async => http.Response('{"status": "x"}', 200),
    );

    expect(await repository.lookup('1'), isNull);
  });
}
