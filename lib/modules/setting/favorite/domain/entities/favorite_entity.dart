import 'package:equatable/equatable.dart';

class MyFavoriteEntity extends Equatable {
  final int id;
  final OrderEntity orderEntity;
  const MyFavoriteEntity({required this.id, required this.orderEntity});

  @override
  List<Object?> get props => [id, orderEntity];
}

class OrderEntity extends Equatable {
  final int id;
  final String totalAmount;
  final String type;
  final List<MealEntity> meals;
  final String status;
  final List<DrinkEntity> drinks;
  const OrderEntity(
      {required this.id,
      required this.status,
      required this.drinks,
      required this.meals,
      required this.totalAmount,
      required this.type});

  @override
  List<Object?> get props => [id, meals, drinks, totalAmount, type,status];
}

class DrinkEntity extends Equatable {
  final int id;
  final String name;
  final DetailsEntity details;
  const DrinkEntity(
      {required this.id, required this.name, required this.details});

  @override
  List<Object?> get props => [id, name, details];
}

class MealEntity extends Equatable {
  final int id;
  final String name;
  final String price;
  final DetailsEntity details;
  const MealEntity(
      {required this.id,
      required this.name,
      required this.details,
      required this.price});

  @override
  List<Object?> get props => [id, name, details, price];
}

class DetailsEntity extends Equatable {
  final int quantity;
  final String price;
  final String? customizedNote;
  const DetailsEntity(
      {required this.quantity, required this.price, this.customizedNote});

  @override
  List<Object?> get props => [quantity, price, customizedNote];
}
