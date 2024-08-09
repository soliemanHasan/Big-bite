import 'dart:async';
import 'package:big_bite/core/utils/base_pagination_bloc/pagination_bloc.dart';
import 'package:big_bite/core/utils/base_pagination_bloc/pagination_state.dart';
import 'package:big_bite/modules/setting/my_order/domain/entities/my_order_entity.dart';
import 'package:big_bite/modules/setting/my_order/domain/parameters/my_order_parameters.dart';
import 'package:big_bite/modules/setting/my_order/domain/repository/my_order_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'my_order_event.dart';

class MyOrderBloc extends PaginationBloc<MyOrderEvent, MyOrderEntity> {
  final MyOrderRepository myOrderRepository;
  MyOrderBloc(this.myOrderRepository) : super(initialPage: 1) {
    on<FetchMyOrderFirstTimeEvent>(fetchDataFirstTime,
        transformer: restartable());
    on<LoadMoreMyMealEvent>(loadMoreData, transformer: restartable());
    on<RefreshMyOrderEvent>(refresh, transformer: restartable());
  }

  @override
  FutureOr<void> fetchDataFirstTime(MyOrderEvent event,
      Emitter<PaginationState<List<MyOrderEntity>>> emit) async {
    event as FetchMyOrderFirstTimeEvent;
    emit(state.loading());
    final result = await myOrderRepository
        .showMyOrder(MyOrderParameters(page: state.page));

    handleResult(result, emit);
  }

  @override
  FutureOr<void> loadMoreData(MyOrderEvent event,
      Emitter<PaginationState<List<MyOrderEntity>>> emit) async {
    event as LoadMoreMyMealEvent;

    final result = await myOrderRepository
        .showMyOrder(MyOrderParameters(page: (state.page)));
    handleResult(result, emit);
  }

  @override
  FutureOr<void> refresh(
      MyOrderEvent event, Emitter<PaginationState<List<MyOrderEntity>>> emit) {
    emit(state.refresh());
  }
  
}
