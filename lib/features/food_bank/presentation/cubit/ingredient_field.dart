enum IngredientField {
  referenceGrams,
  name,
  category,
  kcal,
  fatG,
  saturatedG,
  carbsG,
  sugarsG,
  fiberG,
  proteinG,
  saltG;

  static final _number = RegExp(r'^[0-9]*(\.[0-9]*)?$');

  /// Unparseable input counts as 0, as the form always allowed.
  static double parse(String text) => text.isNotEmpty && _number.hasMatch(text)
      ? double.tryParse(text) ?? 0
      : 0;

  static String format(double value) =>
      double.parse(value.toStringAsFixed(6)).toString();
}
