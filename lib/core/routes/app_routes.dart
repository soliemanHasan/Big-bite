// import 'package:flutter/material.dart';
import 'package:big_bite/modules/auth/presentation/routes/login_route.dart';
import 'package:big_bite/modules/auth/presentation/routes/register_route.dart';
import 'package:big_bite/modules/auth/presentation/routes/verify_route.dart';
import 'package:big_bite/modules/basket/presentation/route/basket_route.dart';
import 'package:big_bite/modules/home/presentation/routes/main_route.dart';
import 'package:big_bite/modules/home/presentation/routes/show_news_details_route.dart';
import 'package:big_bite/modules/meals/presentation/route/meal_route.dart';
import 'package:big_bite/modules/meals/presentation/route/show_meal_details_route.dart';
import 'package:big_bite/modules/setting/favorite/presentation/route/favorite_route.dart';
import 'package:big_bite/modules/setting/favorite/presentation/route/show_favorite_details_route.dart';
import 'package:big_bite/modules/setting/my_order/presentation/blocs/my_order_bloc.dart';
import 'package:big_bite/modules/setting/my_order/presentation/route/my_order_route.dart';
import 'package:big_bite/modules/setting/my_order/presentation/route/show_my_order_details.dart';
import 'package:big_bite/modules/start/start_route.dart';
import 'package:go_router/go_router.dart';

/// The [AppRoutes] class defines a static router instance of the GoRouter class,
/// which is a routing solution commonly used in Flutter applications
/// It manages the navigation flow between different screens or pages.
/// The routes parameter specifies the available routes in the application.
/// By commenting out the class, you disable the routing functionality,
/// making it impossible to navigate between screens/pages.
///
/// define Route class
/// EX: class FeatureRoute {
///  static const String name = '/route';
///  static GoRoute route = GoRoute(
///    path: name,
///    builder: (context, state) => FeaturesScreen(),
///  );
/// }

class AppRoutes {
  static final router = GoRouter(
    initialLocation: LoginRoute.name,

    // TODO: add pages route here
    routes: [
      LoginRoute.route,
      RegisterRoute.route,
      VerifyRoute.route,
      MainRoute.route,
      StartRoute.route,
      ShowNewsDetailsRoute.route,
      MealRoute.route,
      ShowMealDetailsRoute.route,
      BasketRoute.route,
      MyOrderRoute.route,
      ShowMyOrderDetailsRoute.route,
      FavoriteRoute.route,
      ShowFavoriteDetailsRoute.route,
    ],
  );
}
