import 'package:big_bite/modules/setting/my_order/data/model/my_order_model.dart';
import 'package:big_bite/modules/setting/my_order/domain/parameters/my_order_parameters.dart';

abstract class MyOrderRemoteDataSource {
  Future<List<MyOrderModel>> showMyOrder(MyOrderParameters parameters);
}
