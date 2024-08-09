import 'package:big_bite/core/errors/errors_handler.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/modules/basket/data/data_source/basket_data_source.dart';
import 'package:big_bite/modules/basket/domain/parameters/order_parameters.dart';
import 'package:big_bite/modules/basket/domain/repository/basket_repository.dart';
import 'package:dartz/dartz.dart';

class BasketRepositoryImp extends BasketRepository {
  final BasketDataSource dataSource;
  BasketRepositoryImp(this.dataSource);
  @override
  Future<Either<Failure, String>> sendOrder(OrderParameters parameters) async {
    return ErrorsHandler.handleEither(
      () => dataSource.sendOrder(parameters),
    );
  }
}
