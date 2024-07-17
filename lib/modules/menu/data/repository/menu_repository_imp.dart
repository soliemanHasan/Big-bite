import 'package:big_bite/core/errors/errors_handler.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/modules/menu/data/data_source/menu_data_source.dart';
import 'package:big_bite/modules/menu/domain/entities/category_menu_entity.dart';
import 'package:big_bite/modules/menu/domain/repository/menu_repository.dart';
import 'package:dartz/dartz.dart';

class MenuRepositoryImp extends MenuRepository {
  final MenuDataSource menuDataSource;
  MenuRepositoryImp(this.menuDataSource);
  @override
  Future<Either<Failure, List<CategoryMenuEntity>>> fetchCategoryMenu() async {
    return ErrorsHandler.handleEither(
      () => menuDataSource.fetchMenu(),
    );
  }
}
