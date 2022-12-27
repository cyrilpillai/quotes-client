import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../chart/presentation/pages/quote_chart_page.dart';
import 'page_builder.dart';

const chartRoute = '/chart';

GoRoute getChartPageRoute() {
  return GoRoute(
    name: chartRoute,
    path: chartRoute,
    pageBuilder: (BuildContext context, GoRouterState state) => createPage(
      state,
      const QuoteChartPage(),
      pageAnimation: PageAnimation.fade,
    ),
  );
}
