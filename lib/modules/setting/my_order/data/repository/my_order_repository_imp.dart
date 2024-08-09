import 'package:big_bite/core/errors/errors_handler.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/modules/setting/my_order/data/data_source/my_order_remote_data_source.dart';
import 'package:big_bite/modules/setting/my_order/domain/entities/my_order_entity.dart';
import 'package:big_bite/modules/setting/my_order/domain/parameters/my_order_parameters.dart';
import 'package:big_bite/modules/setting/my_order/domain/repository/my_order_repository.dart';
import 'package:dartz/dartz.dart';

class MyOrderRepositoryImp extends MyOrderRepository {
  final MyOrderRemoteDataSource myOrderRemoteDataSource;
  MyOrderRepositoryImp(this.myOrderRemoteDataSource);

  @override
  Future<Either<Failure, List<MyOrderEntity>>> showMyOrder(
      MyOrderParameters parameters) {
    return ErrorsHandler.handleEither(
      () => myOrderRemoteDataSource.showMyOrder(parameters),
    );
  }
}
