import 'package:big_bite/core/paths/images_paths.dart';
import 'package:big_bite/modules/meals/domain/entities/meal_entity.dart';
import 'package:big_bite/modules/meals/presentation/route/show_meal_details_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MealComponent extends StatelessWidget {
  final MealEntity mealEntity;
  const MealComponent({super.key, required this.mealEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.pushNamed(ShowMealDetailsRoute.name, pathParameters: {
        "id": mealEntity.id.toString(),
        "title": mealEntity.name,
      }),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                width: 150.w,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(ImagesPaths.barbecue))),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mealEntity.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Text(
                    "Price ${mealEntity.price}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                      width: 200,
                      child: Text(
                        mealEntity.description,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall,
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
