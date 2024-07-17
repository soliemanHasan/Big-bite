import 'package:big_bite/core/core_component/app_button.dart';
import 'package:big_bite/core/core_component/failure_component.dart';
import 'package:big_bite/core/core_component/loading_component.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/core/paths/images_paths.dart';
import 'package:big_bite/core/utils/base_state.dart';
import 'package:big_bite/generated/locale_keys.g.dart';
import 'package:big_bite/modules/home/domain/entities/news_entity.dart';
import 'package:big_bite/modules/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:big_bite/modules/home/presentation/components/news_component.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeBloc, BaseState<List<NewsEntity>>>(
        builder: (context, state) {
          if (state.isError) {
            return FailureComponent(failure: Failure(state.errorMessage));
          } else if (state.isSuccess) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* ------------------------ home image with AppButton ----------------------- */

                  Stack(
                    children: [
                      SizedBox(
                        height: 550.h,
                        child: Image.asset(
                          ImagesPaths.homeImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          left: 20.w,
                          bottom: 40.h,
                          child: AppButton(
                              width: 350,
                              height: 60,
                              label: LocaleKeys.orderNow.tr(),
                              style: Theme.of(context).textTheme.headlineMedium,
                              onTap: () {})),
                    ],
                  ),
                  /* -------------------- news headline and view all button ------------------- */
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          LocaleKeys.news.tr(),
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                           LocaleKeys.viewAll.tr(),
                            style: Theme.of(context).textTheme.labelMedium,
                          ))
                    ],
                  ),
                  /* -------------------- list view builder to build newses ------------------- */
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.data!.length,
                        itemBuilder: (context, index) {
                          return NewsComponent(newsEntity: state.data![index]);
                        }),
                  )
                ],
              ),
            );
          } else if (state.isLoading) {
            return const LoadingComponent();
          }
          return const LoadingComponent();
        },
      ),
    );
  }
}
