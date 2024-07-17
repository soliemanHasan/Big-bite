import 'dart:async';

import 'package:big_bite/core/utils/base_pagination_bloc/pagination_bloc.dart';
import 'package:big_bite/core/utils/base_pagination_bloc/pagination_state.dart';
import 'package:big_bite/modules/meals/domain/entities/meal_entity.dart';
import 'package:big_bite/modules/meals/domain/parameters/meal_parameters.dart';
import 'package:big_bite/modules/meals/domain/repository/meal_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'meal_event.dart';

class MealBloc extends PaginationBloc<FetchMealEvent, MealEntity> {
  final MealRepository mealRepository;
  MealBloc(this.mealRepository) : super(initialPage: 1) {
    on<FetchMealFirstTimeEvent>(fetchDataFirstTime, transformer: restartable());
    on<LoadMoreMealEvent>(loadMoreData, transformer: restartable());
    on<RefreshMealEvent>(refresh, transformer: restartable());
  }

  @override
  FutureOr<void> fetchDataFirstTime(FetchMealEvent event,
      Emitter<PaginationState<List<MealEntity>>> emit) async {
    event as FetchMealFirstTimeEvent;
    emit(state.loading());
    final result = await mealRepository.fetchMeals(
        MealParameters(categoryId: event.categoryId, page: state.page));
    print("first =======================${state.page}");

    handleResult(result, emit);
  }

  @override
  FutureOr<void> loadMoreData(FetchMealEvent event,
      Emitter<PaginationState<List<MealEntity>>> emit) async {
    event as LoadMoreMealEvent;
    print("berfor =======================${state.page}");

    final result = await mealRepository.fetchMeals(
        MealParameters(categoryId: event.categoryId, page: (state.page)));
    print("after =======================${state.page + 1}");
    handleResult(result, emit);
  }

  @override
  FutureOr<void> refresh(
      FetchMealEvent event, Emitter<PaginationState<List<MealEntity>>> emit) {
    emit(state.refresh());
  }
}
