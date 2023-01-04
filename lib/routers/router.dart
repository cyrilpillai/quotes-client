import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import 'add_page_route.dart';
import 'app_scaffold_page_route.dart';
import 'detail_page_route.dart';
import 'edit_page_route.dart';
import 'list_page_route.dart';

GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter getRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: listRoute,
    routes: [
      getAppScaffoldPageRoute(),
      getAddPageRoute(parentNavigatorKey: _rootNavigatorKey),
      getDetailPageRoute(parentNavigatorKey: _rootNavigatorKey),
      getEditPageRoute(parentNavigatorKey: _rootNavigatorKey),
    ],
  );
}
