part of 'meal_bloc.dart';

class FetchMealEvent extends Equatable {
  const FetchMealEvent();

  @override
  List<Object?> get props => [];
}

class FetchMealFirstTimeEvent extends FetchMealEvent {
  final int categoryId;

  const FetchMealFirstTimeEvent({required this.categoryId, });
  @override
  List<Object?> get props => [categoryId];
}

class LoadMoreMealEvent extends FetchMealEvent {
  final int categoryId;

  const LoadMoreMealEvent({required this.categoryId, });
  @override
  List<Object?> get props => [categoryId,];
}

class RefreshMealEvent extends FetchMealEvent {
  final int categoryId;
  const RefreshMealEvent({required this.categoryId});
  @override
  List<Object?> get props => [categoryId];
}
