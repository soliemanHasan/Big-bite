import 'dart:async';

import 'package:big_bite/core/utils/base_state.dart';
import 'package:big_bite/modules/meals/domain/entities/meal_entity.dart';
import 'package:big_bite/modules/meals/domain/parameters/show_meal_details_parameters.dart';
import 'package:big_bite/modules/meals/domain/repository/meal_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'show_meal_details_event.dart';

class ShowMealDetailsBloc
    extends Bloc<ShowMealDetailsEvent, BaseState<MealEntity>> {
  final MealRepository mealRepository;
  ShowMealDetailsBloc(this.mealRepository)
      : super(const BaseState<MealEntity>()) {
    on<ShowMealDetailsEvent>(_showMealDetails);
  }
  FutureOr<void> _showMealDetails(ShowMealDetailsEvent event, emit) async {
    emit(state.loading());
    final result = await mealRepository
        .showMealDetails(ShowMealDetailsParameters(event.id));
    result.fold(
      (l) => emit(state.error(l)),
      (r) => emit(state.success(r)),
    );
  }
}
