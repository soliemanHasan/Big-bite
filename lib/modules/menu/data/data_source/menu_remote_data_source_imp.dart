import 'package:big_bite/core/constants/apis_urls.dart';
import 'package:big_bite/core/services/api_services.dart';
import 'package:big_bite/core/utils/app_response.dart';
import 'package:big_bite/modules/menu/data/data_source/menu_data_source.dart';
import 'package:big_bite/modules/menu/data/models/category_menu_model.dart';

class MenuRemoteDataSourceImp extends MenuDataSource {
  @override
  Future<List<CategoryMenuModel>> fetchMenu() async {
    final AppResponse response =
        await ApiServices().get(ApisUrls().fetchMenuCategories);
    return response.toList(
      (json) => CategoryMenuModel.fromJson(json),
    );
  }
}
