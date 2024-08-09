import 'package:big_bite/core/constants/apis_urls.dart';
import 'package:big_bite/core/services/api_services.dart';
import 'package:big_bite/core/utils/app_response.dart';
import 'package:big_bite/modules/setting/favorite/data/data_souce/favorite_data_source.dart';
import 'package:big_bite/modules/setting/favorite/data/model/favorite_model.dart';
import 'package:big_bite/modules/setting/favorite/domain/parameters/favorite_parameters.dart';
import 'package:big_bite/modules/setting/favorite/domain/parameters/show_favorite_parameters.dart';
import 'package:big_bite/modules/setting/my_order/data/model/my_order_model.dart';

class FavoriteRemoteDataSourceImp extends FavoriteDataSource {
  @override
  Future<MyOrderModel> addToFavorite(FavoriteParameters parameters) async {
    AppResponse response = await ApiServices()
        .post(ApisUrls().addToFavorite, data: parameters.toJson());
    return MyOrderModel.fromJson(response.data["data"]["order"]);
  }

  @override
  Future<List<MyFavoriteModel>> showFavorite(
      ShowFavoriteParameters parameters) async {
    AppResponse response =
        await ApiServices().get(ApisUrls().showFavorite(parameters.page));
    return (response.data["data"]["data"] as List)
        .map((element) => MyFavoriteModel.fromJson(element))
        .toList();
  }
}
