import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../scaffold/presentation/pages/app_scaffold_page.dart';
import 'chart_page_route.dart';
import 'leaderboard_page_route.dart';
import 'list_page_route.dart';
import 'page_builder.dart';
import 'random_quote_page_route.dart';

ShellRoute getAppScaffoldPageRoute() {
  return ShellRoute(
      pageBuilder: (
        BuildContext context,
        GoRouterState state,
        Widget child,
      ) =>
          createPage(
            state,
            AppScaffoldPage(child: child),
            pageAnimation: PageAnimation.fade,
          ),
      routes: [
        getListPageRoute(),
        getChartPageRoute(),
        getLeaderboardPageRoute(),
        getRandomQuotePageRoute(),
      ]);
}
