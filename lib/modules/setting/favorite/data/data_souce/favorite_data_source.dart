import 'package:big_bite/modules/setting/favorite/data/model/favorite_model.dart';
import 'package:big_bite/modules/setting/favorite/domain/parameters/favorite_parameters.dart';
import 'package:big_bite/modules/setting/favorite/domain/parameters/show_favorite_parameters.dart';
import 'package:big_bite/modules/setting/my_order/data/model/my_order_model.dart';

abstract class FavoriteDataSource {
  Future<MyOrderModel> addToFavorite(FavoriteParameters parameters);
  Future<List<MyFavoriteModel>> showFavorite(ShowFavoriteParameters parameters);
}
