import 'package:big_bite/modules/start/start_screen.dart';
import 'package:go_router/go_router.dart';

class StartRoute {
  static const name = '/start';
  static GoRoute route = GoRoute(path: name,name: name,
  builder: (context, state) =>const StartScreen(),);
}
