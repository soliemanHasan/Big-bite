import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/modules/menu/domain/entities/category_menu_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MenuRepository {
  Future<Either<Failure, List<CategoryMenuEntity>>> fetchCategoryMenu();
}
