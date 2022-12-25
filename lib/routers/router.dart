import 'package:go_router/go_router.dart';

import 'home_page_route.dart';

GoRouter getRouter() {
  return GoRouter(
    routes: <RouteBase>[getHomePageRoute()],
  );
}
