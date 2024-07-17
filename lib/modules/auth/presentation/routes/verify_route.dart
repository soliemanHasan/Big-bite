import 'package:big_bite/modules/auth/presentation/screens/verify_screen.dart';
import 'package:go_router/go_router.dart';

class VerifyRoute {
  static const String name = '/verify';

  static GoRoute route = GoRoute(
    path: '/verify/:number',
    name: name,
    // redirect: (context, state) {
    //   storage handler has token
    //   return
    // },
    builder: (context, state) => VerifyScreen(
      number: state.pathParameters["number"]!,
    ),
  );
}
