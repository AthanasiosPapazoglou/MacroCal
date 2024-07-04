class Ingredient {
  double? referenceQuantity;
  String? ingridientName;
  String? category;
  double? calories;
  double? proteins;
  double? carbohydrates;
  double? sugars;
  double? fats;
  double? saturated;
  double? fiber;
  double? salt;

  Ingredient({
    this.referenceQuantity,
    this.ingridientName,
    this.category,
    this.calories,
    this.proteins,
    this.carbohydrates,
    this.sugars,
    this.fats,
    this.saturated,
    this.fiber,
    this.salt,
  });

  ///Convers a json formatted ingredient item back to it's modelised form
  Ingredient.fromJson(Map<String, dynamic> json) {
    referenceQuantity = json['referenceQuantity'];
    ingridientName = json['ingridientName'];
    category = json['category'] ?? 'Uncategorised';
    calories = json['calories'];
    proteins = json['proteins'];
    carbohydrates = json['carbohydrates'];
    sugars = json['sugars'];
    fats = json['fats'];
    saturated = json['saturated'];
    fiber = json['fiber'];
    salt = json['salt'];
  }

  //Converts an Ingredient item to json format
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['referenceQuantity'] = referenceQuantity;
    data['ingridientName'] = ingridientName;
    data['category'] = category ?? 'Uncategorised';
    data['calories'] = calories;
    data['proteins'] = proteins;
    data['carbohydrates'] = carbohydrates;
    data['sugars'] = sugars;
    data['fats'] = fats;
    data['saturated'] = saturated;
    data['fiber'] = fiber;
    data['salt'] = salt;
    return data;
  }

  // Converts a list of Ingredient objects to a list of JSON maps.
  static List<Map<String, dynamic>> listToJson(List<Ingredient> ingredients) {
    return ingredients.map((ingredient) => ingredient.toJson()).toList();
  }

  // Converts a list of JSON maps to a list of Ingredient objects.
  static List<Ingredient> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => Ingredient.fromJson(json)).toList();
  }
}
