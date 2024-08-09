import 'package:big_bite/core/constants/app_colors.dart';
import 'package:big_bite/core/core_component/app_button.dart';
import 'package:big_bite/core/core_component/custom_app_bar.dart';
import 'package:big_bite/core/core_component/failure_component.dart';
import 'package:big_bite/core/core_component/loading_component.dart';
import 'package:big_bite/core/errors/failure.dart';
import 'package:big_bite/core/paths/images_paths.dart';
import 'package:big_bite/core/paths/svgs_paths.dart';
import 'package:big_bite/core/services/service_locator.dart';
import 'package:big_bite/core/utils/base_state.dart';
import 'package:big_bite/modules/basket/presentation/blocs/basket_bloc.dart';
import 'package:big_bite/modules/basket/presentation/blocs/basket_state.dart';
import 'package:big_bite/modules/basket/presentation/route/basket_route.dart';
import 'package:big_bite/modules/basket/presentation/screens/basket_screen.dart';
import 'package:big_bite/modules/meals/domain/entities/meal_entity.dart';
import 'package:big_bite/modules/meals/presentation/blocs/show_meal_details_bloc/show_meal_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ShowMealDetailsScreen extends StatelessWidget {
  final String id;
  const ShowMealDetailsScreen({
    super.key,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: BlocProvider(
        create: (context) =>
            sl<ShowMealDetailsBloc>()..add(ShowMealDetailsEvent(int.parse(id))),
        child: BlocBuilder<ShowMealDetailsBloc, BaseState<MealEntity>>(
            builder: (context, state) {
          if (state.isError) {
            return FailureComponent(failure: Failure(state.errorMessage));
          } else if (state.isSuccess) {
            return ShowDetailsComponent(
              mealEntity: state.data!,
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

class ShowDetailsComponent extends StatefulWidget {
  final MealEntity mealEntity;
  const ShowDetailsComponent({super.key, required this.mealEntity});

  @override
  State<ShowDetailsComponent> createState() => _ShowDetailsComponentState();
}

class _ShowDetailsComponentState extends State<ShowDetailsComponent> {
  int quantity = 0;
  var totalPrice = 0.0;
  String hint = '';
  List<Map<String, dynamic>> order = [];

  final TextEditingController noteController = TextEditingController();

  void increaseQuantity() {
    setState(() {
      quantity++;
      calculateTotal();
    });
  }

  void decreaseQuantity() {
    if (quantity == 0) return;
    setState(() {
      quantity--;
      calculateTotal();
    });
  }

  void calculateTotal() {
    totalPrice = quantity * double.parse(widget.mealEntity.price);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BasketBloc>(),
      child: SingleChildScrollView(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.mealEntity.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "price : ${widget.mealEntity.price}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: decreaseQuantity,
                    icon: SvgPicture.asset(
                      SvgsPaths.subtract,
                      height: 60,
                      width: 60,
                    )),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  quantity.toString(),
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(
                  width: 10.w,
                ),
                IconButton(
                  onPressed: increaseQuantity,
                  icon: SvgPicture.asset(
                    SvgsPaths.add,
                    height: 60,
                    width: 60,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Total Price : $totalPrice",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.mealEntity.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 4,
                controller: noteController,
                decoration: const InputDecoration(
                    fillColor: AppColors.grey,
                    enabledBorder:
                        UnderlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AppButton(
                style: Theme.of(context).textTheme.headlineMedium,
                height: 60,
                width: 400,
                label: "add to Basket",
                onTap: _addToBasket,
              ),
            ),
            hint == ""
                ? const SizedBox()
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      hint,
                      style: const TextStyle(color: AppColors.red),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  void _addToBasket() {
    if (quantity == 0) {
      setState(() {
        hint = "choice the quaintly";
      });
    } else {
      final Meal order = Meal(
          id: widget.mealEntity.id,
          name: widget.mealEntity.name,
          description: noteController.text,
          price: totalPrice,
          quantity: quantity);
      sl<BasketBloc>().add(AddToBasketEvent(order));

      context.go(BasketRoute.name);
    }
  }
}
