import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../scaffold/presentation/app_scaffold_page.dart';
import 'add_page_route.dart';
import 'chart_page_route.dart';
import 'detail_page_route.dart';
import 'edit_page_route.dart';
import 'leaderboard_page_route.dart';
import 'list_page_route.dart';
import 'random_quote_page_route.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

GoRouter getRouter() {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: listRoute,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return AppScaffoldPage(child: child);
        },
        routes: [
          getListPageRoute(),
          getChartPageRoute(),
          getLeaderboardPageRoute(),
          getRandomQuotePageRoute(),
        ],
      ),
      getAddPageRoute(parentNavigatorKey: _rootNavigatorKey),
      getDetailPageRoute(parentNavigatorKey: _rootNavigatorKey),
      getEditPageRoute(parentNavigatorKey: _rootNavigatorKey),
    ],
  );
}
