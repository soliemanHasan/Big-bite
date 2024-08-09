import 'package:big_bite/modules/meals/presentation/screens/meal_screen.dart';
import 'package:go_router/go_router.dart';

class MealRoute {
  static const name = '/meals';
  static GoRoute route = GoRoute(
    path: '/meals/:id',
    name: name,
    builder: (context, state) => MealScreen(
      categoryId: state.pathParameters["id"]!,
    ),
  );
}
