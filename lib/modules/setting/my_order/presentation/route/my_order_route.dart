import 'package:big_bite/modules/setting/my_order/presentation/screen/my_order_screen.dart';
import 'package:go_router/go_router.dart';

class MyOrderRoute {
  static const name = "/myOrder";

  static GoRoute route = GoRoute(
    path: name,
    name: name,
    builder: (context, state) =>const MyOrderScreen(),
  );
}
