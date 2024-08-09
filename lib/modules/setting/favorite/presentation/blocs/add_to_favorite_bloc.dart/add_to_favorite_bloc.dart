import 'dart:async';

import 'package:big_bite/core/utils/base_state.dart';
import 'package:big_bite/modules/setting/favorite/domain/parameters/favorite_parameters.dart';
import 'package:big_bite/modules/setting/favorite/domain/repository/favorite_repository.dart';
import 'package:big_bite/modules/setting/my_order/domain/entities/my_order_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_to_favorite_event.dart';

class AddToFavoriteBloc extends Bloc<FavoriteEvent, BaseState<MyOrderEntity>> {
  final FavoriteRepository favoriteRepository;
  AddToFavoriteBloc(this.favoriteRepository) : super(const BaseState()) {
    on<AddToFavoriteEvent>(_addToFavorite);
    //  on<ShowFavoriteEvent>(_showFavorite);
  }
  FutureOr<void> _addToFavorite(AddToFavoriteEvent event, emit) async {
    emit(state.loading());
    final result =
        await favoriteRepository.addToFavorite(FavoriteParameters(event.id));
    result.fold(
      (l) => emit(state.error(l)),
      (r) => emit(state.success(r)),
    );
  }
}
