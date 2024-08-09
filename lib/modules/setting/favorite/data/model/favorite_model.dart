import 'package:big_bite/modules/setting/favorite/domain/entities/favorite_entity.dart';

class MyFavoriteModel extends MyFavoriteEntity {
  const MyFavoriteModel({required super.id, required super.orderEntity});

  factory MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    final order = OrderModel.fromJson(json["order"]);
    return MyFavoriteModel(id: json["id"], orderEntity: order);
  }
}

class OrderModel extends OrderEntity {
  const OrderModel(
      {required super.id,
      required super.drinks,
      required super.meals,
      required super.totalAmount,
      required super.status,
      required super.type});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    List<MealModel> meals = [];
    json["meals"].forEach((meal) => meals.add(MealModel.fromJson(meal)));
    List<DrinkModel> drinks = [];
    json["drinks"].forEach((drink) => drinks.add(DrinkModel.fromJson(drink)));
    return OrderModel(
      id: json["id"],
      status: json["status"],
      totalAmount: json["total_amount"],
      type: json["type"],
      drinks: drinks,
      meals: meals,
    );
  }
}

class DrinkModel extends DrinkEntity {
  const DrinkModel(
      {required super.id, required super.name, required super.details});

  factory DrinkModel.fromJson(Map<String, dynamic> json) {
    DetailsModel details;
    details = DetailsModel.fromJson(json["details"]);
    return DrinkModel(id: json["id"], name: json["name"], details: details);
  }
}

class MealModel extends MealEntity {
  const MealModel(
      {required super.id,
      required super.name,
      required super.details,
      required super.price});
  factory MealModel.fromJson(Map<String, dynamic> json) {
    DetailsModel details;
    details = DetailsModel.fromJson(json["details"]);
    return MealModel(
        id: json["id"],
        name: json["name"],
        details: details,
        price: json["price"]);
  }
}

class DetailsModel extends DetailsEntity {
  const DetailsModel(
      {required super.quantity, required super.price, super.customizedNote});
  factory DetailsModel.fromJson(Map<String, dynamic> json) {
    return DetailsModel(quantity: json["quantity"], price: json["price"]);
  }
}
