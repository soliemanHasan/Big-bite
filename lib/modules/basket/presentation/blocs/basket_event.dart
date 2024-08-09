part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object?> get props => [];
}

class AddToBasketEvent extends BasketEvent {
  final Meal meal;
  const AddToBasketEvent(this.meal);
  @override
  List<Object?> get props => [meal];
}

class ShowOrderEvent extends BasketEvent {
  const ShowOrderEvent();

  @override
  List<Object?> get props => [];
}

class RemoveMealEvent extends BasketEvent {
  final int id;
  const RemoveMealEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class ClearBasket extends BasketEvent {
  const ClearBasket();
}

class SendOrderEvent extends BasketEvent {
  final String type;
  final List<Map<String, dynamic>> orders;
  const SendOrderEvent({required this.type, required this.orders});
}

class EditOrderEvent extends BasketEvent {
  final int id;
  const EditOrderEvent(this.id);

  @override
  List<Object?> get props => [id];
}
