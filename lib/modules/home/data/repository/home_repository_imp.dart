import 'package:big_bite/modules/home/domain/parameters/show_news_parameters.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/errors_handler.dart';
import '../../../../core/errors/failure.dart';
import '../../domain/entities/news_entity.dart';
import '../../domain/repository/home_repository.dart';
import '../data_source/home_remote_data_source.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeDataSource homeDataSource;
  HomeRepositoryImp(this.homeDataSource);

  @override
  Future<Either<Failure, List<NewsEntity>>> getNews() async {
    return ErrorsHandler.handleEither(() => homeDataSource.getNews());
  }

  @override
  Future<Either<Failure, NewsEntity>> showNewsDetails(
      ShowNewsParameters showNewsParameters) async {
    return ErrorsHandler.handleEither(
      () => homeDataSource.showNewsDetails(showNewsParameters),
    );
  }
}
