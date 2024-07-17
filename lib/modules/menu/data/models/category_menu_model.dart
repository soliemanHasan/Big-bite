import 'package:big_bite/modules/menu/domain/entities/category_menu_entity.dart';

class CategoryMenuModel extends CategoryMenuEntity {
  const CategoryMenuModel(
      {required super.id, required super.name, required super.file});
  factory CategoryMenuModel.fromJson(Map<String, dynamic> json) {
    return CategoryMenuModel(
        id: json["id"], name: json["name"], file: json["file"]);
  }
}
