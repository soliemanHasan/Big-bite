import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/modules/meals/domain/entities/meal_entity.dart';
import 'package:big_bite/modules/meals/domain/parameters/meal_parameters.dart';
import 'package:big_bite/modules/meals/domain/parameters/show_meal_details_parameters.dart';
import 'package:dartz/dartz.dart';

abstract class MealRepository {
  Future<Either<Failure, List<MealEntity>>> fetchMeals(
      MealParameters parameters);

  Future<Either<Failure, MealEntity>> showMealDetails(
      ShowMealDetailsParameters parameters);
}
