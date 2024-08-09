import 'package:big_bite/core/constants/app_colors.dart';
import 'package:big_bite/core/core_component/app_button.dart';
import 'package:big_bite/core/core_component/show_snack_bar.dart';
import 'package:big_bite/core/services/service_locator.dart';
import 'package:big_bite/modules/basket/presentation/blocs/basket_bloc.dart';
import 'package:big_bite/modules/basket/presentation/blocs/basket_state.dart';
import 'package:big_bite/modules/basket/presentation/route/basket_route.dart';
import 'package:big_bite/modules/setting/favorite/domain/entities/favorite_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class ShowFavoriteDetailsScreen extends StatelessWidget {
  final int id;
  final List<MealEntity>? meals;
  final List<DrinkEntity>? drinks;
  final String status;
  final String price;

  const ShowFavoriteDetailsScreen(
      {super.key,
      this.drinks,
      this.meals,
      required this.price,
      required this.id,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: BlocProvider(
        create: (context) => sl<BasketBloc>(),
        child: BlocConsumer<BasketBloc, BasketState>(
          listener: _addToFavoriteListener,
          builder: (BuildContext context, BasketState state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (meals!.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Meals",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                if (meals!.isNotEmpty)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: meals!.length,
                        itemBuilder: (context, index) => MyOrderMealComponent(
                          meal: meals![index],
                          status: status,
                        ),
                      ),
                    ),
                  ),
                drinks!.isEmpty
                    ? const SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Drinks",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                if (drinks!.isNotEmpty)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: drinks!.length,
                        itemBuilder: (context, index) => MyOrderDrinkComponent(
                            drinkEntity: drinks![index], status: status),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppButton(
                    isLoading: state is AddToBasketLoading,
                    height: 60,
                    label: "Add To Basket",
                    onTap: () => null,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _addToFavoriteListener(BuildContext context, BasketState state) {
    if (state is AddToBasketError) {
      return showSnackBar(context, state.message);
    } else if (state is AddToBasketState) {
      showSnackBar(context, "Add Successfully");
      context.push(BasketRoute.name);
    }
  }
}

class MyOrderMealComponent extends StatelessWidget {
  final MealEntity meal;
  final String status;
  const MyOrderMealComponent(
      {super.key, required this.meal, required this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.bookComponentColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  meal.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "quantity: ${meal.details.quantity.toString()}",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            Text(
              "Price ${meal.price}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              width: 105.w,
            ),
            meal.details.customizedNote == null
                ? const SizedBox()
                : SizedBox(
                    width: 70.w,
                    child: Text(
                      "Customize Note :${meal.details.customizedNote}",
                      softWrap: true,
                      style: Theme.of(context).textTheme.labelMedium,
                    ))
          ],
        ),
      ),
    );
  }
}


class MyOrderDrinkComponent extends StatelessWidget {
  final DrinkEntity drinkEntity;
  final String status;
  const MyOrderDrinkComponent(
      {super.key, required this.drinkEntity, required this.status});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.bookComponentColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 100.w,
                  child: Text(
                    drinkEntity.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                Text(
                  "status :$status",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Price ${drinkEntity.details.price}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: 105.w,
                ),
                Text(
                  "quantity: ${drinkEntity.details.quantity.toString()}",
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
