import 'package:big_bite/modules/basket/domain/parameters/order_parameters.dart';

abstract class BasketDataSource {
  Future<String> sendOrder(OrderParameters parameters);
}
