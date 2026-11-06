import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/nutrients.dart';

part 'product_info.freezed.dart';

@freezed
abstract class ProductInfo with _$ProductInfo {
  const factory({required String name, required Nutrients per100g}) =
      _ProductInfo;
}
