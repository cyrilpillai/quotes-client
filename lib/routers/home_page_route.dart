import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../home/presentation/pages/home_page.dart';
import 'page_builder.dart';

const homeRoute = 'home';

GoRoute getHomePageRoute() {
  return GoRoute(
    name: homeRoute,
    path: '/',
    pageBuilder: (BuildContext context, GoRouterState state) =>
        createPage(state, const HomePage()),
  );
}
