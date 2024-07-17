import 'package:big_bite/modules/menu/data/models/category_menu_model.dart';

abstract class MenuDataSource {
  Future<List<CategoryMenuModel>> fetchMenu();
}
