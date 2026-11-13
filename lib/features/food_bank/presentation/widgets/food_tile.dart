import 'package:flutter/material.dart';

class FoodTile extends StatelessWidget {
  const new({
    required this.name,
    required this.isListItem,
    this.onTap,
    this.icon,
    super.key,
  });

  static const _radius = BorderRadius.all(Radius.circular(12));

  final String name;
  final bool isListItem;
  final VoidCallback? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final icon = this.icon;
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
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: icon == null ? 0 : 18,
                    ),
                    child: Text(
                      name,
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
                if (icon != null)
                  Positioned(
                    top: 2,
                    right: 2,
                    child: Icon(icon, size: 16, color: Colors.white),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
