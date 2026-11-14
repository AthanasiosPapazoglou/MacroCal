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

  /// Unparseable input counts as 0.
  static double parse(String text) => parseOptional(text) ?? 0;

  /// Empty or unparseable input is null.
  static double? parseOptional(String text) =>
      text.isNotEmpty && _number.hasMatch(text) ? double.tryParse(text) : null;

  static String format(double value) =>
      double.parse(value.toStringAsFixed(6)).toString();
}
