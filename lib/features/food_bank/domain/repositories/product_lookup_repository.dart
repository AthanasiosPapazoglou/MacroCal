import 'package:macro_cal_public/features/food_bank/domain/entities/product_info.dart';

abstract interface class ProductLookupRepository {
  /// Null when the barcode is unknown or the lookup fails.
  Future<ProductInfo?> lookup(String barcode);
}
