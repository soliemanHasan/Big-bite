import 'package:go_router/go_router.dart';
import '../screens/register_screen.dart';

class RegisterRoute {
  static const String name = '/register';

  static GoRoute route = GoRoute(
    name: name,
    path: name,
    builder: (context, state) => RegisterScreen(),
  );
}
