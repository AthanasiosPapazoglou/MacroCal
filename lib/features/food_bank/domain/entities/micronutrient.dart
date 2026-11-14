enum MicronutrientGroup { vitamin, mineral, traceElement }

enum MicronutrientUnit { mg, ug }

/// A tracked vitamin, mineral or trace element. Vitamin A is in µg RE,
/// folate in µg DFE and niacin in mg NE.
enum Micronutrient {
  vitaminA(.vitamin, .ug),
  vitaminD(.vitamin, .ug),
  vitaminE(.vitamin, .mg),
  vitaminK(.vitamin, .ug),
  vitaminC(.vitamin, .mg),
  thiamin(.vitamin, .mg),
  riboflavin(.vitamin, .mg),
  niacin(.vitamin, .mg),
  vitaminB6(.vitamin, .mg),
  folate(.vitamin, .ug),
  vitaminB12(.vitamin, .ug),
  calcium(.mineral, .mg),
  phosphorus(.mineral, .mg),
  magnesium(.mineral, .mg),
  potassium(.mineral, .mg),
  iron(.traceElement, .mg),
  zinc(.traceElement, .mg),
  copper(.traceElement, .mg),
  manganese(.traceElement, .mg),
  selenium(.traceElement, .ug),
  iodine(.traceElement, .ug);

  new(this.group, this.unit);

  final MicronutrientGroup group;
  final MicronutrientUnit unit;
}
