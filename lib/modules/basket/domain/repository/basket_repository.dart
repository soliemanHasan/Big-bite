import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/modules/basket/domain/parameters/order_parameters.dart';
import 'package:dartz/dartz.dart';

abstract class BasketRepository {
  Future<Either<Failure, String>> sendOrder(OrderParameters parameters);
}
