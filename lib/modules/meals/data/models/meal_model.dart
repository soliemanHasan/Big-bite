import 'package:big_bite/modules/meals/domain/entities/meal_entity.dart';

class MealModel extends MealEntity {
  const MealModel({
    required super.id,
    required super.name,
    required super.description,
    // required super.page,
    // required super.imagePath,
    required super.ingredients,
    required super.price,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    List<IngredientModel> ingredients = [];
    json["ingredients"] == null
        ? []
        : json["ingredients"].forEach(
            (element) => ingredients.add(IngredientModel.formJson(element)));
    return MealModel(
        // page: json["current_page"],
        id: json["id"],
        name: json["name"],
        description: json["description"],
        // imagePath: json["files"],
        ingredients: ingredients,
        price: json["price"]);
  }
}

class IngredientModel extends IngredientEntity {
  const IngredientModel({required super.id, required super.name});

  factory IngredientModel.formJson(Map<String, dynamic> json) {
    return IngredientModel(id: json["id"], name: json["name"]);
  }
}
