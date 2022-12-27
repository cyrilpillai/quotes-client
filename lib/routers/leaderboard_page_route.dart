import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../leaderboard/presentation/pages/leaderboard_page.dart';
import 'page_builder.dart';

const leaderboardRoute = '/leaderboard';

GoRoute getLeaderboardPageRoute() {
  return GoRoute(
    name: leaderboardRoute,
    path: leaderboardRoute,
    pageBuilder: (BuildContext context, GoRouterState state) => createPage(
      state,
      const LeaderboardPage(),
      pageAnimation: PageAnimation.fade,
    ),
  );
}
