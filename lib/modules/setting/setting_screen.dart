import 'package:big_bite/core/constants/app_colors.dart';
import 'package:big_bite/modules/setting/favorite/presentation/route/favorite_route.dart';
import 'package:big_bite/modules/setting/my_order/presentation/route/my_order_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingComponent(
          label: "My Order",
          icon: Icons.widgets,
          onTap: () => context.pushNamed(MyOrderRoute.name),
        ),
        SettingComponent(
          label: "Favorite",
          icon: Icons.favorite,
          onTap: () =>
              context.pushNamed(FavoriteRoute.name), //context.pushNamed(),
        ),
      ],
    );
  }
}

class SettingComponent extends StatelessWidget {
  final String label;
  final IconData icon;
  final void Function() onTap;
  const SettingComponent(
      {super.key,
      required this.label,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.greyLit),
        ),
        child: Row(
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              width: 230.w,
            ),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}
