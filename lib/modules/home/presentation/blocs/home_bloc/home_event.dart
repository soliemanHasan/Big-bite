part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class FetchNewsEvent extends HomeEvent {
  const FetchNewsEvent();
}
