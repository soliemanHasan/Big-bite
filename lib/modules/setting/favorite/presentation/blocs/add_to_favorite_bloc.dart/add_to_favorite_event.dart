part of 'add_to_favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();
  @override
  List<Object?> get props => [];
}

class AddToFavoriteEvent extends FavoriteEvent {
  final int id;
  const AddToFavoriteEvent(this.id);
  @override
  List<Object?> get props => [id];
}

class ShowFavoriteEvent extends FavoriteEvent {
  const ShowFavoriteEvent();
  @override
  List<Object?> get props => [];
}
