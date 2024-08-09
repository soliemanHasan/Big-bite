import 'dart:async';

import 'package:big_bite/modules/basket/domain/parameters/order_parameters.dart';
import 'package:big_bite/modules/basket/domain/repository/basket_repository.dart';
import 'package:big_bite/modules/basket/presentation/blocs/basket_state.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'basket_event.dart';

class BasketBloc extends HydratedBloc<BasketEvent, BasketState> {
  final BasketRepository basketRepository;

  BasketBloc(this.basketRepository) : super(const BasketState(meals: [])) {
    on<AddToBasketEvent>(_addElement);
    on<ShowOrderEvent>(_showBasket);
    on<SendOrderEvent>(_sendOrder);
    on<EditOrderEvent>(_editOrder);
  }

  void _addElement(AddToBasketEvent event, Emitter<BasketState> emit) {
    try {
      final order = event.meal;
      final isExcite = state.meals.any(
        (element) => element.id == order.id,
      );

      /*check if element excite and update it */
      if (isExcite) {
        final updatedOrders = _updateExcitingMeal(event.meal);

        emit(AddToBasketState(meals: updatedOrders));
      } else {
        /* not excite just add it */
        final updatedOrders = List<Meal>.from(state.meals)..add(event.meal);
        emit(AddToBasketState(meals: updatedOrders));
      }
    } catch (error) {
      emit(AddToBasketError(error.toString()));
    }
  }

  List<Meal> _updateExcitingMeal(Meal meal) {
    final indexOrder = state.meals.indexWhere(
      (element) => element.id == meal.id,
    );
    final excitingOrder = state.meals.firstWhere(
      (element) => element.id == meal.id,
    );
    state.meals[indexOrder] = Meal(
        id: excitingOrder.id,
        name: excitingOrder.name,
        description: excitingOrder.description,
        price: excitingOrder.price,
        quantity: excitingOrder.quantity);

    return state.meals;
  }

  /* --------------------------- show basket elemnt --------------------------- */
  FutureOr<void> _showBasket(ShowOrderEvent event, Emitter<BasketState> emit) {
    // emit(const ShowBasketElementLoading());
    try {
      emit(ShowBasketElementSuccess(meals: state.meals));
    } catch (error) {
      emit(const BasketEmpty());
    }
  }

  @override
  BasketState? fromJson(Map<String, dynamic> json) {
    final meals =
        (json['meals'] as List).map((meal) => Meal.fromJson(meal)).toList();
    return BasketState(meals: meals);
  }

  @override
  Map<String, dynamic> toJson(BasketState state) {
    final meals = state.meals.map((meal) => meal.toJson()).toList();
    return {'meals': meals};
  }

  /* ------------------------------- send order ------------------------------- */
  FutureOr<void> _sendOrder(
      SendOrderEvent event, Emitter<BasketState> emit) async {
    final result = await basketRepository
        .sendOrder(OrderParameters(order: event.orders, type: event.type));
    result.fold(
      (l) => emit(SendOrderError(l.toString())),
      (r) => emit(SendOrderSuccess(r.toString())),
    );
  }

  /* ------------------------------- edit order ------------------------------- */
  FutureOr<void> _editOrder(EditOrderEvent event , Emitter<BasketState>emit)async{

  }

}
