import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:macro_cal_public/features/food_bank/data/mappers/reference_food_json.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/reference_food.dart';
import 'package:macro_cal_public/features/food_bank/domain/repositories/reference_food_repository.dart';

/// Reads the bundled table once and keeps it in memory.
class AssetReferenceFoodRepository implements ReferenceFoodRepository {
  new(this._bundle);

  static const assetPath = 'assets/data/reference_foods.json';

  final AssetBundle _bundle;
  List<ReferenceFood>? _foods;

  @override
  Future<List<ReferenceFood>> loadAll() async => _foods ??= [
    for (final item
        in jsonDecode(await _bundle.loadString(assetPath)) as List<dynamic>)
      referenceFoodFromJson(item as Map<String, dynamic>),
  ];
}
