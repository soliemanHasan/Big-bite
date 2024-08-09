import 'package:big_bite/core/constants/app_colors.dart';
import 'package:big_bite/core/core_component/app_button.dart';
import 'package:big_bite/core/core_component/loading_component.dart';
import 'package:big_bite/core/paths/svgs_paths.dart';
import 'package:big_bite/core/services/service_locator.dart';
import 'package:big_bite/modules/auth/presentation/components/auth_text_form_fields.dart';
import 'package:big_bite/modules/basket/presentation/blocs/basket_bloc.dart';
import 'package:big_bite/modules/basket/presentation/blocs/basket_state.dart';
import 'package:big_bite/modules/home/presentation/routes/main_route.dart';
import 'package:big_bite/modules/meals/presentation/route/show_meal_details_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  TextEditingController mainAddressController = TextEditingController();
  TextEditingController anotherAddressController = TextEditingController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basket"),
        actions: [
          IconButton(
              onPressed: () => context.pushNamed(MainRoute.name),
              icon: Icon(Icons.arrow_back))
        ],
      ),
      body: BlocBuilder<BasketBloc, BasketState>(
        bloc: sl<BasketBloc>()..add(const ShowOrderEvent()),
        builder: (context, state) {
          if (state is ShowBasketElementSuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "choice order type ",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          2,
                          (index) => CustomSelectedOrderType(
                              label: labels[index],
                              isPressed: selectedIndex == index,
                              onPressed: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              svgPath: svgPath[index]),
                        ),
                      ),
                      selectedIndex == 0
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Add your address",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                AuthTextFormField(
                                  hint: "Main address",
                                  controller: mainAddressController,
                                ),
                                SizedBox(
                                  height: 20.h,
                                ),
                                AuthTextFormField(
                                  hint: "another address",
                                  controller: anotherAddressController,
                                ),
                              ],
                            )
                          : Container(),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Your Order",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: selectedIndex == 0 ? 300.h : 400.h,
                        child: ListView.builder(
                          itemCount: state.meals.length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColors.bookComponentColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: AppColors.primarywithocity,
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: Text(
                                        "${state.meals[index].quantity.toString()} ",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        state.meals[index].name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                      Text(
                                        " ${state.meals[index].price.toString()} sp",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      IconButton(
                                          onPressed: () => context.pushNamed(
                                                  ShowMealDetailsRoute.name,
                                                  pathParameters: {
                                                    "id": state.meals[index].id
                                                        .toString(),
                                                  }),
                                          icon: const Icon(Icons.edit)),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.delete))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AppButton(
                            height: 60,
                            label: "send order",
                            onTap: () {
                              showConfirmDialog(
                                context,
                                height: 300,
                                title: "Are you sure you went to send order",
                                onConfirm: () {
                                  context.read<BasketBloc>().add(SendOrderEvent(
                                      type: type, orders: order(state)));
                                  print("-------------------");
                                  print(order(state));
                                },
                              );
                            }),
                      ),
                    ]),
              ),
            );
          } else if (state is BasketEmpty) {
            return Container(
              height: 100,
              color: AppColors.red,
              child: Text("errror"),
            );
          } else if (state is ShowBasketElementLoading) {
            return LoadingComponent();
          } else {
            return Container(
              height: 100,
              color: AppColors.black,
            );
          }
        },
      ),
    );
  }

  List<Map<String, dynamic>> order(BasketState state) {
    List<Map<String, dynamic>> orders = [];
    final order = state.meals
        .map(
          (e) => {
            "meal_id": e.id,
            "quantity": e.quantity,
            "note": e.description,
          },
        )
        .toList();
    orders.addAll(order);
    return orders;
  }

  String get type => selectedIndex == 1 ? "Takeaway" : "Delivery";

  List<String> get svgPath => [
        SvgsPaths.delivery,
        SvgsPaths.takeAway,
      ];
  List<String> get labels => [
        "Delivery",
        "TakeAway",
      ];
}

/////////////////////////////////////////////////////////////////////////
class CustomSelectedOrderType extends StatelessWidget {
  final String svgPath;
  final void Function()? onPressed;
  final String label;
  final bool isPressed;

  const CustomSelectedOrderType(
      {super.key,
      required this.label,
      required this.isPressed,
      required this.onPressed,
      required this.svgPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: onPressed,
            child: AnimatedContainer(
              padding: const EdgeInsets.all(10),
              duration: const Duration(microseconds: 300),
              curve: Curves.easeInOut,
              height: 80.h,
              width: 70.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isPressed
                    ? AppColors.selectedIconColor
                    : Colors.transparent,
              ),
              child: SvgPicture.asset(
                height: 70.h,
                width: 70.w,
                svgPath,
              ),
            )),
        Text(label),
      ],
    );
  }
}

///////////////////////////////////////////////
void showConfirmDialog(
  BuildContext context, {
  EdgeInsets? padding,
  double? height,
  VoidCallback? onConfirm,
  VoidCallback? onCancel,
  String? title,
  Widget? child,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9),
          side: const BorderSide(color: AppColors.red),
        ),
        elevation: 1,
        insetPadding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 10.w),
        child: Container(
          width: 100.w,
          height: height ?? 30.h,
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              // Content
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: child ??
                        Text(
                          title ?? '',
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      label: "cancel",
                      color: AppColors.darkGray,
                      style: Theme.of(context).textTheme.labelSmall,
                      onTap: onConfirm != null
                          ? () {
                              context.pop();
                              onConfirm();
                            }
                          : () => context.pop(),
                      height: 50.h,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: AppButton(
                      height: 50.h,
                      label: "ok",
                      style: Theme.of(context).textTheme.labelSmall,
                      onTap: onCancel ?? () => context.pop(),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}
