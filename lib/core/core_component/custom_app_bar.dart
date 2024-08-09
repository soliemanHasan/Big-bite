import 'package:big_bite/core/constants/app_colors.dart';
import 'package:big_bite/core/paths/svgs_paths.dart';
import 'package:big_bite/modules/basket/presentation/route/basket_route.dart';
import 'package:big_bite/modules/meals/presentation/route/show_meal_details_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final double? elevation;
  const CustomAppBar({super.key, this.title, this.elevation});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title ?? SizedBox(),
      actions: [
        GestureDetector(
          onTap: () => context.go(BasketRoute.name),
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: ShoppingBasket(
              quantity: 1,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class ShoppingBasket extends StatelessWidget {
  final int quantity;
  const ShoppingBasket({super.key, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return quantity != 0
        ? Stack(
            children: [
              SvgPicture.asset(
                SvgsPaths.basket,
                width: 40,
                height: 40,
              ),
              Positioned(
                top: 0.5.h,
                right: -1.w,
                child: ClipOval(
                  child: Container(
                    height: 20,
                    width: 20,
                    color: AppColors.primary,
                    child: Center(
                      child: Text(
                        quantity.toString(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        : SvgPicture.asset(
            SvgsPaths.basket,
            width: 20,
            height: 20,
          );
  }
}
