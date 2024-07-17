import 'package:big_bite/core/errors/errors_handler.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/core/token/data/token_data_source.dart';
import 'package:big_bite/core/token/models/entities/token_entity.dart';
import 'package:big_bite/core/token/parameters/token_parameters.dart';

import 'package:dartz/dartz.dart';

class TokenRepository {
  final TokenDataSource tokenDataSource;
  TokenRepository(this.tokenDataSource);

  Future<Either<Failure, TokenEntity>> refreshToken(
      TokenParameters parameters) {
    // return ErrorsHandler.refreshTokenHandleEither(
    //  () => //tokenDataSource.refreshToken(parameters),
    // );
    throw (UnimplementedError);
  }
}
