import 'package:big_bite/core/core_component/failure_component.dart';
import 'package:big_bite/core/core_component/loading_component.dart';
import 'package:big_bite/core/core_component/pagination_list_view_component.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/core/services/service_locator.dart';
import 'package:big_bite/core/utils/base_pagination_bloc/pagination_state.dart';
import 'package:big_bite/modules/setting/my_order/domain/entities/my_order_entity.dart';
import 'package:big_bite/modules/setting/my_order/presentation/blocs/my_order_bloc.dart';
import 'package:big_bite/modules/setting/my_order/presentation/components/my_order_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  @override
  void initState() {
    sl<MyOrderBloc>().add(const RefreshMyOrderEvent());
    sl<MyOrderBloc>().add(const FetchMyOrderFirstTimeEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (context) =>
            BlocBuilder<MyOrderBloc, PaginationState<List<MyOrderEntity>>>(
          bloc: sl<MyOrderBloc>(),
          builder: (context, state) {
            if (state.isError) {
              return FailureComponent(failure: Failure(state.errorMessage));
            }
            if (state.isSuccess) {
              return SizedBox(
                height: 400.h,
                child: PaginatedListView(
                    itemBuilder: (p0) =>
                        MyOrderComponent(myOrderEntity: state.data![p0]),
                    onCallMoreData: () {
                      sl<MyOrderBloc>().add(const LoadMoreMyMealEvent());
                    },
                    state: state),
              );
            }
            if (state.isLoading) {
              return const LoadingComponent();
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
