import 'package:big_bite/core/core_component/failure_component.dart';
import 'package:big_bite/core/core_component/loading_component.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/core/paths/images_paths.dart';
import 'package:big_bite/core/services/service_locator.dart';
import 'package:big_bite/core/utils/base_state.dart';
import 'package:big_bite/modules/meals/domain/entities/meal_entity.dart';
import 'package:big_bite/modules/meals/presentation/blocs/show_meal_details_bloc/show_meal_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowMealDetailsScreen extends StatelessWidget {
  final String title;
  final String id;
  const ShowMealDetailsScreen(
      {super.key, required this.id, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            sl<ShowMealDetailsBloc>()..add(ShowMealDetailsEvent(int.parse(id))),
        child: BlocBuilder<ShowMealDetailsBloc, BaseState<MealEntity>>(
            builder: (context, state) {
          if (state.isError) {
            return FailureComponent(failure: Failure(state.errorMessage));
          } else if (state.isSuccess) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: Image.asset(
                      height: 300.h,
                      width: double.infinity,
                      ImagesPaths.barbecue,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.data!.name,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.add_box_outlined)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      state.data!.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
            );
          } else if (state.isLoading) {
            return const LoadingComponent();
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
