import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/base_state.dart';
import '../../../domain/entities/news_entity.dart';
import '../../../domain/repository/home_repository.dart';
part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, BaseState<List<NewsEntity>>> {
  final HomeRepository homeRepository;

  HomeBloc(this.homeRepository) : super(const BaseState<List<NewsEntity>>()) {
    on<FetchNewsEvent>(_getHome);
  }
  FutureOr<void> _getHome(FetchNewsEvent event, emit) async {
    emit(state.loading());
    final result = await homeRepository.getNews();
    result.fold((l) => emit(state.error(l)), (r) => emit(state.success(r)));
  }
}
