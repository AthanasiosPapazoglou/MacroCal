import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:macro_cal_public/features/food_bank/data/dtos/open_food_facts_dtos.dart';

class OpenFoodFactsClient {
  new(this._httpClient);

  final http.Client _httpClient;

  Future<OpenFoodFactsProductDto?> fetchProduct(String barcode) async {
    final response = await _httpClient.get(
      Uri(
        scheme: 'https',
        host: 'world.openfoodfacts.org',
        pathSegments: ['api', 'v2', 'product', barcode],
      ),
    );
    if (response.statusCode != 200) return null;

    final json = jsonDecode(utf8.decode(response.bodyBytes));
    if (json is! Map<String, dynamic>) return null;
    final body = OpenFoodFactsResponseDto.fromJson(json);
    return body.status == 1 ? body.product : null;
  }
}
