import 'package:big_bite/modules/home/presentation/screens/show_news_details_screen.dart';
import 'package:go_router/go_router.dart';

class ShowNewsDetailsRoute {
  static const name = '/showNewsDetails';
  static GoRoute route = GoRoute(
    path: '/showNewsDetails/:id',
    name: name,
    builder: (context, state) => ShowNewsDetailsScreen(
      id: state.pathParameters["id"]!,
    ),
  );
}
