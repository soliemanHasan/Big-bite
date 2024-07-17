
import 'package:big_bite/modules/home/domain/parameters/show_news_parameters.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/news_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<NewsEntity>>> getNews();
  Future<Either<Failure, NewsEntity>> showNewsDetails(ShowNewsParameters showNewsParameters);


}
