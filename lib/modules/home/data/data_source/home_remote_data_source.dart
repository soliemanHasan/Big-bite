import 'package:big_bite/modules/home/domain/parameters/show_news_parameters.dart';

import '../models/news_model.dart';

abstract class HomeDataSource {
  Future<List<NewsModel>> getNews();
  Future<NewsModel> showNewsDetails(ShowNewsParameters showNewsParameters);
}
