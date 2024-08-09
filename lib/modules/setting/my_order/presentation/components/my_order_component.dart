import 'package:big_bite/core/constants/app_colors.dart';
import 'package:big_bite/core/enums/order_status.dart';
import 'package:big_bite/modules/setting/my_order/domain/entities/my_order_entity.dart';
import 'package:big_bite/modules/setting/my_order/presentation/route/show_my_order_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MyOrderComponent extends StatelessWidget {
  final MyOrderEntity myOrderEntity;
  const MyOrderComponent({super.key, required this.myOrderEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(ShowMyOrderDetailsRoute.name, extra: {
        "id": myOrderEntity.id,
        "meals": myOrderEntity.meals,
        "drinks": myOrderEntity.drinks,
        "status": myOrderEntity.status,
        "price": myOrderEntity.price,
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
                      "Number: ${myOrderEntity.id}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      width: 80.w,
                    ),
                    Text(
                      "Status : ${myOrderEntity.status}",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    ClipOval(
                      child: Container(
                        height: 10.h,
                        width: 10.w,
                        color: myOrderEntity.orderStatus.color,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      "Price ${myOrderEntity.price} Sp",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      width: 60.w,
                    ),
                    myOrderEntity.estimatedDeliveryTime == null
                        ? const SizedBox()
                        : Text(
                            "time ${myOrderEntity.estimatedDeliveryTime}",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                  ],
                )
              ],
            ),
          )),
    );
  }
}
