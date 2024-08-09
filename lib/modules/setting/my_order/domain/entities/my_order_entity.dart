import 'package:big_bite/core/enums/order_status.dart';
import 'package:equatable/equatable.dart';

class MyOrderEntity extends Equatable {
  final int id;
  final String price;
  final String type;
  final String status;
  final String? estimatedDeliveryTime;
  final List<MealEntity>? meals;
  final List<DrinkEntity>? drinks;
  const MyOrderEntity({
    required this.id,
    required this.price,
    required this.status,
    required this.type,
    this.estimatedDeliveryTime,
    this.drinks,
    this.meals,
  });

  @override
  List<Object?> get props =>
      [id, price, type, status, estimatedDeliveryTime, meals, drinks];

  OrderStatus get orderStatus {
    switch (status.toLowerCase()) {
      case 'pending':
        return OrderStatus.pending;
      case 'accepted':
        return OrderStatus.accepted;
      case 'rejected':
        return OrderStatus.rejected;
      default:
        return OrderStatus.pending; // Default to pending if unknown status
    }
  }
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
