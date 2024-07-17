part of 'show_meal_details_bloc.dart';

class ShowMealDetailsEvent extends Equatable {
  final int id;
  const ShowMealDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}
