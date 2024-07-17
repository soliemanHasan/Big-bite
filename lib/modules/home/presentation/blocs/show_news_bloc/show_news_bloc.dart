import 'dart:async';

import 'package:big_bite/core/utils/base_state.dart';
import 'package:big_bite/modules/home/domain/entities/news_entity.dart';
import 'package:big_bite/modules/home/domain/parameters/show_news_parameters.dart';
import 'package:big_bite/modules/home/domain/repository/home_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'show_news_event.dart';

class ShowNewsBloc extends Bloc<ShowNewsEvent, BaseState<NewsEntity>> {
  final HomeRepository homeRepository;
  ShowNewsBloc(this.homeRepository) : super(const BaseState<NewsEntity>()) {
    on<ShowNewsEvent>(_showNewsDetails);
  }
  FutureOr<void> _showNewsDetails(ShowNewsEvent event, emit) async {
    emit(state.loading());
    final result =
        await homeRepository.showNewsDetails(ShowNewsParameters(id: event.id));
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
