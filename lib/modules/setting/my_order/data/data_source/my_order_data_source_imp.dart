import 'package:big_bite/core/constants/apis_urls.dart';
import 'package:big_bite/core/services/api_services.dart';
import 'package:big_bite/core/utils/app_response.dart';
import 'package:big_bite/modules/setting/my_order/data/data_source/my_order_remote_data_source.dart';
import 'package:big_bite/modules/setting/my_order/data/model/my_order_model.dart';
import 'package:big_bite/modules/setting/my_order/domain/parameters/my_order_parameters.dart';

class MyOrderDataSourceImp extends MyOrderRemoteDataSource {
  @override
  Future<List<MyOrderModel>> showMyOrder(MyOrderParameters parameters) async {
    AppResponse response =
        await ApiServices().get(ApisUrls().showMyOrder(parameters.page));
    return (response.data["data"]["data"] as List)
        .map((element) => MyOrderModel.fromJson(element))
        .toList();
  }
}
