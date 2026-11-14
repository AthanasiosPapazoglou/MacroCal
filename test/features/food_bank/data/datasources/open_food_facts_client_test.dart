import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:macro_cal_public/features/food_bank/data/datasources/open_food_facts_client.dart';

String _fixture(String name) =>
    File('test/fixtures/open_food_facts/$name').readAsStringSync();

void main() {
  test('requests the product endpoint and parses a found product', () async {
    late Uri requested;
    final client = OpenFoodFactsClient(
      MockClient((request) async {
        requested = request.url;
        return http.Response.bytes(
          _fixture('product_found.json').codeUnits,
          200,
          headers: {'content-type': 'application/json; charset=utf-8'},
        );
      }),
    );

    final product = await client.fetchProduct('5200000000001');

    expect(
      requested.toString(),
      'https://world.openfoodfacts.org/api/v2/product/5200000000001',
    );
    expect(product?.productName, 'Sample Greek Yogurt 2%');
    expect(product?.nutriments?.energyKcal, 72);
    expect(product?.nutriments?.fiber, 0.5);
    expect(product?.nutriments?.salt, 0.12);
    expect(product?.nutriments?.amountsPer100g, containsPair('calcium', 0.11));
    expect(
      product?.nutriments?.amountsPer100g,
      containsPair('vitamin-d', 0.0000012),
    );
    expect(
      product?.nutriments?.amountsPer100g,
      isNot(contains('calcium_unit')),
    );
  });

  test('encodes the barcode as a single path segment', () async {
    late Uri requested;
    final client = OpenFoodFactsClient(
      MockClient((request) async {
        requested = request.url;
        return http.Response(_fixture('product_not_found.json'), 200);
      }),
    );

    await client.fetchProduct('12/34');

    expect(requested.path, '/api/v2/product/12%2F34');
  });

  test('returns null for an unknown product', () async {
    final client = OpenFoodFactsClient(
      MockClient(
        (_) async => http.Response(_fixture('product_not_found.json'), 200),
      ),
    );

    expect(await client.fetchProduct('0000000000000'), isNull);
  });

  test('returns null for a non-200 response', () async {
    final client = OpenFoodFactsClient(
      MockClient((_) async => http.Response('', 503)),
    );

    expect(await client.fetchProduct('5200000000001'), isNull);
  });
}
