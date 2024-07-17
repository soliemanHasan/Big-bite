import 'dart:async';

import 'package:big_bite/core/utils/base_state.dart';
import 'package:big_bite/modules/menu/domain/entities/category_menu_entity.dart';
import 'package:big_bite/modules/menu/domain/repository/menu_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_menu_event.dart';

class CategoryMenuBloc
    extends Bloc<FetchCategoryMenuEvent, BaseState<List<CategoryMenuEntity>>> {
  final MenuRepository menuRepository;
  CategoryMenuBloc(this.menuRepository)
      : super(const BaseState<List<CategoryMenuEntity>>()) {
    on<FetchCategoryMenuEvent>(_fetchMenuCategory);
  }
  FutureOr<void> _fetchMenuCategory(FetchCategoryMenuEvent event, emit) async {
    emit(state.loading());
    await Future.delayed(Duration(milliseconds: 500));
    final result = await menuRepository.fetchCategoryMenu();
    result.fold(
      (l) => emit(state.error(l)),
      (r) => emit(state.success(r)),
    );
  }
}
