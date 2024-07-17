import 'package:big_bite/core/constants/app_colors.dart';
import 'package:big_bite/core/core_component/failure_component.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/core/paths/images_paths.dart';
import 'package:big_bite/core/services/service_locator.dart';
import 'package:big_bite/core/utils/base_state.dart';
import 'package:big_bite/modules/menu/domain/entities/category_menu_entity.dart';
import 'package:big_bite/modules/menu/presentation/blocs/category_menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CategoryMenuScreen extends StatelessWidget {
  const CategoryMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryMenuBloc, BaseState<List<CategoryMenuEntity>>>(
        bloc: sl<CategoryMenuBloc>()..add(const FetchCategoryMenuEvent()),
        builder: (context, state) {
          if (state.isLoading) {
            return ListView.builder(
              itemCount: 10, // Number of shimmer items to display
              itemBuilder: (context, index) => Shimmer.fromColors(
                direction: ShimmerDirection.ltr,                                                                                                                                                                                                                                                                                                                                        
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  height: 250,
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 20,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state.isError) {
            return FailureComponent(failure: Failure(state.errorMessage));
          } else if (state.isSuccess) {
            return ListView.builder(
              itemCount: state.data!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 250,
                      child: GridTile(
                        footer: Container(
                          padding: const EdgeInsets.all(8.0),
                          alignment: Alignment.center,
                          color: AppColors.primary.withOpacity(0.7),
                          child: Text(state.data![index].name),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Image.asset(
                            images[index],
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return Shimmer.fromColors(
            period: const Duration(
              minutes: 1,
            ),
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Container(
              padding: const EdgeInsets.all(10.0),
              height: 250,
              width: double.infinity, // Adjust the height as needed
              color: Colors.white,
            ),
          ); // Loa
        });
  }

  List<String> get images => [
        ImagesPaths.shaurma,
        ImagesPaths.barbecue,
        ImagesPaths.meals,
        ImagesPaths.potato,
        ImagesPaths.hotdog,
        ImagesPaths.stike,
        ImagesPaths.burger,
        ImagesPaths.sandwich,
        ImagesPaths.salad,
        ImagesPaths.snacks,
      ];
}
