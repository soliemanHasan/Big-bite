import 'dart:async';

import 'package:big_bite/core/utils/base_pagination_bloc/pagination_bloc.dart';
import 'package:big_bite/core/utils/base_pagination_bloc/pagination_state.dart';
import 'package:big_bite/modules/setting/favorite/domain/entities/favorite_entity.dart';
import 'package:big_bite/modules/setting/favorite/domain/parameters/show_favorite_parameters.dart';
import 'package:big_bite/modules/setting/favorite/domain/repository/favorite_repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'show_favorite_event.dart';

class ShowFavoriteBloc
    extends PaginationBloc<ShowFavoriteEvent, MyFavoriteEntity> {
  final FavoriteRepository favoriteRepository;
  ShowFavoriteBloc(this.favoriteRepository) : super(initialPage: 1) {
    on<FetchFavoriteFirstTimeEvent>(fetchDataFirstTime,
        transformer: restartable());
    on<LoadMoreFavoriteEvent>(loadMoreData, transformer: restartable());
    on<RefreshFavoriteEvent>(refresh, transformer: restartable());
  }

  @override
  FutureOr<void> fetchDataFirstTime(ShowFavoriteEvent event,
      Emitter<PaginationState<List<MyFavoriteEntity>>> emit) async {
    event as FetchFavoriteFirstTimeEvent;
    emit(state.loading());
    final result = await favoriteRepository
        .showFavorite(ShowFavoriteParameters(state.page));

    handleResult(result, emit);
  }

  @override
  FutureOr<void> loadMoreData(ShowFavoriteEvent event,
      Emitter<PaginationState<List<MyFavoriteEntity>>> emit) async {
    event as LoadMoreFavoriteEvent;

    final result = await favoriteRepository
        .showFavorite(ShowFavoriteParameters((state.page)));
    handleResult(result, emit);
  }

  @override
  FutureOr<void> refresh(ShowFavoriteEvent event,
      Emitter<PaginationState<List<MyFavoriteEntity>>> emit) {
    emit(state.refresh());
  }
}
