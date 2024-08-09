import 'package:big_bite/core/services/cache_storage_services.dart';
import 'package:big_bite/modules/auth/presentation/routes/login_route.dart';
import 'package:go_router/go_router.dart';
import '../screens/main_screen.dart';

class MainRoute {
  static const String name = '/main';
  static GoRoute route = GoRoute(
    name: name,
    path: name,
    // redirect: (context, state) {
    //   if (!CacheStorageServices().hasToken) return LoginRoute.name;
    //   return null;
    // },
    builder: (context, state) => const MainScreen(),
  );
}
