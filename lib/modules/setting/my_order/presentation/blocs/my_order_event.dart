part of 'my_order_bloc.dart';

abstract class MyOrderEvent extends Equatable {
  const MyOrderEvent();

  @override
  List<Object?> get props => [];
}

class FetchMyOrderFirstTimeEvent extends MyOrderEvent {
  const FetchMyOrderFirstTimeEvent();
  @override
  List<Object?> get props => [];
}

class LoadMoreMyMealEvent extends MyOrderEvent {
  const LoadMoreMyMealEvent();
  @override
  List<Object?> get props => [];
}

class RefreshMyOrderEvent extends MyOrderEvent {
  const RefreshMyOrderEvent();
  @override
  List<Object?> get props => [];
}

class ShowMyOderDetails extends MyOrderEvent {
  final String id;

  const ShowMyOderDetails(this.id);
  @override
  List<Object?> get props => [id];
}
