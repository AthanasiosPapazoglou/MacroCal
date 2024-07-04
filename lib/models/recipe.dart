import 'package:macro_cal_public/models/ingredient.dart';

class Recipe {
  String? recipeName;
  List<Ingredient>? ingredientList;
  List<double>? quantitiesList;

  Recipe({this.recipeName, this.ingredientList, this.quantitiesList});

  Recipe.fromJson(Map<String, dynamic> json) {
    recipeName = json['recipeName'];
    ingredientList = json['ingredientList'];
    quantitiesList = json['quantitiesList'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['recipeName'] = recipeName;
    data['ingredientList'] = ingredientList;
    data['quantitiesList'] = quantitiesList;
    return data;
  }

  static List<Map<String, dynamic>> listToJson(List<Recipe> activities) {
    return activities.map((activity) => activity.toJson()).toList();
  }

  static List<Recipe> listFromJson(List<dynamic> jsonList) {
    return jsonList.map((json) => Recipe.fromJson(json)).toList();
  }
}
