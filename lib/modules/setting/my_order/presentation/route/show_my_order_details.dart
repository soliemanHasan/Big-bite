import 'package:big_bite/modules/setting/my_order/domain/entities/my_order_entity.dart';
import 'package:big_bite/modules/setting/my_order/presentation/screen/show_my_order_details_screen.dart';
import 'package:go_router/go_router.dart';

class ShowMyOrderDetailsRoute {
  static const name = '/myOrderDetails';
  static GoRoute route = GoRoute(
    path: '/myOrderDetails',
    name: name,
    builder: (context, state) {
      final extras = state.extra as Map<String, dynamic>?;

      final List<MealEntity>? meals = extras?["meals"] as List<MealEntity>?;
      final List<DrinkEntity>? drinks = extras?["drinks"] as List<DrinkEntity>?;

      return ShowMyOrderDetailsScreen(
        id: extras!["id"],
        meals: meals,
        drinks: drinks,
        status: extras["status"],
        price: extras["price"],
      );
    },
  );
}
