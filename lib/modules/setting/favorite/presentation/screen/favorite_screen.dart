import 'package:big_bite/core/constants/app_colors.dart';
import 'package:big_bite/core/core_component/failure_component.dart';
import 'package:big_bite/core/core_component/loading_component.dart';
import 'package:big_bite/core/core_component/pagination_list_view_component.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/core/services/service_locator.dart';
import 'package:big_bite/core/utils/base_pagination_bloc/pagination_state.dart';
import 'package:big_bite/modules/setting/favorite/domain/entities/favorite_entity.dart';
import 'package:big_bite/modules/setting/favorite/presentation/blocs/show_favorite_bloc.dart/show_favorite_bloc.dart';
import 'package:big_bite/modules/setting/favorite/presentation/route/show_favorite_details_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    sl<ShowFavoriteBloc>().add(const RefreshFavoriteEvent());
    sl<ShowFavoriteBloc>().add(const FetchFavoriteFirstTimeEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (context) => BlocBuilder<ShowFavoriteBloc,
            PaginationState<List<MyFavoriteEntity>>>(
          bloc: sl<ShowFavoriteBloc>(),
          builder: (context, state) {
            if (state.isError) {
              return FailureComponent(failure: Failure(state.errorMessage));
            } else if (state.isSuccess) {
              return SizedBox(
                height: 700.h,
                child: PaginatedListView(
                    itemBuilder: (p0) =>
                        MyFavoriteComponent(favoriteEntity: state.data![p0]),
                    onCallMoreData: () {
                      sl<ShowFavoriteBloc>().add(const LoadMoreFavoriteEvent());
                    },
                    state: state),
              );
            } else if (state.isLoading) {
              return const LoadingComponent();
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class MyFavoriteComponent extends StatelessWidget {
  final MyFavoriteEntity favoriteEntity;
  const MyFavoriteComponent({super.key, required this.favoriteEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(ShowFavoriteDetailsRoute.name, extra: {
        "id": favoriteEntity.id,
        "meals": favoriteEntity.orderEntity.meals,
        "drinks": favoriteEntity.orderEntity.drinks,
        "status": favoriteEntity.orderEntity.status,
        "price": favoriteEntity.orderEntity.totalAmount,
      }),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.bookComponentColor,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Number: ${favoriteEntity.id}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    width: 80.w,
                  ),
                  Text(
                    "Status : ${favoriteEntity.orderEntity.status}",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    "Price ${favoriteEntity.orderEntity.totalAmount} Sp",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Text(
                    "time ${favoriteEntity.orderEntity.type}",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
