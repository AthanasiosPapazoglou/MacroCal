import 'package:macro_cal_public/features/food_bank/data/datasources/open_food_facts_client.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/product_info.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/product_lookup_repository.dart';

class OpenFoodFactsProductLookupRepository implements ProductLookupRepository {
  new(this._client);

  static const _milligramsPerGram = 1000;

  final OpenFoodFactsClient _client;

  @override
  Future<ProductInfo?> lookup(String barcode) async {
    try {
      final product = await _client.fetchProduct(barcode);
      if (product == null) return null;
      final nutriments = product.nutriments;
      return ProductInfo(
        name: product.productName ?? '',
        per100g: Nutrients(
          kcal: nutriments?.energyKcal ?? 0,
          proteinG: nutriments?.proteins ?? 0,
          carbsG: nutriments?.carbohydrates ?? 0,
          sugarsG: nutriments?.sugars ?? 0,
          fatG: nutriments?.fat ?? 0,
          saturatedG: nutriments?.saturatedFat ?? 0,
          fiberG: nutriments?.fiber ?? 0,
          saltMg: (nutriments?.salt ?? 0) * _milligramsPerGram,
        ),
      );
    } on Exception {
      return null;
    }
  }
}
