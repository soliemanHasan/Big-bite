import 'package:big_bite/modules/meals/presentation/screens/show_meal_details_screen.dart';
import 'package:go_router/go_router.dart';

class ShowMealDetailsRoute {
  static const name = '/showDetails';
  static GoRoute route = GoRoute(
    path: '/showDetails/:id',
    name: name,
    builder: (context, state) => ShowMealDetailsScreen(
      id: state.pathParameters["id"]!,
    ),
  );
}
