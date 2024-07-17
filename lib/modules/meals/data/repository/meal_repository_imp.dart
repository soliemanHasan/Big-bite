import 'package:big_bite/core/errors/errors_handler.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/modules/meals/data/data_source/meals_data_source.dart';
import 'package:big_bite/modules/meals/domain/entities/meal_entity.dart';
import 'package:big_bite/modules/meals/domain/parameters/meal_parameters.dart';
import 'package:big_bite/modules/meals/domain/parameters/show_meal_details_parameters.dart';
import 'package:big_bite/modules/meals/domain/repository/meal_repository.dart';
import 'package:dartz/dartz.dart';

class MealRepositoryImp extends MealRepository {
  final MealsDataSource mealsDataSource;
  MealRepositoryImp(this.mealsDataSource);
  @override
  Future<Either<Failure, List<MealEntity>>> fetchMeals(
      MealParameters parameters) {
    return ErrorsHandler.handleEither(
      () => mealsDataSource.fetchMeals(parameters),
    );
  }

  @override
  Future<Either<Failure, MealEntity>> showMealDetails(
      ShowMealDetailsParameters parameters) {
    return ErrorsHandler.handleEither(
      () => mealsDataSource.showMealDetails(parameters),
    );
  }
}
