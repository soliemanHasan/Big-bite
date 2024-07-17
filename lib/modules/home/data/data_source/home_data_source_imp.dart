import 'package:big_bite/modules/home/domain/parameters/show_news_parameters.dart';

import '../../../../core/constants/apis_urls.dart';
import '../../../../core/services/api_services.dart';
import '../../../../core/utils/app_response.dart';
import '../models/news_model.dart';
import 'home_remote_data_source.dart';

class HomeDataSourceImp extends HomeDataSource {
  @override
  Future<List<NewsModel>> getNews() async {
    AppResponse response = await ApiServices().get(ApisUrls().getNews);

    return (response.data["data"]["data"] as List)
        .map((element) => NewsModel.fromJson(element))
        .toList();
  }

  @override
  Future<NewsModel> showNewsDetails(
      ShowNewsParameters showNewsParameters) async {
    AppResponse response = await ApiServices()
        .get(ApisUrls().showNewsDetails(showNewsParameters.id));
    return NewsModel.fromJson1(response.data["data"]);
  }
}
