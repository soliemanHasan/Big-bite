import 'package:equatable/equatable.dart';

class BasketState extends Equatable {
  final List<Meal> meals;
  const BasketState({this.meals = const []});

  @override
  List<Object?> get props => [meals];
  BasketState copyWith({List<Meal>? orders}) {
    return BasketState(meals: orders ?? meals);
  }
}

class AddToBasketLoading extends BasketState {
  const AddToBasketLoading();
}

class AddToBasketState extends BasketState {
  const AddToBasketState({required super.meals});
  @override
  List<Object?> get props => [meals];
}

class AddToBasketError extends BasketState {
  final String message;
  const AddToBasketError(this.message);
  @override
  List<Object?> get props => [message];
}

class ShowBasketElementLoading extends BasketState {
  const ShowBasketElementLoading();
}

class ShowBasketElementSuccess extends BasketState {
  const ShowBasketElementSuccess({required super.meals});
}

class BasketEmpty extends BasketState {
  const BasketEmpty({super.meals = const []});
}

class SendOrderSuccess extends BasketState {
  final String message;
  const SendOrderSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class SendOrderError extends BasketState {
  final String message;
  const SendOrderError(this.message);
  @override
  List<Object?> get props => [message];
}
class EditOrderState extends BasketState{
    const EditOrderState({required super.meals});
  @override
  List<Object?> get props => [meals];
}

class Meal extends Equatable {
  final int id;
  final String name;
  final String description;
  int quantity;
  final double price;
  Meal(
      {required this.id,
      required this.name,
      required this.description,
      required this.quantity,
      required this.price});

  @override
  List<Object?> get props => [id, name, description, quantity];
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'quantity': quantity,
    };
  }

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }
}
