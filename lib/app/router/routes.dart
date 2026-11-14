import 'package:macro_cal_public/core/domain/date_only.dart';
import 'package:macro_cal_public/features/food_bank/presentation/nutrient_kind.dart';

abstract final class AppRoutes {
  static const today = '/today';
  static const consumption = '/today/consumption';
  static const exercise = '/today/exercise';
  static const foods = '/foods';
  static const newIngredient = '/foods/new';
  static const newRecipe = '/foods/recipes/new';
  static const history = '/history';
  static const profile = '/profile';
  static const scan = '/scan';
  static const referenceFoods = '/reference-foods';

  static String historyDay(DateTime date) => '/history/${date.isoDay}';

  static String ingredient(int id) => '/foods/$id';

  static String editIngredient(int id) => '/foods/$id/edit';

  static String nutrient(int ingredientId, NutrientKind kind) =>
      '/foods/$ingredientId/nutrient/${kind.name}';

  static String recipe(int id) => '/foods/recipes/$id';

  static String editRecipe(int id) => '/foods/recipes/$id/edit';

  static String recipeNutrient(int recipeId, NutrientKind kind) =>
      '/foods/recipes/$recipeId/nutrient/${kind.name}';
}
