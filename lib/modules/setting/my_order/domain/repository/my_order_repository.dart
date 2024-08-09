import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/modules/setting/my_order/domain/entities/my_order_entity.dart';
import 'package:big_bite/modules/setting/my_order/domain/parameters/my_order_parameters.dart';
import 'package:dartz/dartz.dart';

 abstract class MyOrderRepository {

  Future<Either<Failure,List<MyOrderEntity>>> showMyOrder(MyOrderParameters parameters);
}