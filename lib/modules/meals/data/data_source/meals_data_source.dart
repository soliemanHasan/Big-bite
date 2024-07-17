import 'package:big_bite/modules/meals/data/models/meal_model.dart';
import 'package:big_bite/modules/meals/domain/parameters/meal_parameters.dart';
import 'package:big_bite/modules/meals/domain/parameters/show_meal_details_parameters.dart';

abstract class MealsDataSource {
  Future<List<MealModel>> fetchMeals(MealParameters parameters);
  Future<MealModel> showMealDetails(ShowMealDetailsParameters parameters);
}
