import 'package:big_bite/core/errors/errors_handler.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/modules/setting/favorite/data/data_souce/favorite_data_source.dart';
import 'package:big_bite/modules/setting/favorite/domain/entities/favorite_entity.dart';
import 'package:big_bite/modules/setting/favorite/domain/parameters/favorite_parameters.dart';
import 'package:big_bite/modules/setting/favorite/domain/parameters/show_favorite_parameters.dart';
import 'package:big_bite/modules/setting/favorite/domain/repository/favorite_repository.dart';
import 'package:big_bite/modules/setting/my_order/domain/entities/my_order_entity.dart';
import 'package:dartz/dartz.dart';

class FavoriteRepositoryImp extends FavoriteRepository {
  final FavoriteDataSource favoriteDataSource;
  FavoriteRepositoryImp(this.favoriteDataSource);
  @override
  Future<Either<Failure, MyOrderEntity>> addToFavorite(
      FavoriteParameters parameters) {
    return ErrorsHandler.handleEither(
      () => favoriteDataSource.addToFavorite(parameters),
    );
  }

  @override
  Future<Either<Failure, List<MyFavoriteEntity>>> showFavorite(
      ShowFavoriteParameters parameters) {
    return ErrorsHandler.handleEither(
      () => favoriteDataSource.showFavorite(parameters),
    );
  }
}
