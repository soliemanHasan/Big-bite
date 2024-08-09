import 'package:big_bite/modules/setting/favorite/presentation/screen/favorite_screen.dart';
import 'package:go_router/go_router.dart';

class FavoriteRoute {
  static const name = "/favorite";
  static GoRoute route = GoRoute(
    path: name,
    name: name,
    builder: (context, state) => const FavoriteScreen(),
  );
}
