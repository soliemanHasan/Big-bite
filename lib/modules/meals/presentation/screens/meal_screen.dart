import 'package:big_bite/core/constants/app_colors.dart';
import 'package:big_bite/core/core_component/failure_component.dart';
import 'package:big_bite/core/core_component/pagination_list_view_component.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/core/services/service_locator.dart';
import 'package:big_bite/core/utils/base_pagination_bloc/pagination_state.dart';
import 'package:big_bite/modules/meals/domain/entities/meal_entity.dart';
import 'package:big_bite/modules/meals/presentation/blocs/meals_bloc/meal_bloc.dart';
import 'package:big_bite/modules/meals/presentation/component/meal_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MealScreen extends StatefulWidget {
  final String categoryId;
  const MealScreen({super.key, required this.categoryId});

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  @override
  void initState() {
    sl<MealBloc>()
        .add(RefreshMealEvent(categoryId: int.parse(widget.categoryId)));
    sl<MealBloc>()
        .add(FetchMealFirstTimeEvent(categoryId: int.parse(widget.categoryId)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(builder: (context) {
        return BlocBuilder<MealBloc, PaginationState<List<MealEntity>>>(
          bloc: sl<MealBloc>(),
          builder: (context, state) {
            if (state.isLoading) {
              return Container(
                color: AppColors.black,
                height: 50,
              );
            } else if (state.isError) {
              return FailureComponent(failure: Failure(state.errorMessage));
            } else if (state.isSuccess) {
              return SizedBox(
                child: PaginatedListView(
                    itemBuilder: (index) => MealComponent(
                          mealEntity: state.data![index],
                        ),
                    separatorBuilder: (context, index) => const Divider(
                          thickness: 0.5,
                          endIndent: 20,
                          indent: 17,
                          color: AppColors.grey,
                        ),
                    onRefresh: () {
                      sl<MealBloc>().add(RefreshMealEvent(
                        categoryId: int.parse(widget.categoryId),
                      ));
                      sl<MealBloc>().add(FetchMealFirstTimeEvent(
                        categoryId: int.parse(widget.categoryId),
                      ));
                    },
                    onCallMoreData: () => sl<MealBloc>().add(LoadMoreMealEvent(
                          categoryId: int.parse(widget.categoryId),
                        )),
                    state: state),
              );
            }
            return SizedBox();
          },
        );
      }),
    );
  }
}
