import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/modules/setting/favorite/domain/entities/favorite_entity.dart';
import 'package:big_bite/modules/setting/favorite/domain/parameters/favorite_parameters.dart';
import 'package:big_bite/modules/setting/favorite/domain/parameters/show_favorite_parameters.dart';
import 'package:big_bite/modules/setting/my_order/domain/entities/my_order_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteRepository {
  Future<Either<Failure, MyOrderEntity>> addToFavorite(
      FavoriteParameters parameters);

   Future<Either<Failure,List <MyFavoriteEntity>>> showFavorite(
      ShowFavoriteParameters parameters);   
}
