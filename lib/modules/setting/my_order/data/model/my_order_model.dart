import 'package:big_bite/modules/setting/my_order/domain/entities/my_order_entity.dart';

class MyOrderModel extends MyOrderEntity {
  const MyOrderModel({
    required super.id,
    required super.price,
    required super.status,
    required super.type,
    super.drinks,
    super.meals,
    super.estimatedDeliveryTime,
  });
  factory MyOrderModel.fromJson(Map<String, dynamic> json) {
    List<MealModel> meals = [];
    json["meals"].forEach((meal) => meals.add(MealModel.fromJson(meal)));
    List<DrinkModel> drinks = [];
    json["drinks"].forEach((drink) => drinks.add(DrinkModel.fromJson(drink)));
    return MyOrderModel(
        id: json["id"],
        price: json["total_amount"],
        status: json["status"],
        type: json["type"],
        drinks: drinks,
        meals: meals,
        estimatedDeliveryTime: json["estimated_delivery_time"]);
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



