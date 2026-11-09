import 'package:flutter/material.dart';
import 'package:macro_cal_public/features/food_bank/domain/entities/ingredient.dart';

class IngredientTile extends StatelessWidget {
  const new({
    required this.ingredient,
    required this.isListItem,
    required this.onTap,
    super.key,
  });

  static const _radius = BorderRadius.all(Radius.circular(12));

  final Ingredient ingredient;
  final bool isListItem;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: isListItem ? 0 : 8,
      ),
      child: Material(
        color: Theme.of(context).primaryColor,
        borderRadius: _radius,
        child: InkWell(
          borderRadius: _radius,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(4),
            height: 48,
            child: Center(
              child: Text(
                ingredient.name,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
