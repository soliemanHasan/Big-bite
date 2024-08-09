import 'package:big_bite/modules/setting/favorite/domain/entities/favorite_entity.dart';
import 'package:big_bite/modules/setting/favorite/presentation/screen/show_favorite_details_screen.dart';
import 'package:go_router/go_router.dart';

class ShowFavoriteDetailsRoute {
  static const name = '/showFavoriteDetails';
  static GoRoute route = GoRoute(
    path: '/show_favorite_details',
    name: name,
    builder: (context, state) {
      final extras = state.extra as Map<String, dynamic>?;

      final List<MealEntity>? meals = extras?["meals"] as List<MealEntity>?;
      final List<DrinkEntity>? drinks = extras?["drinks"] as List<DrinkEntity>?;
      return ShowFavoriteDetailsScreen(
        id: extras!["id"],
        meals: meals,
        drinks: drinks,
        status: extras["status"],
        price: extras["price"],
      );
    },
  );
}
