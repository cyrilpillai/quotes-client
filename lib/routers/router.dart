import 'package:go_router/go_router.dart';
import 'package:quotes/routers/random_quote_page_route.dart';

import 'add_page_route.dart';
import 'chart_page_route.dart';
import 'detail_page_route.dart';
import 'edit_page_route.dart';
import 'home_page_route.dart';
import 'leaderboard_page_route.dart';
import 'list_page_route.dart';

GoRouter getRouter() {
  return GoRouter(
    routes: <RouteBase>[
      getHomePageRoute(),
      getListPageRoute(),
      getAddPageRoute(),
      getEditPageRoute(),
      getDetailPageRoute(),
      getChartPageRoute(),
      getRandomQuotePageRoute(),
      getLeaderboardPageRoute(),
    ],
  );
}
