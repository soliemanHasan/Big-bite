import 'package:big_bite/core/constants/apis_urls.dart';
import 'package:big_bite/core/services/api_services.dart';
import 'package:big_bite/core/utils/app_response.dart';
import 'package:big_bite/modules/meals/data/data_source/meals_data_source.dart';
import 'package:big_bite/modules/meals/data/models/meal_model.dart';
import 'package:big_bite/modules/meals/domain/parameters/meal_parameters.dart';
import 'package:big_bite/modules/meals/domain/parameters/show_meal_details_parameters.dart';

class MealsRemoteDataSourceImp extends MealsDataSource {
  @override
  Future<List<MealModel>> fetchMeals(MealParameters parameters) async {
    final AppResponse response = await ApiServices()
        .get(ApisUrls().fetchMeals(parameters.page, parameters.categoryId));
    return (response.data["data"]["data"] as List)
        .map((element) => MealModel.fromJson(element))
        .toList();
  }

  @override
  Future<MealModel> showMealDetails(
      ShowMealDetailsParameters parameters) async {
    final AppResponse response =
        await ApiServices().get(ApisUrls().showMealDetails(parameters.id));
    return MealModel.fromJson(response.data["data"]);
  }
}
