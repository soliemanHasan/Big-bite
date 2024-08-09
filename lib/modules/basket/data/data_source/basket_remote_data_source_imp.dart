import 'package:big_bite/core/constants/apis_urls.dart';
import 'package:big_bite/core/services/api_services.dart';
import 'package:big_bite/core/utils/app_response.dart';
import 'package:big_bite/modules/basket/data/data_source/basket_data_source.dart';
import 'package:big_bite/modules/basket/domain/parameters/order_parameters.dart';

class BasketRemoteDataSourceImp extends BasketDataSource {
  @override
  Future<String> sendOrder(OrderParameters parameters) async {
    AppResponse response = await ApiServices().post(
      ApisUrls().sendOrder,
      data: parameters.toJson(),
    );
    return response.data[""];
  }
}
