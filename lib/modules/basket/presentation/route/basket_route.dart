import 'package:big_bite/modules/basket/presentation/screens/basket_screen.dart';
import 'package:go_router/go_router.dart';

class BasketRoute {
  static const name = '/basket';
  static GoRoute route = GoRoute(
    path: name,
    name: name,
    builder: (context, state) => const BasketScreen(),
  );
}
